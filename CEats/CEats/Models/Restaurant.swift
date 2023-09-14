//
//  Restaurant.swift
//  CEats
//
//  Created by 박범수 on 2023/09/04.
//

import Foundation

struct Restaurant: Identifiable, Codable, CEatsIdentifiable {
    var id: String
    var isOpen: Bool = false
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
    
    struct Food: Codable, Identifiable {
        var id: String = UUID().uuidString
        var name: String //메뉴이름
        var price: Int //메뉴 가격
        var isRecommend: Bool //추천여부 추천이면 가게 클릭시 상단에 뜸
        var foodCategory: String
        var description: String // 메뉴설명
        var image: String?
        var foodCount: Int = 1 // 메뉴 수량 변수
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
    static let sampleData = Restaurant.Food(name: "김치찌개", price: 8000, isRecommend: true, foodCategory: "김치찌개", description: "멋쟁이 김치찌개 인기메뉴", image: "kimchijjigae", foodCount: 1)
    static let sampleData2 = Restaurant.Food(name: "계란말이", price: 8000, isRecommend: false, foodCategory: "사이드", description: "완전 인기메뉴",image: "egg", foodCount: 2)
}

extension Restaurant {
    static let sampleDummys = [restaurant1,restaurant2,restaurant3,restaurant4,restaurant5,restaurant6,restaurant7,restaurant8,restaurant9,restaurant10,restaurant11,restaurant12,restaurant13,restaurant14]
    
    static let sampleData = Restaurant(id: "ceoId", password: "1234", restaurantInfo: RestaurantInfo(phoneNumber: 01065483210, name: "멋쟁이 김치찌개", timeTable: "12:00~ 23:00", introduce: "대한민국 최고의 멋쟁이 김치찌개 집입니다."), name: "멋쟁이 김치찌개", reviews: [
        Review(writer: "김민지", score: 4.0, image: "kimchi2", contents: "이 집 김치찌개는 정말 인정합니다. 계란말이가 더 맛있긴 하지만요~"),
        Review(writer: "김민지", score: 5.0, image: "soju", contents: "지친 인생에서,,,최고의 맛이었어요 ㅠㅠ")
    ], deliveryFee: 3000, minimumPrice: 14000, menus: [Food(name: "김치찌개", price: 8000, isRecommend: true, foodCategory: "김치찌개", description: "멋쟁이 김치찌개 인기메뉴", image: "kimchijjigae"),Food(name: "소주", price: 4000, isRecommend: false, foodCategory: "주류", description: "처음처럼",image: "soju"),Food(name: "계란말이", price: 8000, isRecommend: false, foodCategory: "사이드", description: "완전 인기메뉴",image: "egg")], mainImage: ["kimchijjigae"], foodType: [.korean], foodCategory: ["식사","사이드","주류"], latitude: 32.44, longitude: 55.22)
    
    static let sampleArray = [
      
        Restaurant(id: "ceoId", isOpen: false, password: "1234", restaurantInfo: RestaurantInfo(phoneNumber: 01065483210, name: "멋쟁이 김치찌개", timeTable: "12:00~ 23:00", introduce: "대한민국 최고의 멋쟁이 김치찌개 집입니다."), name: "멋쟁이 김치찌개", reviews: [
            Review(writer: "김민지", score: 4.0, image: "kimchi2", contents: "이 집 김치찌개는 정말 인정합니다.\n 계란말이가 더 맛있긴 하지만요~"),
            Review(writer: "김민지", score: 5.0, image: "soju", contents: "지친 인생에서,,,\n 최고의 맛이었어요 ㅠㅠ")
        ], deliveryFee: 3000, minimumPrice: 14000, menus: [Food(name: "김치찌개", price: 8000, isRecommend: true, foodCategory: "김치찌개", description: "멋쟁이 김치찌개 인기메뉴", image: "kimchijjigae"),Food(name: "소주", price: 4000, isRecommend: false, foodCategory: "주류", description: "처음처럼",image: "soju"),Food(name: "계란말이", price: 8000, isRecommend: false, foodCategory: "사이드", description: "완전 인기메뉴",image: "egg")], mainImage: ["kimchijjigae"], foodType: [.korean], foodCategory: ["식사","사이드","주류"], latitude: 32.44, longitude: 55.22),
        
        Restaurant(id: "ceoId2", password: "1234", restaurantInfo: .init(), name: "엽기떡볶이", reviews: [Review(writer: "유하은", score: 3.0,image:"koreanSnack", contents: "다른 엽떡 지점에 비해 별로예요"),Review(writer: "김민지", score: 5.0,image: "korean", contents: "여기 엽떡이 진짜임")], deliveryFee: 2000, minimumPrice: 16000, menus: [Restaurant.Food(name: "동대문 엽기 떡볶이", price: 14000, isRecommend: true, foodCategory: "떡볶이", description: "엽떡 인기메뉴", image: "koreanSnack"),Restaurant.Food(name: "동대문 엽기 오뎅", price: 14000, isRecommend: false, foodCategory: "떡볶이", description: "떡볶이 30% 오뎅 70%")], mainImage: ["yupddeock"], foodType: [.koreanSnack], foodCategory: ["떡볶이","사이드","주류"], latitude: 34.44, longitude: 129.22),
        
        Restaurant(id: "ceoId3", password: "1234", restaurantInfo: .init(), name: "굴다리김치찌개", reviews: [Review(writer: "함지수", score: 5.0,image: "korean", contents: "맛있어요"), Review(writer: "봉주헌", score: 3.0, contents: "존맛탱"), Review(writer: "장여훈", score: 5.0, contents: "굿")], deliveryFee: 2400, minimumPrice: 13000, menus: [Restaurant.Food(name: "김치찌개", price: 8000, isRecommend: true, foodCategory: "김치찌개", description: "멋쟁이 김치찌개 인기메뉴", image: "kimchiSoup"),Restaurant.Food(name: "소주", price: 4000, isRecommend: false, foodCategory: "주류", description: "처음처럼", image: "soju")], mainImage: ["kimchi2"], foodType: [.korean], foodCategory: ["식사","사이드","주류"], latitude: 44.32, longitude: 22.222),
        
        Restaurant(id: "ceoId4", password: "1234", restaurantInfo: .init(), name: "BHC 치킨", reviews: [Review(writer: "유하은", score: 3.0,image: "bhc", contents: "다른 bhc 지점에 비해 별로예요"),Review(writer: "함지수", score: 5.0, contents: "최고의 맛이었어요 ㅠㅠ")], deliveryFee: 2000, minimumPrice: 16000, menus: [Restaurant.Food(name: "뿌링클", price: 18000, isRecommend: true, foodCategory: "치킨", description: "bhc 인기메뉴", image: "chicken"),Restaurant.Food(name: "핫후라이드 치킨", price: 14000, isRecommend: false, foodCategory: "치킨", description: "매운 치킨")], mainImage: ["bhc"], foodType: [.chicken], foodCategory: ["치킨"], latitude: 34.44, longitude: 129.22),
        
        Restaurant(id: "ceoId5", password: "1234", restaurantInfo: .init(), name: "중식", reviews: [Review(writer: "함지수", score: 5.0, contents: "맛있어요"), Review(writer: "봉주헌", score: 3.0, contents: "존맛탱"), Review(writer: "장여훈", score: 5.0, contents: "굿")], deliveryFee: 2400, minimumPrice: 13000, menus: [Restaurant.Food(name: "김치찌개", price: 8000, isRecommend: true, foodCategory: "김치찌개", description: "멋쟁이 김치찌개 인기메뉴", image: " "),Restaurant.Food(name: "소주", price: 4000, isRecommend: false, foodCategory: "주류", description: "처음처럼")], mainImage: [""], foodType: [.chinese], foodCategory: ["식사","사이드","주류"], latitude: 44.32, longitude: 22.222),
        
        Restaurant(id: "ceoId6", password: "1234", restaurantInfo: .init(), name: "이건 햄버거집", reviews: [Review(writer: "유하은", score: 3.0, contents: "다른 bhc 지점에 비해 별로예요"),Review(writer: "함지수", score: 5.0, contents: "최고의 맛이었어요 ㅠㅠ")], deliveryFee: 2000, minimumPrice: 16000, menus: [Restaurant.Food(name: "뿌링클", price: 18000, isRecommend: true, foodCategory: "치킨", description: "bhc 인기메뉴", image: " "),Restaurant.Food(name: "핫후라이드 치킨", price: 14000, isRecommend: false, foodCategory: "치킨", description: "매운 치킨")], mainImage: [""], foodType: [.fastFood], foodCategory: ["치킨"], latitude: 34.44, longitude: 129.22),
        
        Restaurant(id: "ceoId7", password: "1234", restaurantInfo: .init(), name: "커피커피", reviews: [Review(writer: "함지수", score: 5.0, contents: "맛있어요"), Review(writer: "봉주헌", score: 3.0, contents: "존맛탱"), Review(writer: "장여훈", score: 5.0, contents: "굿")], deliveryFee: 2400, minimumPrice: 13000, menus: [Restaurant.Food(name: "김치찌개", price: 8000, isRecommend: true, foodCategory: "김치찌개", description: "멋쟁이 김치찌개 인기메뉴", image: " "),Restaurant.Food(name: "소주", price: 4000, isRecommend: false, foodCategory: "주류", description: "처음처럼")], mainImage: [""], foodType: [.coffeeAndTea], foodCategory: ["식사","사이드","주류"], latitude: 44.32, longitude: 22.222),
        
        Restaurant(id: "ceoId8", password: "1234", restaurantInfo: .init(), name: "디저트가게용", reviews: [Review(writer: "유하은", score: 3.0, contents: "다른 bhc 지점에 비해 별로예요"),Review(writer: "함지수", score: 5.0, contents: "최고의 맛이었어요 ㅠㅠ")], deliveryFee: 2000, minimumPrice: 16000, menus: [Restaurant.Food(name: "뿌링클", price: 18000, isRecommend: true, foodCategory: "치킨", description: "bhc 인기메뉴", image: " "),Restaurant.Food(name: "핫후라이드 치킨", price: 14000, isRecommend: false, foodCategory: "치킨", description: "매운 치킨")], mainImage: [""], foodType: [.dessert], foodCategory: ["치킨"], latitude: 34.44, longitude: 129.22),
        
        Restaurant(id: "ceoId9", password: "1234", restaurantInfo: .init(), name: "일식집이용", reviews: [Review(writer: "함지수", score: 5.0, contents: "맛있어요"), Review(writer: "봉주헌", score: 3.0, contents: "존맛탱"), Review(writer: "장여훈", score: 5.0, contents: "굿")], deliveryFee: 2400, minimumPrice: 13000, menus: [Restaurant.Food(name: "김치찌개", price: 8000, isRecommend: true, foodCategory: "김치찌개", description: "멋쟁이 김치찌개 인기메뉴", image: " "),Restaurant.Food(name: "소주", price: 4000, isRecommend: false, foodCategory: "주류", description: "처음처럼")], mainImage: [""], foodType: [.japanese], foodCategory: ["식사","사이드","주류"], latitude: 44.32, longitude: 22.222),
        
        Restaurant(id: "ceoId10", password: "1234", restaurantInfo: .init(), name: "족발 보쌈", reviews: [Review(writer: "유하은", score: 3.0, contents: "다른 bhc 지점에 비해 별로예요"),Review(writer: "함지수", score: 5.0, contents: "최고의 맛이었어요 ㅠㅠ")], deliveryFee: 2000, minimumPrice: 16000, menus: [Restaurant.Food(name: "뿌링클", price: 18000, isRecommend: true, foodCategory: "치킨", description: "bhc 인기메뉴", image: " "),Restaurant.Food(name: "핫후라이드 치킨", price: 14000, isRecommend: false, foodCategory: "치킨", description: "매운 치킨")], mainImage: [""], foodType: [.jokbalbossam], foodCategory: ["치킨"], latitude: 34.44, longitude: 129.22),
        
        Restaurant(id: "ceoId11", password: "1234", restaurantInfo: .init(), name: "아구찜 ?", reviews: [Review(writer: "유하은", score: 3.0, contents: "다른 bhc 지점에 비해 별로예요"),Review(writer: "함지수", score: 5.0, contents: "최고의 맛이었어요 ㅠㅠ")], deliveryFee: 2000, minimumPrice: 16000, menus: [Restaurant.Food(name: "뿌링클", price: 18000, isRecommend: true, foodCategory: "치킨", description: "bhc 인기메뉴", image: " "),Restaurant.Food(name: "핫후라이드 치킨", price: 14000, isRecommend: false, foodCategory: "치킨", description: "매운 치킨")], mainImage: [""], foodType: [.steamed], foodCategory: ["치킨"], latitude: 34.44, longitude: 129.22),
        
        Restaurant(id: "ceoId12", password: "1234", restaurantInfo: .init(), name: "화덕피자!", reviews: [Review(writer: "함지수", score: 5.0, contents: "맛있어요"), Review(writer: "봉주헌", score: 3.0, contents: "존맛탱"), Review(writer: "장여훈", score: 5.0, contents: "굿")], deliveryFee: 2400, minimumPrice: 13000, menus: [Restaurant.Food(name: "김치찌개", price: 8000, isRecommend: true, foodCategory: "김치찌개", description: "멋쟁이 김치찌개 인기메뉴", image: " "),Restaurant.Food(name: "소주", price: 4000, isRecommend: false, foodCategory: "주류", description: "처음처럼")], mainImage: [""], foodType: [.pizza], foodCategory: ["식사","사이드","주류"], latitude: 44.32, longitude: 22.222),
        
        Restaurant(id: "ceoId13", password: "1234", restaurantInfo: .init(), name: "파스타가게", reviews: [Review(writer: "유하은", score: 3.0, contents: "다른 bhc 지점에 비해 별로예요"),Review(writer: "함지수", score: 5.0, contents: "최고의 맛이었어요 ㅠㅠ")], deliveryFee: 2000, minimumPrice: 16000, menus: [Restaurant.Food(name: "뿌링클", price: 18000, isRecommend: true, foodCategory: "치킨", description: "bhc 인기메뉴", image: " "),Restaurant.Food(name: "핫후라이드 치킨", price: 14000, isRecommend: false, foodCategory: "치킨", description: "매운 치킨")], mainImage: [""], foodType: [.western], foodCategory: ["치킨"], latitude: 34.44, longitude: 129.22),
        
        Restaurant(id: "ceoId14", password: "1234", restaurantInfo: .init(), name: "한식당", reviews: [Review(writer: "유하은", score: 3.0, contents: "다른 bhc 지점에 비해 별로예요"),Review(writer: "함지수", score: 5.0, contents: "최고의 맛이었어요 ㅠㅠ")], deliveryFee: 2000, minimumPrice: 16000, menus: [Restaurant.Food(name: "뿌링클", price: 18000, isRecommend: true, foodCategory: "치킨", description: "bhc 인기메뉴", image: " "),Restaurant.Food(name: "핫후라이드 치킨", price: 14000, isRecommend: false, foodCategory: "치킨", description: "매운 치킨")], mainImage: [""], foodType: [.korean], foodCategory: ["치킨"], latitude: 34.44, longitude: 129.22),
        
        Restaurant(id: "ceoId15", password: "1234", restaurantInfo: .init(), name: "기사식당", reviews: [Review(writer: "유하은", score: 3.0, contents: "다른 bhc 지점에 비해 별로예요"),Review(writer: "함지수", score: 5.0, contents: "최고의 맛이었어요 ㅠㅠ")], deliveryFee: 2000, minimumPrice: 16000, menus: [Restaurant.Food(name: "뿌링클", price: 18000, isRecommend: true, foodCategory: "치킨", description: "bhc 인기메뉴", image: " "),Restaurant.Food(name: "핫후라이드 치킨", price: 14000, isRecommend: false, foodCategory: "치킨", description: "매운 치킨")], mainImage: [""], foodType: [.korean], foodCategory: ["치킨"], latitude: 34.44, longitude: 129.22),
        
    ]
}
#endif
