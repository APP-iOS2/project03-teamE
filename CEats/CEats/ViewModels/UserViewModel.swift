//
//  UserViewModel.swift
//  CEats
//
//  Created by 박범수 on 2023/09/07.
//

import SwiftUI
import Firebase

final class UserViewModel: ObservableObject {
    @AppStorage("userID") var userID = "1234"
    @Published var user: User = User.sampleData
    @Published var selectedButton: OrderState = .과거주문내역
    
    let fireManager = CEatsFBManager.shared
    var orderListener: ListenerRegistration?
    enum OrderState: String, CaseIterable {
        case 과거주문내역
        case 준비중
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
    func login() {
        fetchUser {
            self.orderHistoryHasWaiting()
        }
    }
    
    func addCount(food: Restaurant.Food){
        if let index = self.user.foodCart?.cart.firstIndex(where: { $0.name == food.name }) {
            self.user.foodCart?.cart[index].foodCount += 1
        }
    }
    
    func subtractCount(food: Restaurant.Food){
        if let index = self.user.foodCart?.cart.firstIndex(where: { $0.name == food.name }) {
            self.user.foodCart?.cart[index].foodCount -= 1
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
    
    func newOrder(restaurant: Restaurant, completion: @escaping ([Order]) -> ()) {
        guard let menus = user.foodCart?.cart else {
            print(#function + ": fail to optional bind - menus")
            return
        }
        let newOrder = Order(id: "\(user.username).\(user.orderHistory.count)", orderer: user.username, restaurant: restaurant, orderedMenu: menus)
        fireManager.read(type: Seller.self, id: restaurant.id) { seller in
            self.fireManager.appendValue(data: seller, value: \.orders, to: newOrder) {
                self.fireManager.appendValueResult(data: self.user, value: \.orderHistory, to: newOrder) { success in
                    self.user.orderHistory.append(success)
                    self.fireManager.updateValue(data: self.user, value: \.foodCart, to: nil) { user in
                        self.user = user
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
                            self.user.orderHistory[index] = myWaitingOrder
                        } completion: { listener in
                            self.orderListener = listener
                        }
                    }
                }
//                self.fireManager.appendValue(data: self.user, value: \.orderHistory, to: newOrder) { orderID in
//                    self.user.foodCart = nil
//                    self.fireManager.create(data: self.user) {
//                    }
//                    self.fireManager.create(data: newOrder) {
//                        self.user.orderHistory.append(newOrder)
//                        self.user.foodCart = nil
//                        self.fireManager.addCollectionSnapshot(data: newOrder, value: \.orderStatus) { changeStatus in
//                            guard let index = self.user.orderHistory.firstIndex(where: { $0.id == newOrder.id }) else {
//                                print(#function + ": fail to optional bind - index")
//                                return
//                            }
//                            self.user.orderHistory[index].orderStatus = changeStatus
//                        }
//                    }
//                }
            }
        }
    }
    
    func fetchUser(completion: @escaping () -> ()) {
        fireManager.read(type: User.self, id: userID) { result in
            self.user = result
            completion()
        }
    }
    
    func updateUserLocation(user: User, lat: Double, long: Double, adress: String) {
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
    
    func updateUserOrder(user: User, order: [Order]){
        fireManager.update(data: user, value: \.orderHistory, to: order) { result in
            self.user = result
        }
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
