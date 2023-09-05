//
//  RestaurantView.swift
//  CEats
//
//  Created by gnksbm on 2023/09/04.
//

import SwiftUI

struct RestaurantView: View {
    @Binding var restaurant: Restaurant
    private let offsetY: CGFloat = .screenHeight / 12
    
    var body: some View {
        ScrollView {
            VStack {
                RestaurantTitleImageView(imageNamss: $restaurant.mainImage)
                    .frame(width: .screenWidth, height: .screenHeight / 4)
                    .background(.clear)
                RestaurantTitleInfoView(restaurant: $restaurant)
                    .frame(width: .screenWidth * 0.85, height: .screenHeight / 9)
                    .background(.white)
                    .clipped()
                    .shadow(radius: 5)
                    .padding(.top, -offsetY)
                VStack {
                    RestaurantSubInfoView()
                        .padding(.top, 30)
                        .padding(.horizontal)
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach($restaurant.reviews, id: \.id) { $review in
                                ReviewMinimalView(review: $review)
                                    .padding()
                                    .border(.quaternary, width: 1)
                                    .cornerRadius(5)
                                    .frame(height: .screenHeight / 10)
                                    .padding(.trailing, 10)
                            }
                            .padding()
                        }
                    }
                    .scrollIndicators(.hidden)
                    RestaurantFoodCategoryView(categories: $restaurant.foodCategory)
                        .frame(width: .screenWidth)
                    RestaurantFoodListView(restaurant: $restaurant)
                }

            }
        }
        .ignoresSafeArea()
    }
}

struct RestaurantView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            RestaurantView(restaurant: .constant(Restaurant(id: "ceoId", password: "1234", name: "멋쟁이 김치찌개", reviews: [Review(writer: "김멋사", score: 4.0, contents: "맛있긴 함"),Review(writer: "아이유", score: 5.0, contents: "최고의 맛이었어요 ㅠㅠ")], deliveryFee: 3000, minimumPrice: 14000, menus: [Food(name: "김치찌개", price: 8000, isRecommend: true, foodCategory: "김치찌개", description: "멋쟁이 김치찌개 인기메뉴", image: " "),Food(name: "소주", price: 4000, isRecommend: false, foodCategory: "주류", description: "처음처럼")], mainImage: ["kimchijjigae"], foodType: [.korean], foodCategory: ["식사","사이드","주류"], latitude: 32.44, longitude: 55.22)))
        }
    }
}
