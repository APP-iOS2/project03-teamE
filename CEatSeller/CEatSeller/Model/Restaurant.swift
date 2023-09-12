//
//  Restaurant.swift
//  CEatSeller
//
//  Created by 박범수 on 2023/09/12.
//

import Foundation

struct Restaurant: Identifiable, Codable, CEatsIdentifiable {
    var id: String
    var password: String
    var restaurantInfo: RestaurantInfo
    var name: String //음식점 이름
    var reviews: [Review]
    var deliveryFee : Int // 배달비
    var minimumPrice: Int
    var menus: [Restaurant.Food]
    var mainImage: [String] //가게 메인 이미지
    var foodType: [FoodType]
    var foodCategory: [String]
//    var seller: Seller
    var latitude: Double//위도
    var longitude: Double //경도
    var score: Double? {
        guard !reviews.isEmpty else { return nil }
        var temp: Double = 0.0
        reviews.forEach { temp += $0.score }
        temp /= Double(reviews.count)
        return temp
    }
    var scoreMessage: String {
        return score != nil ? String(format: "%.1f", score!) : "리뷰가 없습니다"
    }
    
    var deliveryTime: String {
        return "20 ~ 30 분"
    }
    
    struct Food: Codable {
        var name: String //메뉴이름
        var price: Int //메뉴 가격
        var isRecommend: Bool //추천여부 추천이면 가게 클릭시 상단에 뜸
        var foodCategory: String
        var description: String // 메뉴설명
        var image: String?
        var foodCount: Int = 1
        // var option: 추가옵션
        var priceToString: String {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            guard let result = formatter.string(from: price as NSNumber) else { return "" }
            return result
        }
    }
}

#if DEBUG
extension Restaurant.Food {
    static let sampleData = Restaurant.Food(name: "피자", price: 16000, isRecommend: false, foodCategory: "양식", description: "많이 매우니 참고해주세요", image: "pizza")
}

extension Restaurant {
    static let sampleData = Restaurant(id: "ceoId", password: "1234", restaurantInfo: RestaurantInfo(phoneNumber: 01065483210, name: "멋쟁이 김치찌개", timeTable: "12:00~ 23:00", introduce: "대한민국 최고의 멋쟁이 김치찌개 집입니다."), name: "멋쟁이 김치찌개", reviews: [
        Review(writer: "김멋사", score: 4.0, image: "kimchiSoup", contents: "맛있긴 함"),
        Review(writer: "아이유", score: 5.0, image: "soju", contents: "최고의 맛이었어요 ㅠㅠ")
    ], deliveryFee: 3000, minimumPrice: 14000, menus: [Food(name: "김치찌개", price: 8000, isRecommend: true, foodCategory: "김치찌개", description: "멋쟁이 김치찌개 인기메뉴", image: "kimchijjigae"),Food(name: "소주", price: 4000, isRecommend: false, foodCategory: "주류", description: "처음처럼",image: "soju")], mainImage: ["kimchijjigae"], foodType: [.korean], foodCategory: ["식사","사이드","주류"], latitude: 37.5718, longitude: 126.9769)
}
#endif
