//
//  Seller.swift
//  CEats
//
//  Created by 박범수 on 2023/09/07.
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
}

extension Seller {
    static let sampleData: Self = .init(restaurant: .sampleData, orders: [], orderAcceptanceRate: 0, averageAcceptanceTime: 0)
}
