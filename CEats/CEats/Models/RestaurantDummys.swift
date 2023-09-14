//
//  RestaurantDummys.swift
//  CEats
//
//  Created by 유하은 on 2023/09/13.
//

import Foundation
let restaurant1 =
Restaurant(
    id: "ceoId",
    password: "1234",
    restaurantInfo: RestaurantInfo(phoneNumber: 01065483210, name: "멋쟁이 김치찌개", timeTable: "12:00~ 23:00", introduce: "대한민국 최고의 멋쟁이 김치찌개 집입니다."),
    name: "멋쟁이 김치찌개",
    reviews: [
    Review(writer: "김민지", score: 4.0, image: "kimchi2", contents: "이 집 김치찌개는 정말 인정합니다. 계란말이가 더 맛있긴 하지만요~"),
    Review(writer: "김민지", score: 5.0, image: "soju", contents: "지친 인생에서 최고의 맛이었어요 ㅠㅠ"),
    Review(writer: "박범수",score: 1.5, contents: "4인분 같은 2인분 달라고 했는데 진짜 2인분을 주시네요? 여기는 망했음"),
],
    deliveryFee: 3000,
    minimumPrice: 14000,
    menus: [Restaurant.Food(name: "김치찌개", price: 8000, isRecommend: true, foodCategory: "식사", description: "멋쟁이 김치찌개 인기메뉴", image: "kimchijjigae"),
            Restaurant.Food(name: "비빔밥", price: 7000, isRecommend: false, foodCategory: "식사", description: "신선한 나물이 있는 비빔밥", image: "korean"),
            Restaurant.Food(name: "고등어구이", price: 13000, isRecommend: true, foodCategory: "식사", description: "", image: "fish"),
            Restaurant.Food(name: "청국장", price: 8000, isRecommend: true, foodCategory: "식사", description: "손님들이 인정한 청국장 맛집", image: "cheong"),
            Restaurant.Food(name: "공깃밥", price: 1500, isRecommend: false, foodCategory: "사이드", description: "식사 주문시 기본으로 제공됩니다. ", image: "rice"),
            Restaurant.Food(name: "펩시 콜라", price: 3000, isRecommend: true, foodCategory: "주류", description: "펩시콜라", image: "coke"),
            Restaurant.Food(name: "소주", price: 4000, isRecommend: false, foodCategory: "주류", description: "처음처럼",image: "soju"),
            Restaurant.Food(name: "계란말이", price: 8000, isRecommend: false, foodCategory: "사이드", description: "완전 인기메뉴",image: "egg")],
    mainImage: ["kimchijjigae"],
    foodType: [.korean],
    foodCategory: ["식사","사이드","주류"],
    latitude: 32.44, longitude: 55.22)

let restaurant2 =
 Restaurant(id: "ceoId2",
            isOpen: false,
            password: "1234",
            restaurantInfo: .init(),
            name: "엽기떡볶이",
            reviews: [Review(writer: "유하은", score: 3.0,image:"koreanSnack", contents: "다른 엽떡 지점에 비해 별로예요"),Review(writer: "김민지", score: 5.0,image: "korean", contents: "여기 엽떡이 진짜임")], deliveryFee: 2000,
            minimumPrice: 16000,
            menus:
                [Restaurant.Food(name: "동대문 엽기 떡볶이", price: 14000, isRecommend: true, foodCategory: "떡볶이", description: "엽떡 인기메뉴", image: "koreanSnack"),Restaurant.Food(name: "동대문 엽기 오뎅", price: 14000, isRecommend: false, foodCategory: "떡볶이", description: "떡볶이 30% 오뎅 70%")],
            mainImage: ["yupddeock"],
            foodType: [.koreanSnack],
            foodCategory: ["떡볶이","사이드","주류"],
            latitude: 34.44, longitude: 129.22)

let restaurant3 =
Restaurant(id: "ceoId3",
           password: "1234",
           restaurantInfo: .init(),
           name: "굴다리김치찌개",
           reviews:
            [Review(writer: "함지수",score: 5.0,image: "korean", contents: "맛있어요"), Review(writer: "봉주헌", score: 3.0, contents: "존맛탱"), Review(writer: "장여훈", score: 5.0, contents: "굿")],
           deliveryFee: 2400,
           minimumPrice: 13000,
           menus: [Restaurant.Food(name: "김치찌개", price: 8000, isRecommend: true, foodCategory: "식사", description: "멋쟁이 김치찌개 인기메뉴", image: "kimchiSoup"),Restaurant.Food(name: "소주", price: 4000, isRecommend: false, foodCategory: "주류", description: "처음처럼", image: "soju")],
           mainImage: ["kimchi2"],
           foodType: [.korean], foodCategory: ["식사","사이드","주류"], latitude: 44.32, longitude: 22.222)

let restaurant4 =
Restaurant(id: "ceoId4",
           password: "1234", restaurantInfo: .init(),
           name: "BHC 치킨",
           reviews: [Review(writer: "유하은", score: 3.0,image: "bhc", contents: "다른 bhc 지점에 비해 별로예요"),Review(writer: "함지수", score: 5.0, contents: "최고의 맛이었어요 ㅠㅠ")], deliveryFee: 2000,
           minimumPrice: 16000,
           menus: [Restaurant.Food(name: "뿌링클", price: 18000, isRecommend: true, foodCategory: "치킨", description: "bhc 인기메뉴", image: "chicken"),Restaurant.Food(name: "핫후라이드 치킨", price: 14000, isRecommend: false, foodCategory: "치킨", description: "매운 치킨")],
           mainImage: ["bhc"],
           foodType: [.chicken],
           foodCategory: ["치킨"],
           latitude: 34.44, longitude: 129.22)

let restaurant5 = Restaurant(
    id: "ceoId5",
    password: "1234",
    restaurantInfo: RestaurantInfo(phoneNumber: 01012345678, name: "멋쟁이 중식집", timeTable: "10:00~20:00", introduce: "대한민국 최고의 중식집입니다."),
    name: "멋쟁이 중식집",
    reviews: [
        Review(writer: "함지수", score: 5.0, contents: "맛있어요"),
        Review(writer: "봉주헌", score: 3.0, contents: "존맛탱"),
        Review(writer: "장여훈", score: 5.0, contents: "굿")
    ],
    deliveryFee: 2400,
    minimumPrice: 13000,
    menus: [
        Restaurant.Food(name: "짬뽕", price: 8000, isRecommend: true, foodCategory: "면류", description: "인기 메뉴"),
        Restaurant.Food(name: "탕수육", price: 12000, isRecommend: true, foodCategory: "특제 메뉴", description: "고급 중식 요리")
    ],
    mainImage: ["restaurant5"],
    foodType: [.chinese],
    foodCategory: ["면류", "특제 메뉴"],
    latitude: 44.32,
    longitude: 22.222
)

let restaurant6 = Restaurant(
    id: "ceoId6",
    password: "1234",
    restaurantInfo: RestaurantInfo(phoneNumber: 01023456789, name: "햄버거 킹", timeTable: "11:00~21:00", introduce: "신선한 햄버거를 즐기세요."),
    name: "햄버거 킹",
    reviews: [
        Review(writer: "유하은", score: 3.0, contents: "다른 지점에 비해 별로에요"),
        Review(writer: "함지수", score: 5.0, contents: "최고의 맛이었어요 ㅠㅠ")
    ],
    deliveryFee: 2000,
    minimumPrice: 16000,
    menus: [
        Restaurant.Food(name: "와퍼", price: 8000, isRecommend: true, foodCategory: "버거", description: "인기 메뉴", image: "fastFood1"),
        Restaurant.Food(name: "감자튀김", price: 4000, isRecommend: false, foodCategory: "사이드", description: "고소한 감자 튀김")
    ],
    mainImage: ["restaurant6"],
    foodType: [.fastFood],
    foodCategory: ["버거", "사이드"],
    latitude: 34.44,
    longitude: 129.22
)

let restaurant7 = Restaurant(
    id: "ceoId7",
    password: "1234",
    restaurantInfo: RestaurantInfo(phoneNumber: 01034567890, name: "편안한 커피", timeTable: "09:00~19:00", introduce: "편안한 분위기에서 커피를 즐기세요."),
    name: "커피마켓",
    reviews: [
        Review(writer: "함지수", score: 5.0, contents: "친절한 서비스와 맛있는 커피"),
        Review(writer: "봉주헌", score: 4.0, contents: "분위기가 좋아요"),
        Review(writer: "장여훈", score: 5.0, contents: "맛있어요")
    ],
    deliveryFee: 2400,
    minimumPrice: 13000,
    menus: [
        Restaurant.Food(name: "에스프레소", price: 5000, isRecommend: true, foodCategory: "음료", description: "진한 맛의 에스프레소"),
        Restaurant.Food(name: "크로아상", price: 6000, isRecommend: true, foodCategory: "베이커리", description: "부드러운 크로아상")
    ],
    mainImage: ["restaurant7"],
    foodType: [.coffeeAndTea],
    foodCategory: ["음료", "베이커리"],
    latitude: 44.32,
    longitude: 22.222
)

let restaurant8 = Restaurant(
    id: "ceoId8",
    password: "1234",
    restaurantInfo: RestaurantInfo(phoneNumber: 01045678901, name: "디저트 카페", timeTable: "10:00~21:00", introduce: "다양한 디저트와 커피를 즐기세요."),
    name: "디저트 카페",
    reviews: [
        Review(writer: "유하은", score: 4.0, contents: "디저트가 맛있어요"),
        Review(writer: "함지수", score: 5.0, contents: "아늑한 분위기와 맛있는 커피")
    ],
    deliveryFee: 2000,
    minimumPrice: 16000,
    menus: [
        Restaurant.Food(name: "초콜릿 케이크", price: 8000, isRecommend: true, foodCategory: "디저트", description: "달콤한 초콜릿 케이크"),
        Restaurant.Food(name: "아메리카노", price: 4000, isRecommend: false, foodCategory: "음료", description: "부드러운 아메리카노")
    ],
    mainImage: ["restaurant8"],
    foodType: [.dessert],
    foodCategory: ["디저트", "음료"],
    latitude: 34.44,
    longitude: 129.22
)

let restaurant9 = Restaurant(
    id: "ceoId9",
    password: "1234",
    restaurantInfo: RestaurantInfo(phoneNumber: 01065483210, name: "일본에 가다", timeTable: "12:00~23:00", introduce: "일본의 맛을 만나보세요."),
    name: "일식집이용",
    reviews: [
        Review(writer: "함지수", score: 5.0, contents: "맛있어요"),
        Review(writer: "봉주헌", score: 3.0, contents: "존맛탱"),
        Review(writer: "장여훈", score: 5.0, contents: "굿")
    ],
    deliveryFee: 2400,
    minimumPrice: 13000,
    menus: [
        Restaurant.Food(name: "스시세트", price: 15000, isRecommend: true, foodCategory: "스시", description: "신선한 스시세트"),
        Restaurant.Food(name: "라멘", price: 12000, isRecommend: false, foodCategory: "면요리", description: "고기와 면의 조합")
    ],
    mainImage: ["restaurant9"],
    foodType: [.japanese],
    foodCategory: ["스시", "면요리", "주류"],
    latitude: 44.32,
    longitude: 22.222
)

let restaurant10 = Restaurant(
    id: "ceoId10",
    password: "1234",
    restaurantInfo: RestaurantInfo(phoneNumber: 01098765432, name: "족발 보쌈", timeTable: "17:00~02:00", introduce: "매운 족발과 보쌈을 즐기세요."),
    name: "족발 보쌈",
    reviews: [
        Review(writer: "유하은", score: 3.0, contents: "다른 지점에 비해 별로예요"),
        Review(writer: "함지수", score: 5.0, contents: "최고의 맛이었어요 ㅠㅠ")
    ],
    deliveryFee: 2000,
    minimumPrice: 16000,
    menus: [
        Restaurant.Food(name: "매운 족발", price: 18000, isRecommend: true, foodCategory: "족발", description: "매운 맛이 일품"),
        Restaurant.Food(name: "보쌈", price: 16000, isRecommend: false, foodCategory: "보쌈", description: "보쌈의 고기 풍미")
    ],
    mainImage: ["restaurant10"],
    foodType: [.jokbalbossam],
    foodCategory: ["족발", "보쌈"],
    latitude: 34.44,
    longitude: 129.22
)

let restaurant11 = Restaurant(
    id: "ceoId11",
    password: "1234",
    restaurantInfo: RestaurantInfo(phoneNumber: 01012345678, name: "아구찜 명가", timeTable: "11:00~20:00", introduce: "신선한 해산물을 맛보세요."),
    name: "아구찜?",
    reviews: [
        Review(writer: "유하은", score: 3.0, contents: "다른 지점에 비해 별로예요"),
        Review(writer: "함지수", score: 5.0, contents: "최고의 맛이었어요 ㅠㅠ")
    ],
    deliveryFee: 2000,
    minimumPrice: 16000,
    menus: [
        Restaurant.Food(name: "아귀찜", price: 22000, isRecommend: true, foodCategory: "해산물", description: "신선한 아귀찜"),
        Restaurant.Food(name: "어회", price: 18000, isRecommend: false, foodCategory: "해산물", description: "신선한 어회")
    ],
    mainImage: ["restaurant11"],
    foodType: [.steamed],
    foodCategory: ["해산물"],
    latitude: 34.44,
    longitude: 129.22
)

let restaurant12 = Restaurant(
    id: "ceoId12",
    password: "1234",
    restaurantInfo: RestaurantInfo(phoneNumber: 01056789012, name: "화덕피자", timeTable: "12:00~22:00", introduce: "부드러운 화덕피자를 즐기세요."),
    name: "화덕피자!",
    reviews: [
        Review(writer: "함지수", score: 5.0, contents: "맛있어요"),
        Review(writer: "봉주헌", score: 3.0, contents: "존맛탱"),
        Review(writer: "장여훈", score: 5.0, contents: "굿")
    ],
    deliveryFee: 2400,
    minimumPrice: 13000,
    menus: [
        Restaurant.Food(name: "페퍼로니 피자", price: 18000, isRecommend: true, foodCategory: "피자", description: "매운 페퍼로니 피자"),
        Restaurant.Food(name: "치즈피자", price: 16000, isRecommend: false, foodCategory: "피자", description: "치즈피자의 고소함")
    ],
    mainImage: ["restaurant12"],
    foodType: [.pizza],
    foodCategory: ["피자", "사이드", "음료"],
    latitude: 44.32,
    longitude: 22.222
)

let restaurant13 = Restaurant(
    id: "ceoId13",
    password: "1234",
    restaurantInfo: RestaurantInfo(phoneNumber: 01023456789, name: "파스타가게", timeTable: "11:30~21:30", introduce: "이탈리안 파스타의 맛을 즐기세요."),
    name: "파스타가게",
    reviews: [
        Review(writer: "유하은", score: 3.0, contents: "다른 지점에 비해 별로예요"),
        Review(writer: "함지수", score: 5.0, contents: "최고의 맛이었어요 ㅠㅠ")
    ],
    deliveryFee: 2000,
    minimumPrice: 16000,
    menus: [
        Restaurant.Food(name: "크림 파스타", price: 15000, isRecommend: true, foodCategory: "파스타", description: "고소한 크림소스의 파스타"),
        Restaurant.Food(name: "마르게리따 피자", price: 18000, isRecommend: false, foodCategory: "피자", description: "고풍스러운 마르게리따 피자")
    ],
    mainImage: ["restaurant13"],
    foodType: [.western],
    foodCategory: ["파스타", "피자", "음료"],
    latitude: 34.44,
    longitude: 129.22
)

let restaurant14 = Restaurant(
    id: "ceoId14",
    password: "1234",
    restaurantInfo: RestaurantInfo(phoneNumber: 01034567890, name: "한식당", timeTable: "11:00~20:00", introduce: "전통 한식을 맛보세요."),
    name: "한식당",
    reviews: [
        Review(writer: "유하은", score: 3.0, contents: "다른 지점에 비해 별로예요"),
        Review(writer: "함지수", score: 5.0, contents: "최고의 맛이었어요 ㅠㅠ")
    ],
    deliveryFee: 2000,
    minimumPrice: 16000,
    menus: [
        Restaurant.Food(name: "불고기", price: 18000, isRecommend: true, foodCategory: "고기요리", description: "부드러운 불고기"),
        Restaurant.Food(name: "비빔밥", price: 15000, isRecommend: false, foodCategory: "밥요리", description: "고소한 비빔밥")
    ],
    mainImage: ["restaurant14"],
    foodType: [.korean],
    foodCategory: ["고기요리", "밥요리", "사이드"],
    latitude: 34.44,
    longitude: 129.22
)

let restaurant15 = Restaurant(
    id: "ceoId15",
    password: "1234",
    restaurantInfo: RestaurantInfo(phoneNumber: 01098765432, name: "기사식당", timeTable: "11:00~21:00", introduce: "정갈한 한식을 맛보세요."),
    name: "기사식당",
    reviews: [
        Review(writer: "유하은", score: 2.0, contents: "다른 지점에 비해 별로예요"),
        Review(writer: "함지수", score: 5.0, contents: "최고의 맛이었어요 ㅠㅠ")
    ],
    deliveryFee: 2000,
    minimumPrice: 16000,
    menus: [
        Restaurant.Food(name: "불고기", price: 18000, isRecommend: true, foodCategory: "고기요리", description: "부드러운 불고기"),
        Restaurant.Food(name: "비빔밥", price: 15000, isRecommend: false, foodCategory: "밥요리", description: "고소한 비빔밥")
    ],
    mainImage: ["restaurant15"],
    foodType: [.korean],
    foodCategory: ["고기요리", "밥요리", "사이드"],
    latitude: 34.44,
    longitude: 129.22
)

let restaurant16 =
Restaurant(
    id: "ceoId16",
    password: "1234",
    restaurantInfo: RestaurantInfo(phoneNumber: 01012341234, name: "네네치킨", timeTable: "16:00~ 24:00", introduce: "네네 치킨입니다."),
    name: "네네치킨 광화문점",
    reviews: [
    Review(writer: "이영지", score: 4.0, image: "chicken", contents: "인생 치킨 만수무강하세요 사장님"),
    Review(writer: "김민지", score: 5.0, image: "soju", contents: "지친 인생에서,,,\n 최고의 맛이었어요 ㅠㅠ")
],
    deliveryFee: 3000,
    minimumPrice: 18000,
    menus: [
        Restaurant.Food(name: "후라이드(뼈)", price: 18000, isRecommend: true, foodCategory: "오리지널 치킨", description: "멋쟁이 김치찌개 인기메뉴", image: "chicken"),
        Restaurant.Food(name: "핫후라이드(뼈)", price: 19000, isRecommend: true, foodCategory: "오리지널 치킨", description: "멋쟁이 김치찌개 인기메뉴", image: "hotchicken"),
        Restaurant.Food(name: "치킨무", price: 2000, isRecommend: false, foodCategory: "사이드", description: "느끼할 때 먹는",image: "chickenmoo"),
        Restaurant.Food(name: "웨지감자", price: 8000, isRecommend: false, foodCategory: "사이드", description: "완전 인기메뉴",image: "potato"),
        Restaurant.Food(name: "생맥주", price: 5000, isRecommend: false, foodCategory: "음료", description: "완전 시원해요",image: "maekzoo"),
        Restaurant.Food(name: "소주", price: 6000, isRecommend: false, foodCategory: "음료", description: "완전 시원해요",image: "soju"),
        Restaurant.Food(name: "콜라", price: 2000, isRecommend: false, foodCategory: "음료", description: "완전 시원해요",image: "cola"),
       ],
    mainImage: ["nene"],
    foodType: [.chicken],
    foodCategory: ["오리지널 치킨","사이드","음료"],
    latitude: 32.44, longitude: 55.22)


let restaurant17 = Restaurant(
    id: "ceoId17",
    password: "1234",
    restaurantInfo: RestaurantInfo(phoneNumber: 01012341235, name: "스윗한 핫도그", timeTable: "11:00~21:00", introduce: "핫도그 드세요"),
    name: "스윗한 핫도그",
    reviews: [
        Review(writer: "유하은", score: 2.0, contents: "다른 지점에 비해 별로예요"),
        Review(writer: "함지수", score: 5.0, contents: "최고의 맛이었어요 ㅠㅠ")
    ],
    deliveryFee: 3000,
    minimumPrice: 16000,
    menus: [
        Restaurant.Food(name: "감자핫도그", price: 3500, isRecommend: true, foodCategory: "핫도그", description: "감자맛", image: "potatohotdog"),
        Restaurant.Food(name: "통못자핫도그", price: 4000, isRecommend: false, foodCategory: "핫도그", description: "통못자 맛", image: "tongmotzahotdog"),
        Restaurant.Food(name: "핫도그 3개 세트", price: 13000, isRecommend: true, foodCategory: "핫도그", description: "통못자 맛", image: "triplehotdog"),
        Restaurant.Food(name: "콜라", price: 2000, isRecommend: false, foodCategory: "음료", description: "완전 시원해요",image: "cola"),
    ],
    mainImage: ["hotdog"],
    foodType: [.koreanSnack],
    foodCategory: ["핫도그", "음료"],
    latitude: 34.44,
    longitude: 129.22)

let restaurant18 =
Restaurant(
    id: "ceoId18",
    password: "1234",
    restaurantInfo: RestaurantInfo(phoneNumber: 01012341234, name: "네네치킨", timeTable: "16:00~ 24:00", introduce: "네네 치킨입니다."),
    name: "네네치킨 광화문점",
    reviews: [
    Review(writer: "이영지", score: 4.0, image: "chicken", contents: "인생 치킨 만수무강하세요 사장님"),
    Review(writer: "김민지", score: 5.0, image: "soju", contents: "지친 인생에서,,,\n 최고의 맛이었어요 ㅠㅠ")
],
    deliveryFee: 3000,
    minimumPrice: 18000,
    menus: [
        Restaurant.Food(name: "후라이드(뼈)", price: 18000, isRecommend: true, foodCategory: "오리지널 치킨", description: "멋쟁이 김치찌개 인기메뉴", image: "chicken"),
        Restaurant.Food(name: "핫후라이드(뼈)", price: 19000, isRecommend: true, foodCategory: "오리지널 치킨", description: "멋쟁이 김치찌개 인기메뉴", image: "hotchicken"),
        Restaurant.Food(name: "치킨무", price: 2000, isRecommend: false, foodCategory: "사이드", description: "느끼할 때 먹는",image: "chickenmoo"),
        Restaurant.Food(name: "웨지감자", price: 8000, isRecommend: false, foodCategory: "사이드", description: "완전 인기메뉴",image: "potato"),
        Restaurant.Food(name: "생맥주", price: 5000, isRecommend: false, foodCategory: "음료", description: "완전 시원해요",image: "maekzoo"),
        Restaurant.Food(name: "소주", price: 6000, isRecommend: false, foodCategory: "음료", description: "완전 시원해요",image: "soju"),
        Restaurant.Food(name: "콜라", price: 2000, isRecommend: false, foodCategory: "음료", description: "완전 시원해요",image: "cola"),
       ],
    mainImage: ["nene"],
    foodType: [.chicken],
    foodCategory: ["오리지널 치킨","사이드","음료"],
    latitude: 32.44, longitude: 55.22)

let restaurant19 = Restaurant(
    id: "ceoId19",
    password: "1234",
    restaurantInfo: RestaurantInfo(phoneNumber: 01012341239, name: "디저트 카페", timeTable: "11:00~21:00", introduce: "다양한 디저트와 커피를 즐기세요."),
    name: "메가 기가 커피",
    reviews: [
        Review(writer: "유하은", score: 4.0, contents: "디저트가 맛있어요"),
        Review(writer: "함지수", score: 5.0, contents: "아늑한 분위기와 맛있는 커피")
    ],
    deliveryFee: 4000,
    minimumPrice: 8000,
    menus: [
        Restaurant.Food(name: "초콜릿 케이크", price: 7000, isRecommend: true, foodCategory: "디저트", description: "달콤한 초콜릿 케이크"),
        Restaurant.Food(name: "아메리카노", price: 4000, isRecommend: false, foodCategory: "음료", description: "부드러운 아메리카노")
    ],
    mainImage: ["megacoffee"],
    foodType: [.dessert],
    foodCategory: ["디저트", "음료"],
    latitude: 34.44,
    longitude: 129.22
)
