//
//  Order.swift
//  CEats
//
//  Created by 박범수 on 2023/09/04.
//

import Foundation

struct Order: Identifiable, Codable {
    var id: String
    var orderer: User
    var restaurantName : Restaurant //
    var orderedMenu: [Restaurant.Food]
    var deliveryTime: Int
    var totalFee: Int
    var rtrRequest: String?
    var deliveryRequest: String?
    var orderStatus: OrderStatus = .waiting //여기도 불값이 되어야 하지 않나. 수락 받기 전 상태
    
    enum OrderStatus: Codable {
        case waiting, canceled, accepted
    }
}

#if DEBUG
extension Order {
    static let sampleData: Self = .init(id: UUID().uuidString, orderer: .sampleData, restaurantName: .sampleData, orderedMenu: [Restaurant.Food(name: "핫후라이드", price: 10000, isRecommend: true, foodCategory: "치킨", description: "치킨"), Restaurant.Food(name: "치킨 뭐 다른 메뉴요", price: 11500, isRecommend: false, foodCategory: "치킨", description: "치킨")], deliveryTime: 50, totalFee: 0)
}
#endif


