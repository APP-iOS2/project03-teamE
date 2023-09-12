//
//  Coupon.swift
//  CEatsManager
//
//  Created by 박범수 on 2023/09/12.
//

import Foundation

struct Coupon: Identifiable, Codable {
    var id = UUID().uuidString
    var restaurant: Restaurant
    var discount: Int
    var priceCondition: Int
    var endDate: Date
}

#if DEBUG
extension Coupon {
    static let sampleData: Self = .init(restaurant: Restaurant.sampleData, discount: 1000, priceCondition: 30000, endDate: Date().addingTimeInterval(86400 * 7))
}
#endif
