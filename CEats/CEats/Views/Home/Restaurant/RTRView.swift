//
//  RTRView.swift
//  CEats
//
//  Created by gnksbm on 2023/09/04.
//

import SwiftUI

struct RTRView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var userViewModel: UserViewModel
    @State private var selected = ""
    
    let restaurant: Restaurant
    private let offsetY: CGFloat = .screenHeight / 12
    
    var navigationBackButton: some View {
        Button {
            dismiss()
        } label: {
            Image(systemName: "arrow.left")
        }
        .foregroundColor(.white)
        .bold()
    }
    
    var body: some View {
        /*
        // TODO: 멋쟁이 김치찌개 cornerRadius : 8정도 // 6적용
         식사, 사이드, 주류 어제 피드백 바탕으로 변경
         @Binding 제거 // end
         AddCartView 연결 // end
         */
        ScrollViewReader { proxy in
            ScrollView(showsIndicators: false) {
                GeometryReader { geo in
                    let offset = geo.frame(in: .global).minY
                    NavigationLink(destination: FullScreenImageView(imageName: restaurant.mainImage)) {
                        RTRTitleImageView(imageNamss: restaurant.mainImage)
                            .frame(width: .screenWidth, height: (.screenHeight / 4) + (offset > 0 ? offset : 0))
                            .offset(y: offset > 0 ? -offset : 0)
                    }
                }
                .frame(width: .screenWidth, height: .screenHeight / 4)
                RTRTitleInfoView(restaurant: restaurant)
                    .frame(width: .screenWidth * 0.85, height: .screenHeight / 9)
                    .background(.background)
                    .cornerRadius(3)
                    .clipped()
                    .shadow(color: .secondary, radius: 2)
                    .padding(.top, -offsetY)
                RTRSubInfoView(restaurant: restaurant)
                    .padding(.top, 30)
                    .padding(.horizontal)
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        ForEach(restaurant.reviews, id: \.id) { review in
                            NavigationLink {
                                ReviewInfoView(restaurant: restaurant, scrollID: review.id)
                            } label: {
                                ReviewMinimalView(review: review)
                                    .padding()
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.lightgray)
                                    )
                                    .frame(height: .screenHeight / 10)
                                    .padding(.trailing, 10)
                            }
                            .foregroundColor(.primary)
                        }
                    }
                    .padding()
                }
                RTRFoodCategoryView(categories: restaurant.foodCategory, selected: $selected)
                    .frame(width: .screenWidth)
                RTRFoodListView(restaurant: restaurant)
            }
            .onChange(of: selected) { newValue in
                print("onchangh: \(newValue)")
                guard newValue != "" else { return }
                withAnimation {
                    proxy.scrollTo(selected, anchor: .top)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: navigationBackButton)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                HStack {
                    ShareLink(item: "") {
                        Image(systemName: "square.and.arrow.up")
                    }
                    .padding(.trailing, 10)
                    Button {
                        userViewModel.likeButtonTapped(restaurant: restaurant)
                    } label: {
                        Image(systemName: userViewModel.user.favoriteRestaurant.contains(where: { $0.id == restaurant.id }) ? "heart.fill" : "heart")
                    }
                }
                .foregroundColor(.white)
                .bold()
            }
        }
    }
    
//    var backButton: some View {
//        Button {
//            dismiss()
//        } label: {
//            Image(systemName: "chevron.left")
//                .aspectRatio(contentMode: .fit)
//                .foregroundColor(.white)
//        }
//    }
}

struct RTRView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            RTRView(restaurant: Restaurant(id: "ceoId", password: "1234", restaurantInfo: RestaurantInfo(), name: "멋쟁이 김치찌개", reviews: [Review(writer: "김멋사", score: 4.0, contents: "맛있긴 함"),Review(writer: "아이유", score: 5.0, contents: "최고의 맛이었어요 ㅠㅠ")], deliveryFee: 3000, minimumPrice: 14000, menus: [Restaurant.Food(name: "김치찌개", price: 8000, isRecommend: true, foodCategory: "김치찌개", description: "멋쟁이 김치찌개 인기메뉴", image: " "),Restaurant.Food(name: "소주", price: 4000, isRecommend: false, foodCategory: "주류", description: "처음처럼")], mainImage: ["kimchijjigae"], foodType: [.korean], foodCategory: ["식사","사이드","주류"], latitude: 32.44, longitude: 55.22))
        }
        .environmentObject(UserViewModel())
    }
}
