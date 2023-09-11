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
    var orderedAt: Double = Date().timeIntervalSince1970
    var orderDate: String {
        let dateOrderedAt: Date = Date(timeIntervalSince1970: orderedAt)
        
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_kr")
        dateFormatter.timeZone = TimeZone(abbreviation: "KST")
        dateFormatter.dateFormat = "MM월dd일 HH:mm"
        return dateFormatter.string(from: dateOrderedAt)
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
    static let sampleData: Self = .init(id: UUID().uuidString, orderer: "김민지", restaurantName: .sampleData, orderedMenu: [Restaurant.Food(name: "김치찌개", price: 10000, isRecommend: true, foodCategory: "김치찌개", description: "멋쟁이 김치찌개 인기메뉴"), Restaurant.Food(name: "공기밥", price: 1500, isRecommend: false, foodCategory: "밥", description: "")], orderStatus: .canceled)
}
#endif


