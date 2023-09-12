//
//  RecommendRestaurantView.swift
//  CEats
//
//  Created by 유하은 on 2023/09/04.
//

import SwiftUI

struct RecommendRestaurantView: View {
    let restaurant: Restaurant
    
    var body: some View {
        VStack(alignment: .leading){
            Image(restaurant.mainImage.first ?? "kimchijjigae")
                .resizable()
                .frame(width: 300, height: 180)
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
                
            Text(restaurant.name)
                .padding(.top,10)
                .padding(.bottom,2)
                .foregroundColor(.black)
            HStack{
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                Text("\(restaurant.scoreMessage)")
                Text("(\(restaurant.reviews.count))")
                Text("1.5km")
                Text("-")
                Text("배달비: 2000") //이거 가게도 가지고 있는 정보여야겠다..
                
            }
            .font(.footnote)
            .foregroundColor(.secondary)
        }
    }
}

struct RecommendRestaurantView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendRestaurantView(restaurant: Restaurant(id: "ceoId2", password: "1234", restaurantInfo: .init(), name: "엽기떡볶이", reviews: [Review(writer: "유하은", score: 3.0, contents: "다른 엽떡 지점에 비해 별로예요"),Review(writer: "함지수", score: 5.0, contents: "최고의 맛이었어요 ㅠㅠ")], deliveryFee: 2000, minimumPrice: 16000, menus: [Restaurant.Food(name: "동대문 엽기 떡볶이", price: 14000, isRecommend: true, foodCategory: "떡볶이", description: "엽떡 인기메뉴", image: " "),Restaurant.Food(name: "동대문 엽기 오뎅", price: 14000, isRecommend: false, foodCategory: "떡볶이", description: "떡볶이 30% 오뎅 70%")], mainImage: [""], foodType: [.koreanSnack], foodCategory: ["떡볶이","사이드","주류"], latitude: 34.44, longitude: 129.22))
    }
}
