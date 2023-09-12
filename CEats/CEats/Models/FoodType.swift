//
//  FoodType.swift
//  CEats
//
//  Created by 박범수 on 2023/09/04.
//

import Foundation

enum FoodType: String, CaseIterable, Identifiable, Codable {
    var id: String {
        get {
            self.rawValue
        }
        set {
            print(newValue)
        }
    }

   case korean = "한식"
   case chicken = "치킨"
   case koreanSnack = "간식"
   case jokbalbossam = "족발/보쌈"
   case steamed = "찜/탕"
   case pizza = "피자"
   case chinese = "짜장면"
   case japanese = "일식"
   case western = "양식"
   case coffeeAndTea = "커피"
   case dessert = "디저트"
   case fastFood = "패스트푸드"
   
//   var id: String { self.rawValue }
}
