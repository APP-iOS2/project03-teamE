//
//  RestaurantViewModel.swift
//  CEats
//
//  Created by 유하은 on 2023/09/04.
//

import Foundation

final class RestaurantViewModel: ObservableObject {
    @Published var restaurants: [Restaurant] = [
        Restaurant(id: "ceoId", password: "1234", name: "멋쟁이 김치찌개", reviews: [Review(writer: "김멋사", score: 4.0, contents: "맛있긴 함"),Review(writer: "아이유", score: 5.0, contents: "최고의 맛이었어요 ㅠㅠ")], deliveryFee: 3000, minimumPrice: 14000, menus: [Food(name: "김치찌개", price: 8000, isRecommend: true, foodCategory: "김치찌개", description: "멋쟁이 김치찌개 인기메뉴", image: " "),Food(name: "소주", price: 4000, isRecommend: false, foodCategory: "주류", description: "처음처럼")], mainImage: "", foodType: [.korean], foodCategory: ["식사","사이드","주류"], latitude: 32.44, longitude: 55.22),
        Restaurant(id: "ceoId2", password: "1234", name: "엽기떡볶이", reviews: [Review(writer: "유하은", score: 3.0, contents: "다른 엽떡 지점에 비해 별로예요"),Review(writer: "함지수", score: 5.0, contents: "최고의 맛이었어요 ㅠㅠ")], deliveryFee: 2000, minimumPrice: 16000, menus: [Food(name: "동대문 엽기 떡볶이", price: 14000, isRecommend: true, foodCategory: "떡볶이", description: "엽떡 인기메뉴", image: " "),Food(name: "동대문 엽기 오뎅", price: 14000, isRecommend: false, foodCategory: "떡볶이", description: "떡볶이 30% 오뎅 70%")], mainImage: "", foodType: [.koreanSnack], foodCategory: ["떡볶이","사이드","주류"], latitude: 34.44, longitude: 129.22),
        Restaurant(id: "ceoId3", password: "1234", name: "굴다리김치찌개", grade: 5.0, reviews: [Review(writer: "함지수", score: 5.0, contents: "맛있어요"), Review(writer: "봉주헌", score: 5.0, contents: "존맛탱"), Review(writer: "장여훈", score: 5.0, contents: "굿")], deliveryFee: 2400, minimumPrice: 13000, menus: [Food(name: "김치찌개", price: 8000, isRecommend: true, foodCategory: "김치찌개", description: "멋쟁이 김치찌개 인기메뉴", image: " "),Food(name: "소주", price: 4000, isRecommend: false, foodCategory: "주류", description: "처음처럼")], mainImage: " ", foodType: [.korean], foodCategory: ["식사","사이드","주류"], latitude: 44.32, longitude: 22.222),
        Restaurant(id: "ceoId4", password: "1234", name: "BHC 치킨", reviews: [Review(writer: "유하은", score: 3.0, contents: "다른 bhc 지점에 비해 별로예요"),Review(writer: "함지수", score: 5.0, contents: "최고의 맛이었어요 ㅠㅠ")], deliveryFee: 2000, minimumPrice: 16000, menus: [Food(name: "뿌링클", price: 18000, isRecommend: true, foodCategory: "치킨", description: "bhc 인기메뉴", image: " "),Food(name: "핫후라이드 치킨", price: 14000, isRecommend: false, foodCategory: "치킨", description: "매운 치킨")], mainImage: "", foodType: [.chicken], foodCategory: ["치킨"], latitude: 34.44, longitude: 129.22),
    ]
}
