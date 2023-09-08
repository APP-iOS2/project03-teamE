//
//  Order.swift
//  CEats
//
//  Created by 박범수 on 2023/09/04.
//

import Foundation

struct Order: Identifiable, Codable {
    var id: String
    var orderer: String //이거 문제있음
    var restaurantName : Restaurant //
    var orderedMenu: [Restaurant.Food]
    var rtrRequest: String?
    var deliveryRequest: String?
    var orderStatus: OrderStatus = .waiting
    var deliveryTime: String {
        return restaurantName.deliveryTime
    }
    var totalFee: Int {
        let totalFoodFee = orderedMenu.map({ $0.price }).reduce(0) { $0 + $1 }
        return totalFoodFee + restaurantName.deliveryFee
    }
    
    enum OrderStatus: Codable {
            case waiting, canceled, accepted
            
            var toString: String {
                switch self {
                case .waiting:
                    return "준비중"
                case .canceled:
                    return "주문 취소됨"
                case .accepted:
                    return "주문 완료됨"
                }
            }
        }
}

#if DEBUG
extension Order {
    static let sampleData: Self = .init(id: UUID().uuidString, orderer: "김민지", restaurantName: .sampleData, orderedMenu: [Restaurant.Food(name: "핫후라이드", price: 10000, isRecommend: true, foodCategory: "치킨", description: "치킨"), Restaurant.Food(name: "치킨 뭐 다른 메뉴요", price: 11500, isRecommend: false, foodCategory: "치킨", description: "치킨")], orderStatus: .waiting)
}
#endif


