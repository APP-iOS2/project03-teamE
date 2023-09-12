//
//  Seller.swift
//  CEatSeller
//
//  Created by 박범수 on 2023/09/12.
//

import Foundation

struct Seller: Encodable, CEatsIdentifiable {
    let id: String
    var name: String
    var score: Double
    var orderAcceptanceRate: Double
    var averageAcceptanceTime: Double
    
    var scoreToString: String {
        String(format: "%.1f", score)
    }
    var rateToString: String {
        String(format: "%.0f", orderAcceptanceRate)
    }
    var timeToString: String {
        String(format: "%.0f", averageAcceptanceTime)
    }
    
    var restaurant: Restaurant
    var order: [Order]
}


extension Seller {
    static let sampleData: Self = .init(id: "Test123", name: "멋쟁이 김치처럼", score: 4.5, orderAcceptanceRate: 99, averageAcceptanceTime: 10, restaurant: Restaurant.sampleData, order: [Order.sampleData])
}
