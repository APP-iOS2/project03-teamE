//
//  Restaurant.swift
//  CEats
//
//  Created by 박범수 on 2023/09/04.
//

import Foundation

struct Restaurant {
    var restaurantID: String
    var password: String
    var name: String //음식점 이름
    var grade: Double //음식점 평점
    var reviews: [Review]
    var deliveryFee : Int
    var minimumPrice: Int
    var menus: [Food]
    var mainImage: String //가게 메인 이미지
    var foodType: [FoodType]
    var foodCategory: [String]
    var latitude: Double//위도
    var longitude: Double //경도
}
