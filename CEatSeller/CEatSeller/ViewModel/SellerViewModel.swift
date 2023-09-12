//
//  SellerViewModel.swift
//  CEatSeller
//
//  Created by 박범수 on 2023/09/12.
//

import Foundation

final class SellerViewModel: ObservableObject {
    @Published var isOpen = false
    @Published var seller: Seller = Seller.sampleData
    
    let fireManager = CEatsFBManager.shared

    var titleMessage: String {
        isOpen ? "신규 주문 받는중" : "쉬는중"
    }
    
    func updateTimeTable(data: Seller, to: String){
        seller.restaurant.restaurantInfo.timeTable = to
        fireManager.create(data: data)
    }
}
