//
//  UserViewModel.swift
//  CEats
//
//  Created by 박범수 on 2023/09/07.
//

import SwiftUI
import Firebase

final class UserViewModel: ObservableObject {
    @AppStorage("userID") private var userID = "1234"
    @Published var user: User = User.sampleData
    @Published var selectedButton: OrderState = .과거주문내역
    @Published var deliveryOpt: DeliveryKind = .onlyOne
    let fireManager = CEatsFBManager.shared
    private var orderListener: ListenerRegistration?
    let currentDate = Date()
    @Published var newOrderID: String = ""
    var statusMessage: String {
        guard let index = user.orderHistory.firstIndex(where: { $0.id == newOrderID }) else { return "Error" }
        return user.orderHistory[index].orderStatus.message
    }
    var cartFee: Int {
        guard let foodCart = user.foodCart else { return 0 }
        return foodCart.cart.map({ $0.price * $0.foodCount }).reduce(0) { $0 + $1 }
    }
    
    var filteredOrderList: [Order] {
        if selectedButton == .과거주문내역 {
            return user.orderHistory.filter { $0.orderStatus != .waiting }
        } else {
            return user.orderHistory.filter { $0.orderStatus == .waiting }
        }
    }
    
    //    func recommendFoods(food: [Restaurant.Food]?, restaurant: Restaurant?) -> [Restaurant.Food] {
    //        var menus = restaurant!.menus
    //
    //        if menus.count < 3 {
    //            return restaurant!.menus
    //        }
    //
    //        for selectedFood in food {
    //            menus.removeAll { $0.name == selectedFood.name }
    //        }
    //
    //        return menus
    //    }
      
    func calculateDateDifference(previous: Date) -> (month: Int?, day: Int?, hour: Int?, minute: Int?, second: Int?) {
        let day = Calendar.current.dateComponents([.day], from: previous, to: currentDate).day
        let month = Calendar.current.dateComponents([.month], from: previous, to: currentDate).month
        let hour = Calendar.current.dateComponents([.hour], from: previous, to: currentDate).hour
        let minute = Calendar.current.dateComponents([.minute], from: previous, to: currentDate).minute
        let second = Calendar.current.dateComponents([.second], from: previous, to: currentDate).second
        
        return (month: month, day: day, hour: hour, minute: minute, second: second)
    }
  
    func login() {
        fetchUser {
            self.orderHistoryHasWaiting()
        }
    }
    
    func addCount(food: Restaurant.Food){
        if let index = user.foodCart?.cart.firstIndex(where: { $0.name == food.name }) {
            user.foodCart?.cart[index].foodCount += 1
            fireManager.create(data: user)
        }
    }
    
    func subtractCount(food: Restaurant.Food){
        if let index = user.foodCart?.cart.firstIndex(where: { $0.name == food.name }) {
            user.foodCart?.cart[index].foodCount -= 1
            fireManager.create(data: user)
        }
    }
    
    func orderHistoryHasWaiting() {
        let waitings = user.orderHistory.filter { $0.orderStatus == .waiting }
        if !waitings.isEmpty {
            let watingOrder = waitings[0]
            self.fireManager.addCollectionSnapshot(data: watingOrder, value: \.orderStatus) { changeStatus in
                guard let index = self.user.orderHistory.firstIndex(where: { $0.id == watingOrder.id }) else {
                    print(#function + ": fail to optional bind - index")
                    return
                }
                self.user.orderHistory[index].orderStatus = changeStatus
            }
        } else {
            print("waiting order 없음")
        }
    }
    
    func newOrder(completion: @escaping (Order) -> ()) {
        guard let menus = user.foodCart?.cart else {
            print(#function + ": fail to optional bind - menus")
            return
        }
        guard let restaurant = user.foodCart?.restaurant else {
            print(#function + ": fail to optional bind - restaurant")
            return
        }
        
        let newOrder = Order(id: "\(user.username).\(user.orderHistory.count)", orderer: user.username, restaurant: restaurant, orderedMenu: menus)
        fireManager.read(type: Seller.self, id: restaurant.id) { seller in
            self.fireManager.appendValue(data: seller, value: \.orders, to: newOrder) {
                self.fireManager.appendValueResult(data: self.user, value: \.orderHistory, to: newOrder) { success in
                    self.user.orderHistory.append(success)
                    self.user.cEatsMoney -= self.cartFee + self.deliveryOpt.fee
                    self.user.foodCart = nil
                    self.fireManager.create(data: self.user) {
                        self.fireManager.addSnapshot(data: seller, value: \.orders) { orders in
                            let sellersWaitings = self.user.orderHistory.filter { $0.orderStatus == .waiting }
                            guard !sellersWaitings.isEmpty else { return }
                            guard let myWaiting = sellersWaitings.first else {
                                print(#function + ": fail to optional bind - myWaiting")
                                return
                            }
                            let resultArr = orders.filter { $0.id == myWaiting.id }
                            guard !resultArr.isEmpty else { return }
                            guard let myWaitingOrder = resultArr.first else {
                                print(#function + ": fail to optional bind - myWaitingOrder")
                                return
                            }
                            guard let index = self.user.orderHistory.firstIndex(where: { $0.id == myWaitingOrder.id }) else {
                                print(#function + ": fail to optional bind - index")
                                return
                            }
                            completion(myWaiting)
                            self.user.orderHistory[index] = myWaitingOrder
                            self.newOrderID = myWaitingOrder.id
                        } completion: { listener in
                            self.orderListener = listener
                        }
                    }
                }
            }
        }
    }
    
    func fetchUser(completion: @escaping () -> ()) {
        fireManager.read(type: User.self, id: userID) { result in
            self.user = result
            completion()
        }
    }
    
    
    func getMyReview()->[Review]{
        var userReview: [Review] = []
        fireManager.readAllDocument(type: Restaurant.self) { data in
            for index in 0..<data.reviews.count {
                if data.reviews[index].writer == self.user.username {
                    userReview.append(data.reviews[index])
                }
            }
        }
        return userReview
    }
    
   
    
    func updateUserLocation(user: User, lat: Double, long: Double, adress: String) async {
        fireManager.update(data: user, value: \.latitude, to: lat) { result in
            self.user = result
        }
        fireManager.update(data: user, value: \.longitude, to: long) { result in
            self.user = result
        }
        fireManager.update(data: user, value: \.userAddress, to: adress) { result in
            self.user = result
        }
    }
    
    func updateUserCart(restaurant: Restaurant, food: Restaurant.Food) {
        user.foodCart?.cart.append(food)
        fireManager.create(data: user)
    }
    
    func getLikeImageName(restaurant: Restaurant) -> String {
        return user.favoriteRestaurant.contains(where: { $0.id == restaurant.id }) ? "heart.fill" : "heart"
    }
    
    func likeButtonTapped(restaurant: Restaurant) {
        let isLiked = user.favoriteRestaurant.contains(where: { $0.id == restaurant.id })
        if isLiked {
            guard let index = user.favoriteRestaurant.firstIndex(where: { $0.id == restaurant.id }) else { return }
            user.favoriteRestaurant.remove(at: index)
        } else {
            user.favoriteRestaurant.append(restaurant)
        }
    }
}

extension UserViewModel {
    enum OrderState: String, CaseIterable {
        case 과거주문내역
        case 준비중
    }
    
    enum DeliveryKind: CaseIterable {
        case onlyOne, save
        
        var toString: String {
            switch self {
            case .onlyOne:
                return "한집배달"
            case .save:
                return "세이브배달"
            }
        }
        
        var deliveryTime: String {
            switch self {
            case .onlyOne:
                return "29 ~ 39"
            case .save:
                return "34 ~ 43"
            }
        }
        
        var fee: Int {
            switch self {
            case .onlyOne:
                return 3000
            case .save:
                return 2000
            }
        }
    }
}
