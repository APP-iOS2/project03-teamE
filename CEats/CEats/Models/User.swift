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
    var reviews: [Review]
    var coupons: [Coupon]
    struct Cart: Codable {
        var restaurant: Restaurant
        var restaurantName: String {
            return restaurant.name
        }
        var cart: [Restaurant.Food] // [filter] 푸드의 이름이 같은 것 count 해서 숫자 사용
//        var fee: Int {
//            let totalFoodFee = cart.map({ $0.price * $0.foodCount }).reduce(0) { $0 + $1 }
//            return totalFoodFee + restaurant.deliveryFee
//        }
        
    }
}

#if DEBUG
extension User {
    static let sampleData: Self = User(id: "1234", username: "유민영", email: "newJean@naver.com", phoneNumber: "010-0000-0000", userAddress: "노원구 공롱동 12-34", favoriteRestaurant: [], orderHistory: [], foodCart: Cart(restaurant: Restaurant.sampleData, cart: []) , latitude: 0 ,longitude: 0, reviews: [Review(writer: "유민영", score: 4.0, image: "egg", contents: "김치찌개보다 계란말이가 맛있어요"),Review(writer: "유민영", score: 5.0, image: "chicken2", contents: "어떻게 이렇게 맛있을 수가 있어요 정말 믿을 수 없는 간장치킨의 향연임")], coupons: [.sampleData, .sampleData2])
}
#endif
