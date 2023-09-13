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
    static let dummyArray: [Self] = [
        .init(
            restaurant: restaurant1,
         orders: [],
         orderAcceptanceRate: 0,
         averageAcceptanceTime: 0
        ),
        .init(
            restaurant: restaurant2,
         orders: [],
         orderAcceptanceRate: 0,
         averageAcceptanceTime: 0
        ),
        .init(
            restaurant: restaurant3,
         orders: [],
         orderAcceptanceRate: 0,
         averageAcceptanceTime: 0
        ),
        .init(
            restaurant: restaurant4,
         orders: [],
         orderAcceptanceRate: 0,
         averageAcceptanceTime: 0
        ),
        .init(
            restaurant: restaurant5,
         orders: [],
         orderAcceptanceRate: 0,
         averageAcceptanceTime: 0
        ),
        .init(
            restaurant: restaurant6,
         orders: [],
         orderAcceptanceRate: 0,
         averageAcceptanceTime: 0
        ),
        .init(
            restaurant: restaurant7,
         orders: [],
         orderAcceptanceRate: 0,
         averageAcceptanceTime: 0
        ),
        .init(
            restaurant: restaurant8,
         orders: [],
         orderAcceptanceRate: 0,
         averageAcceptanceTime: 0
        ),
        .init(
            restaurant: restaurant9,
         orders: [],
         orderAcceptanceRate: 0,
         averageAcceptanceTime: 0
        ),
        .init(
            restaurant: restaurant10,
         orders: [],
         orderAcceptanceRate: 0,
         averageAcceptanceTime: 0
        ),
        .init(
            restaurant: restaurant11,
         orders: [],
         orderAcceptanceRate: 0,
         averageAcceptanceTime: 0
        ),
        .init(
            restaurant: restaurant12,
         orders: [],
         orderAcceptanceRate: 0,
         averageAcceptanceTime: 0
        ),
        .init(
            restaurant: restaurant13,
         orders: [],
         orderAcceptanceRate: 0,
         averageAcceptanceTime: 0
        ),
        .init(
            restaurant: restaurant14,
         orders: [],
         orderAcceptanceRate: 0,
         averageAcceptanceTime: 0
        ),
        .init(
            restaurant: restaurant15,
         orders: [],
         orderAcceptanceRate: 0,
         averageAcceptanceTime: 0
        ),
    ]
}
