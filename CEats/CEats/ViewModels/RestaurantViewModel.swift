//
//  RestaurantViewModel.swift
//  CEats
//
//  Created by 유하은 on 2023/09/04.
//

import Foundation

final class RestaurantViewModel: ObservableObject {
    @Published var restaurants: [Restaurant] = [
       
         Restaurant(id: "ceoId", password: "1234", restaurantInfo: .init(), name: "멋쟁이 김치찌개", reviews: [Review(writer: "김멋사", score: 4.0, contents: "맛있긴 함"),Review(writer: "아이유", score: 5.0, image: "korean", contents: "최고의 맛이었어요 ㅠㅠ")], deliveryFee: 3000, minimumPrice: 14000, menus: [Food(name: "김치찌개", price: 8000, isRecommend: true, foodCategory: "김치찌개", description: "멋쟁이 김치찌개 인기메뉴", image: "kimchiSoup"),Food(name: "소주", price: 4000, isRecommend: false, foodCategory: "주류", description: "처음처럼", image: "soju")], mainImage: ["kimchijjigae"], foodType: [.korean], foodCategory: ["식사","사이드","주류"], latitude: 32.44, longitude: 55.22),
         Restaurant(id: "ceoId2", password: "1234", restaurantInfo: .init(), name: "엽기떡볶이", reviews: [Review(writer: "유하은", score: 3.0,image:"koreanSnack", contents: "다른 엽떡 지점에 비해 별로예요"),Review(writer: "함지수", score: 5.0,image: "korean", contents: "최고의 맛이었어요 ㅠㅠ")], deliveryFee: 2000, minimumPrice: 16000, menus: [Food(name: "동대문 엽기 떡볶이", price: 14000, isRecommend: true, foodCategory: "떡볶이", description: "엽떡 인기메뉴", image: "koreanSnack"),Food(name: "동대문 엽기 오뎅", price: 14000, isRecommend: false, foodCategory: "떡볶이", description: "떡볶이 30% 오뎅 70%")], mainImage: ["yupddeock"], foodType: [.koreanSnack], foodCategory: ["떡볶이","사이드","주류"], latitude: 34.44, longitude: 129.22),
         Restaurant(id: "ceoId3", password: "1234", restaurantInfo: .init(), name: "굴다리김치찌개", reviews: [Review(writer: "함지수", score: 5.0,image: "korean", contents: "맛있어요"), Review(writer: "봉주헌", score: 3.0, contents: "존맛탱"), Review(writer: "장여훈", score: 5.0, contents: "굿")], deliveryFee: 2400, minimumPrice: 13000, menus: [Food(name: "김치찌개", price: 8000, isRecommend: true, foodCategory: "김치찌개", description: "멋쟁이 김치찌개 인기메뉴", image: "kimchiSoup"),Food(name: "소주", price: 4000, isRecommend: false, foodCategory: "주류", description: "처음처럼", image: "soju")], mainImage: ["kimchi2"], foodType: [.korean], foodCategory: ["식사","사이드","주류"], latitude: 44.32, longitude: 22.222),
         Restaurant(id: "ceoId4", password: "1234", restaurantInfo: .init(), name: "BHC 치킨", reviews: [Review(writer: "유하은", score: 3.0,image: "bhc", contents: "다른 bhc 지점에 비해 별로예요"),Review(writer: "함지수", score: 5.0, contents: "최고의 맛이었어요 ㅠㅠ")], deliveryFee: 2000, minimumPrice: 16000, menus: [Food(name: "뿌링클", price: 18000, isRecommend: true, foodCategory: "치킨", description: "bhc 인기메뉴", image: "chicken"),Food(name: "핫후라이드 치킨", price: 14000, isRecommend: false, foodCategory: "치킨", description: "매운 치킨")], mainImage: ["bhc"], foodType: [.chicken], foodCategory: ["치킨"], latitude: 34.44, longitude: 129.22),
         Restaurant(id: "ceoId5", password: "1234", restaurantInfo: .init(), name: "중식", reviews: [Review(writer: "함지수", score: 5.0, contents: "맛있어요"), Review(writer: "봉주헌", score: 3.0, contents: "존맛탱"), Review(writer: "장여훈", score: 5.0, contents: "굿")], deliveryFee: 2400, minimumPrice: 13000, menus: [Food(name: "김치찌개", price: 8000, isRecommend: true, foodCategory: "김치찌개", description: "멋쟁이 김치찌개 인기메뉴", image: " "),Food(name: "소주", price: 4000, isRecommend: false, foodCategory: "주류", description: "처음처럼")], mainImage: [""], foodType: [.chinese], foodCategory: ["식사","사이드","주류"], latitude: 44.32, longitude: 22.222),
         Restaurant(id: "ceoId6", password: "1234", restaurantInfo: .init(), name: "이건 햄버거집", reviews: [Review(writer: "유하은", score: 3.0, contents: "다른 bhc 지점에 비해 별로예요"),Review(writer: "함지수", score: 5.0, contents: "최고의 맛이었어요 ㅠㅠ")], deliveryFee: 2000, minimumPrice: 16000, menus: [Food(name: "뿌링클", price: 18000, isRecommend: true, foodCategory: "치킨", description: "bhc 인기메뉴", image: " "),Food(name: "핫후라이드 치킨", price: 14000, isRecommend: false, foodCategory: "치킨", description: "매운 치킨")], mainImage: [""], foodType: [.fastFood], foodCategory: ["치킨"], latitude: 34.44, longitude: 129.22),
         Restaurant(id: "ceoId7", password: "1234", restaurantInfo: .init(), name: "커피커피", reviews: [Review(writer: "함지수", score: 5.0, contents: "맛있어요"), Review(writer: "봉주헌", score: 3.0, contents: "존맛탱"), Review(writer: "장여훈", score: 5.0, contents: "굿")], deliveryFee: 2400, minimumPrice: 13000, menus: [Food(name: "김치찌개", price: 8000, isRecommend: true, foodCategory: "김치찌개", description: "멋쟁이 김치찌개 인기메뉴", image: " "),Food(name: "소주", price: 4000, isRecommend: false, foodCategory: "주류", description: "처음처럼")], mainImage: [""], foodType: [.coffeeAndTea], foodCategory: ["식사","사이드","주류"], latitude: 44.32, longitude: 22.222),
         Restaurant(id: "ceoId8", password: "1234", restaurantInfo: .init(), name: "디저트가게용", reviews: [Review(writer: "유하은", score: 3.0, contents: "다른 bhc 지점에 비해 별로예요"),Review(writer: "함지수", score: 5.0, contents: "최고의 맛이었어요 ㅠㅠ")], deliveryFee: 2000, minimumPrice: 16000, menus: [Food(name: "뿌링클", price: 18000, isRecommend: true, foodCategory: "치킨", description: "bhc 인기메뉴", image: " "),Food(name: "핫후라이드 치킨", price: 14000, isRecommend: false, foodCategory: "치킨", description: "매운 치킨")], mainImage: [""], foodType: [.dessert], foodCategory: ["치킨"], latitude: 34.44, longitude: 129.22),
         Restaurant(id: "ceoId9", password: "1234", restaurantInfo: .init(), name: "일식집이용", reviews: [Review(writer: "함지수", score: 5.0, contents: "맛있어요"), Review(writer: "봉주헌", score: 3.0, contents: "존맛탱"), Review(writer: "장여훈", score: 5.0, contents: "굿")], deliveryFee: 2400, minimumPrice: 13000, menus: [Food(name: "김치찌개", price: 8000, isRecommend: true, foodCategory: "김치찌개", description: "멋쟁이 김치찌개 인기메뉴", image: " "),Food(name: "소주", price: 4000, isRecommend: false, foodCategory: "주류", description: "처음처럼")], mainImage: [""], foodType: [.japanese], foodCategory: ["식사","사이드","주류"], latitude: 44.32, longitude: 22.222),
         Restaurant(id: "ceoId10", password: "1234", restaurantInfo: .init(), name: "족발 보쌈", reviews: [Review(writer: "유하은", score: 3.0, contents: "다른 bhc 지점에 비해 별로예요"),Review(writer: "함지수", score: 5.0, contents: "최고의 맛이었어요 ㅠㅠ")], deliveryFee: 2000, minimumPrice: 16000, menus: [Food(name: "뿌링클", price: 18000, isRecommend: true, foodCategory: "치킨", description: "bhc 인기메뉴", image: " "),Food(name: "핫후라이드 치킨", price: 14000, isRecommend: false, foodCategory: "치킨", description: "매운 치킨")], mainImage: [""], foodType: [.jokbalbossam], foodCategory: ["치킨"], latitude: 34.44, longitude: 129.22),
         Restaurant(id: "ceoId11", password: "1234", restaurantInfo: .init(), name: "아구찜 ?", reviews: [Review(writer: "유하은", score: 3.0, contents: "다른 bhc 지점에 비해 별로예요"),Review(writer: "함지수", score: 5.0, contents: "최고의 맛이었어요 ㅠㅠ")], deliveryFee: 2000, minimumPrice: 16000, menus: [Food(name: "뿌링클", price: 18000, isRecommend: true, foodCategory: "치킨", description: "bhc 인기메뉴", image: " "),Food(name: "핫후라이드 치킨", price: 14000, isRecommend: false, foodCategory: "치킨", description: "매운 치킨")], mainImage: [""], foodType: [.steamed], foodCategory: ["치킨"], latitude: 34.44, longitude: 129.22),
         Restaurant(id: "ceoId12", password: "1234", restaurantInfo: .init(), name: "화덕피자!", reviews: [Review(writer: "함지수", score: 5.0, contents: "맛있어요"), Review(writer: "봉주헌", score: 3.0, contents: "존맛탱"), Review(writer: "장여훈", score: 5.0, contents: "굿")], deliveryFee: 2400, minimumPrice: 13000, menus: [Food(name: "김치찌개", price: 8000, isRecommend: true, foodCategory: "김치찌개", description: "멋쟁이 김치찌개 인기메뉴", image: " "),Food(name: "소주", price: 4000, isRecommend: false, foodCategory: "주류", description: "처음처럼")], mainImage: [""], foodType: [.pizza], foodCategory: ["식사","사이드","주류"], latitude: 44.32, longitude: 22.222),
         Restaurant(id: "ceoId13", password: "1234", restaurantInfo: .init(), name: "파스타가게", reviews: [Review(writer: "유하은", score: 3.0, contents: "다른 bhc 지점에 비해 별로예요"),Review(writer: "함지수", score: 5.0, contents: "최고의 맛이었어요 ㅠㅠ")], deliveryFee: 2000, minimumPrice: 16000, menus: [Food(name: "뿌링클", price: 18000, isRecommend: true, foodCategory: "치킨", description: "bhc 인기메뉴", image: " "),Food(name: "핫후라이드 치킨", price: 14000, isRecommend: false, foodCategory: "치킨", description: "매운 치킨")], mainImage: [""], foodType: [.western], foodCategory: ["치킨"], latitude: 34.44, longitude: 129.22),
         Restaurant(id: "ceoId14", password: "1234", restaurantInfo: .init(), name: "한식당", reviews: [Review(writer: "유하은", score: 3.0, contents: "다른 bhc 지점에 비해 별로예요"),Review(writer: "함지수", score: 5.0, contents: "최고의 맛이었어요 ㅠㅠ")], deliveryFee: 2000, minimumPrice: 16000, menus: [Food(name: "뿌링클", price: 18000, isRecommend: true, foodCategory: "치킨", description: "bhc 인기메뉴", image: " "),Food(name: "핫후라이드 치킨", price: 14000, isRecommend: false, foodCategory: "치킨", description: "매운 치킨")], mainImage: [""], foodType: [.korean], foodCategory: ["치킨"], latitude: 34.44, longitude: 129.22),
         Restaurant(id: "ceoId15", password: "1234", restaurantInfo: .init(), name: "기사식당", reviews: [Review(writer: "유하은", score: 3.0, contents: "다른 bhc 지점에 비해 별로예요"),Review(writer: "함지수", score: 5.0, contents: "최고의 맛이었어요 ㅠㅠ")], deliveryFee: 2000, minimumPrice: 16000, menus: [Food(name: "뿌링클", price: 18000, isRecommend: true, foodCategory: "치킨", description: "bhc 인기메뉴", image: " "),Food(name: "핫후라이드 치킨", price: 14000, isRecommend: false, foodCategory: "치킨", description: "매운 치킨")], mainImage: [""], foodType: [.korean], foodCategory: ["치킨"], latitude: 34.44, longitude: 129.22),
         
     ]
    
    @Published var user: User = User(id: "1234", username: "김민지", email: "newJean@naver.com", phoneNumber: "010-0000-0000", favoriteRestaurant: [], orderHistory: [], foodCart: [])
    
    @Published var selectedFoodType: FoodType? = nil
    
    func checkLike(restaurant: Restaurant) -> Bool {
        return user.favoriteRestaurant.contains(where: { $0.id == restaurant.id })
    }
    
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
    
    func collectAllFoodNames() -> Set<String> {
        var foodNames: Set<String> = []
        
        for restaurant in restaurants {
            for menu in restaurant.menus {
                foodNames.insert(menu.name)

            }
        }
        
        return foodNames
    }
    
    func removeRestaurant(restaurant: Restaurant) {
        guard let index = user.favoriteRestaurant.firstIndex(where: { $0.id == restaurant.id }) else { return }
        user.favoriteRestaurant.remove(at: index)
    }
    
    func removeRTR(store: Restaurant) {
        var index: Int = 0
        
        for tempStore in user.favoriteRestaurant {
            if tempStore.id == store.id {
                user.favoriteRestaurant.remove(at: index)
                break
            }
            index += 1
        }
    }
}
