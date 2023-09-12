//
//  SellerViewModel.swift
//  CEatSeller
//
//  Created by 박범수 on 2023/09/12.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

final class SellerViewModel: ObservableObject {
    @AppStorage("sellerID") var sellerID = "ceoId"
    @Published var isOpen = false {
        didSet {
            seller.restaurant.isOpen = isOpen
            fireManager.create(data: seller) {
                if self.isOpen {
                    self.startBusiness()
                } else {
                    self.orderListener?.remove()
                    self.orderListener = nil
                }
            }
        }
    }
    @Published var newOrder: Order? = nil {
        didSet {
            if newOrder != nil {
                hasNewOrder = true
            }
        }
    }
    @Published var hasNewOrder: Bool = false
    @Published var seller: Seller = Seller.sampleData
    
    let fireManager = CEatsFBManager.shared
    var orderListener: ListenerRegistration?
    
    var titleMessage: String {
        isOpen ? "신규 주문 받는중" : "쉬는중"
    }
    
    func getMyRestaurantOrder(){
        fireManager.readAllDocument(type: Order.self) { data in
            if data.restaurant.name == self.seller.restaurant.name {
                self.seller.orders.append(data)
            }
        }
    }
    
    func StatusButtonTapped(kind: Order.OrderStatus) {
        guard let newOrder else {
            print(#function + ": fail to optional bind")
            return
        }
        var updateOrder = newOrder
        updateOrder.orderStatus = kind
        fireManager.updateValue(data: seller, value: \.orders, to: updateOrder) { result in
            self.hasNewOrder = false
        }
    }
    
    func updateTimeTable(data: Seller, to: String){
        seller.restaurant.restaurantInfo.timeTable = to
        fireManager.create(data: data)
    }
    
    func login() {
        fetchSeller {
            
        }
    }
    
    func fetchSeller(completion: @escaping () -> ()) {
        fireManager.read(type: Seller.self, id: sellerID) { result in
            self.seller = result
            completion()
        }
    }
    
    func startBusiness() {
        self.fireManager.addSnapshot(data: self.seller, value: \.orders) { listener in
            self.orderListener = listener
        } resultCompletion: { result in
            self.seller.orders = result
            let waitings = result.filter { $0.orderStatus == .waiting }
            if !waitings.isEmpty {
                self.newOrder = waitings.first
            } else {
                self.newOrder = nil
            }
        }
    }
}

