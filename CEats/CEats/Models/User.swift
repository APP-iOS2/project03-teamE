//
//  User.swift
//  CEats
//
//  Created by 박범수 on 2023/09/04.
//

import Foundation

struct User: Identifiable, Codable, CEatsIdentifiable, Equatable {
    static func == (lhs: User, rhs: User) -> Bool {
        lhs.id == rhs.id
    }
    
    var id: String
    var username: String
    var email: String
    var phoneNumber: String
    var userAddress: String
    var favoriteRestaurant: [Restaurant] // 즐겨찾기
    var orderHistory: [Order] //
    var foodCart: Cart? //장바구니
    var cEatsMoney: Int = 100000
    var latitude: Double//위도
    var longitude: Double //경도
    
    struct Cart: Codable {
        var restaurant: Restaurant
        var restaurantName: String {
            return restaurant.name
        }
        var foodCart: [Restaurant.Food]
        var fee: Int {
            let totalFoodFee = foodCart.map({ $0.price }).reduce(0) { $0 + $1 }
            // foodCart.reduce(0){$0.price + $1.price} < 이렇게 써도 되지 안
            return totalFoodFee + restaurant.deliveryFee
        }
    }
}

#if DEBUG
extension User {
    static let sampleData: Self = User(id: "1234", username: "김민지", email: "newJean@naver.com", phoneNumber: "010-0000-0000", userAddress: "노원구 공롱동 12-34", favoriteRestaurant: [], orderHistory: [Order.sampleData], latitude: 0, longitude: 0)
}
#endif
