//
//  User.swift
//  CEats
//
//  Created by 박범수 on 2023/09/04.
//

import Foundation

struct User: Identifiable {
    var id: String
    var username: String
    var email: String
    var phoneNumber: String
    var latitude: Double//위도
    var longitude: Double //경도
    var favoriteRestaurant: [Restaurant]
    var orderHistory : [Order] //
    var foodCart: [Food] //장바구니
}


extension User {
    static let sampleData = User(id: "a1", username: "김멋사", email: "abc@gmail.com", phoneNumber: "010-1234-5678", latitude: 32.44, longitude: 55.22, favoriteRestaurant: [Restaurant(id: "b2", password: "1234", name: "홍길동", reviews: [Review(writer: "김멋사", score: 4.0, contents: "최고의 맛이었어요 ㅠㅠ")], deliveryFee: 3000, minimumPrice: 14000, menus: [Food(name: "김치찌개", price: 8000, isRecommend: true, foodCategory: "김치찌개", description: "멋쟁이 김치찌개 인기메뉴")], mainImage: [""], foodType: [.korean], foodCategory: ["식사","사이드","주류"], latitude: 32.44, longitude: 55.22)], orderHistory: [Order(id: "c3", orderer: <#T##User#>, restaurantName: <#T##Restaurant#>, orderedMenu: <#T##[Food]#>, deliveryTime: <#T##Int#>, totalFee: <#T##Int#>)], foodCart: <#T##[Food]#>)
}
