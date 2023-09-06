//
//  RestaurantViewModel.swift
//  CEats
//
//  Created by 유하은 on 2023/09/04.
//

import Foundation

final class RestaurantViewModel: ObservableObject {
    @Published var restaurants: [Restaurant] = [
        Restaurant(id: "ceoId", password: "1234", restaurantInfo: .init(), name: "멋쟁이 김치찌개", reviews: [Review(writer: "김멋사", score: 4.0, contents: "맛있긴 함"),Review(writer: "아이유", score: 5.0, contents: "최고의 맛이었어요 ㅠㅠ")], deliveryFee: 3000, minimumPrice: 14000, menus: [Food(name: "김치찌개", price: 8000, isRecommend: true, foodCategory: "김치찌개", description: "멋쟁이 김치찌개 인기메뉴", image: " "),Food(name: "소주", price: 4000, isRecommend: false, foodCategory: "주류", description: "처음처럼")], mainImage: [""], foodType: [.korean], foodCategory: ["식사","사이드","주류"], latitude: 32.44, longitude: 55.22),
        Restaurant(id: "ceoId2", password: "1234", restaurantInfo: .init(), name: "엽기떡볶이", reviews: [Review(writer: "유하은", score: 3.0, contents: "다른 엽떡 지점에 비해 별로예요"),Review(writer: "함지수", score: 5.0, contents: "최고의 맛이었어요 ㅠㅠ")], deliveryFee: 2000, minimumPrice: 16000, menus: [Food(name: "동대문 엽기 떡볶이", price: 14000, isRecommend: true, foodCategory: "떡볶이", description: "엽떡 인기메뉴", image: " "),Food(name: "동대문 엽기 오뎅", price: 14000, isRecommend: false, foodCategory: "떡볶이", description: "떡볶이 30% 오뎅 70%")], mainImage: [""], foodType: [.koreanSnack], foodCategory: ["떡볶이","사이드","주류"], latitude: 34.44, longitude: 129.22),
        Restaurant(id: "ceoId3", password: "1234", restaurantInfo: .init(), name: "굴다리김치찌개", reviews: [Review(writer: "함지수", score: 5.0, contents: "맛있어요"), Review(writer: "봉주헌", score: 3.0, contents: "존맛탱"), Review(writer: "장여훈", score: 5.0, contents: "굿")], deliveryFee: 2400, minimumPrice: 13000, menus: [Food(name: "김치찌개", price: 8000, isRecommend: true, foodCategory: "김치찌개", description: "멋쟁이 김치찌개 인기메뉴", image: " "),Food(name: "소주", price: 4000, isRecommend: false, foodCategory: "주류", description: "처음처럼")], mainImage: [""], foodType: [.korean], foodCategory: ["식사","사이드","주류"], latitude: 44.32, longitude: 22.222),
        Restaurant(id: "ceoId4", password: "1234", restaurantInfo: .init(), name: "BHC 치킨", reviews: [Review(writer: "유하은", score: 3.0, contents: "다른 bhc 지점에 비해 별로예요"),Review(writer: "함지수", score: 5.0, contents: "최고의 맛이었어요 ㅠㅠ")], deliveryFee: 2000, minimumPrice: 16000, menus: [Food(name: "뿌링클", price: 18000, isRecommend: true, foodCategory: "치킨", description: "bhc 인기메뉴", image: " "),Food(name: "핫후라이드 치킨", price: 14000, isRecommend: false, foodCategory: "치킨", description: "매운 치킨")], mainImage: [""], foodType: [.chicken], foodCategory: ["치킨"], latitude: 34.44, longitude: 129.22),
        Restaurant(id: "ceoId3", password: "1234", restaurantInfo: .init(), name: "중식", reviews: [Review(writer: "함지수", score: 5.0, contents: "맛있어요"), Review(writer: "봉주헌", score: 3.0, contents: "존맛탱"), Review(writer: "장여훈", score: 5.0, contents: "굿")], deliveryFee: 2400, minimumPrice: 13000, menus: [Food(name: "김치찌개", price: 8000, isRecommend: true, foodCategory: "김치찌개", description: "멋쟁이 김치찌개 인기메뉴", image: " "),Food(name: "소주", price: 4000, isRecommend: false, foodCategory: "주류", description: "처음처럼")], mainImage: [""], foodType: [.chinese], foodCategory: ["식사","사이드","주류"], latitude: 44.32, longitude: 22.222),
        Restaurant(id: "ceoId4", password: "1234", restaurantInfo: .init(), name: "이건 햄버거집", reviews: [Review(writer: "유하은", score: 3.0, contents: "다른 bhc 지점에 비해 별로예요"),Review(writer: "함지수", score: 5.0, contents: "최고의 맛이었어요 ㅠㅠ")], deliveryFee: 2000, minimumPrice: 16000, menus: [Food(name: "뿌링클", price: 18000, isRecommend: true, foodCategory: "치킨", description: "bhc 인기메뉴", image: " "),Food(name: "핫후라이드 치킨", price: 14000, isRecommend: false, foodCategory: "치킨", description: "매운 치킨")], mainImage: [""], foodType: [.fastFood], foodCategory: ["치킨"], latitude: 34.44, longitude: 129.22),
        Restaurant(id: "ceoId3", password: "1234", restaurantInfo: .init(), name: "커피커피", reviews: [Review(writer: "함지수", score: 5.0, contents: "맛있어요"), Review(writer: "봉주헌", score: 3.0, contents: "존맛탱"), Review(writer: "장여훈", score: 5.0, contents: "굿")], deliveryFee: 2400, minimumPrice: 13000, menus: [Food(name: "김치찌개", price: 8000, isRecommend: true, foodCategory: "김치찌개", description: "멋쟁이 김치찌개 인기메뉴", image: " "),Food(name: "소주", price: 4000, isRecommend: false, foodCategory: "주류", description: "처음처럼")], mainImage: [""], foodType: [.coffeeAndTea], foodCategory: ["식사","사이드","주류"], latitude: 44.32, longitude: 22.222),
        Restaurant(id: "ceoId4", password: "1234", restaurantInfo: .init(), name: "디저트가게용", reviews: [Review(writer: "유하은", score: 3.0, contents: "다른 bhc 지점에 비해 별로예요"),Review(writer: "함지수", score: 5.0, contents: "최고의 맛이었어요 ㅠㅠ")], deliveryFee: 2000, minimumPrice: 16000, menus: [Food(name: "뿌링클", price: 18000, isRecommend: true, foodCategory: "치킨", description: "bhc 인기메뉴", image: " "),Food(name: "핫후라이드 치킨", price: 14000, isRecommend: false, foodCategory: "치킨", description: "매운 치킨")], mainImage: [""], foodType: [.dessert], foodCategory: ["치킨"], latitude: 34.44, longitude: 129.22),
        Restaurant(id: "ceoId3", password: "1234", restaurantInfo: .init(), name: "일식집이용", reviews: [Review(writer: "함지수", score: 5.0, contents: "맛있어요"), Review(writer: "봉주헌", score: 3.0, contents: "존맛탱"), Review(writer: "장여훈", score: 5.0, contents: "굿")], deliveryFee: 2400, minimumPrice: 13000, menus: [Food(name: "김치찌개", price: 8000, isRecommend: true, foodCategory: "김치찌개", description: "멋쟁이 김치찌개 인기메뉴", image: " "),Food(name: "소주", price: 4000, isRecommend: false, foodCategory: "주류", description: "처음처럼")], mainImage: [""], foodType: [.japanese], foodCategory: ["식사","사이드","주류"], latitude: 44.32, longitude: 22.222),
        Restaurant(id: "ceoId4", password: "1234", restaurantInfo: .init(), name: "족발 보쌈", reviews: [Review(writer: "유하은", score: 3.0, contents: "다른 bhc 지점에 비해 별로예요"),Review(writer: "함지수", score: 5.0, contents: "최고의 맛이었어요 ㅠㅠ")], deliveryFee: 2000, minimumPrice: 16000, menus: [Food(name: "뿌링클", price: 18000, isRecommend: true, foodCategory: "치킨", description: "bhc 인기메뉴", image: " "),Food(name: "핫후라이드 치킨", price: 14000, isRecommend: false, foodCategory: "치킨", description: "매운 치킨")], mainImage: [""], foodType: [.jokbalbossam], foodCategory: ["치킨"], latitude: 34.44, longitude: 129.22),
        Restaurant(id: "ceoId4", password: "1234", restaurantInfo: .init(), name: "아구찜 ?", reviews: [Review(writer: "유하은", score: 3.0, contents: "다른 bhc 지점에 비해 별로예요"),Review(writer: "함지수", score: 5.0, contents: "최고의 맛이었어요 ㅠㅠ")], deliveryFee: 2000, minimumPrice: 16000, menus: [Food(name: "뿌링클", price: 18000, isRecommend: true, foodCategory: "치킨", description: "bhc 인기메뉴", image: " "),Food(name: "핫후라이드 치킨", price: 14000, isRecommend: false, foodCategory: "치킨", description: "매운 치킨")], mainImage: [""], foodType: [.steamed], foodCategory: ["치킨"], latitude: 34.44, longitude: 129.22),
        Restaurant(id: "ceoId3", password: "1234", restaurantInfo: .init(), name: "화덕피자!", reviews: [Review(writer: "함지수", score: 5.0, contents: "맛있어요"), Review(writer: "봉주헌", score: 3.0, contents: "존맛탱"), Review(writer: "장여훈", score: 5.0, contents: "굿")], deliveryFee: 2400, minimumPrice: 13000, menus: [Food(name: "김치찌개", price: 8000, isRecommend: true, foodCategory: "김치찌개", description: "멋쟁이 김치찌개 인기메뉴", image: " "),Food(name: "소주", price: 4000, isRecommend: false, foodCategory: "주류", description: "처음처럼")], mainImage: [""], foodType: [.pizza], foodCategory: ["식사","사이드","주류"], latitude: 44.32, longitude: 22.222),
        Restaurant(id: "ceoId4", password: "1234", restaurantInfo: .init(), name: "파스타가게", reviews: [Review(writer: "유하은", score: 3.0, contents: "다른 bhc 지점에 비해 별로예요"),Review(writer: "함지수", score: 5.0, contents: "최고의 맛이었어요 ㅠㅠ")], deliveryFee: 2000, minimumPrice: 16000, menus: [Food(name: "뿌링클", price: 18000, isRecommend: true, foodCategory: "치킨", description: "bhc 인기메뉴", image: " "),Food(name: "핫후라이드 치킨", price: 14000, isRecommend: false, foodCategory: "치킨", description: "매운 치킨")], mainImage: [""], foodType: [.western], foodCategory: ["치킨"], latitude: 34.44, longitude: 129.22),

    ]
    @Published var selectedFoodType: FoodType? = nil
    
    func filterFoodTypes(_ data: FoodType?) -> [Restaurant] {
        return restaurants.filter { store in
            if let data = data {
                return store.foodType.contains(data)
            } else {
                return true
            }
        }
    }
    
 
    func filterFoodName(_ name: String) -> [Restaurant] {
        return restaurants.filter { restaurant in
            restaurant.menus.contains { food in
                return food.name == name
            }
        }
    }
    
    func collectAllFoodNames() -> [String] {
        var foodNames: [String] = []
        
        for restaurant in restaurants {
            for menu in restaurant.menus {
                foodNames.append(menu.name)
            }
        }
        
        return foodNames
    }
}
