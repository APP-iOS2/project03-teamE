//
//  Seller.swift
//  CEatsManager
//
//  Created by 박범수 on 2023/09/12.
//

import Foundation

struct Seller: Identifiable, CEatsIdentifiable, Codable { //레스토랑 안에 넣고
    var restaurant: Restaurant
    var orders: [Order]
    var orderAcceptanceRate: Double
    var averageAcceptanceTime: Double
}

extension Seller {
    var id: String {
        restaurant.id
    }
    var name: String {
        restaurant.name
    }
    var score: Double {
        restaurant.score ?? 0
    }
    var scoreToString: String {
        String(format: "%.1f", score)
    }
    var rateToString: String {
        String(format: "%.0f", orderAcceptanceRate)
    }
    var timeToString: String {
        String(format: "%.0f", averageAcceptanceTime)
    }
}

extension Seller {
    static let sampleData: Self = .init(restaurant: Restaurant.sampleData, orders: [Order.sampleData], orderAcceptanceRate: 99, averageAcceptanceTime: 10)
}

