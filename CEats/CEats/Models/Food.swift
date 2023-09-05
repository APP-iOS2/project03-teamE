//
//  Food.swift
//  CEats
//
//  Created by 박범수 on 2023/09/04.
//

import Foundation

enum FoodType: String, CaseIterable, Identifiable {

   case korean = "한식"
   case chicken = "치킨"
   case koreanSnack = "간식"
   case jokbalbossam = "족발/보쌈"
   case steamed = "찜탕"
   case pizza = "피자"
   case chinese = "짜장면"
   case japanese = "일식"
   case western = "양식"
   case coffeeAndTea = "커피"
   case dessert = "디저트"
   case fastFood = "패스트푸드"
   
   var id: String { self.rawValue }
}

struct Food {
    var name: String //메뉴이름
    var price: Int //메뉴 가격
    var isRecommend: Bool //추천여부 추천이면 가게 클릭시 상단에 뜸
    var foodCategory: String
    var description: String // 메뉴설명
    var image: String?
    // var option: 추가옵션
    var priceToString: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        guard let result = formatter.string(from: price as NSNumber) else { return "" }
        return result
    }
}

#if DEBUG
extension Food {
    static let sampleData = Food(name: "피자", price: 16000, isRecommend: false, foodCategory: "양식", description: "많이 매우니 참고해주세요", image: "pizza")
}
#endif
