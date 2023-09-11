//
//  CartMenuView.swift
//  CEats
//
//  Created by 박범수 on 2023/09/07.
//

import SwiftUI

// 장바구니: 사용자1 -> 가게1(음식1, 음식2)
// 유저1의 장바구니 -> 선택한 식당 이름, 선택한 음식, 수량, 선택한 식당의 추천 음식(무작위)
struct CartMenuView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @EnvironmentObject var restaurant: RestaurantViewModel
    var colorSet: UIColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text(userViewModel.user.foodCart?.restaurantName ?? "몰라")
                    .font(.title3)
                    .bold()
                ForEach(userViewModel.user.foodCart?.cart ?? []) { food in
                    VStack {
                        Divider()
                        HStack {
                            VStack(alignment: .leading) {
                                Text(food.name)
                                Text(food.description)
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                
                                Text("\(food.price)원")
                                    .bold()
                            }
                            Spacer()
                            ZStack {
                                Capsule()
                                    .fill(Color(colorSet))
                                    .frame(width: 100, height: 30)
                                HStack {
                                    Button {
                                        userViewModel.subtractCount(food: food)
                                    } label: {
                                        Image(systemName: "minus.circle.fill")
                                    }.disabled(food.foodCount == 0)
                                    Text("\(food.foodCount)")
                                    Button {
                                        userViewModel.addCount(food: food)
                                    } label: {
                                        Image(systemName: "plus.circle.fill")
                                    }
                                }
                                .padding()
                            }
                            .foregroundColor(.white)
                        }
                    }
                }
            }
            Divider()
        }
        .padding()
        NavigationLink {
            RTRView(restaurant: Restaurant(id: "ceoId", password: "1234", restaurantInfo: RestaurantInfo(), name: "멋쟁이 김치찌개", reviews: [Review(writer: "김멋사", score: 4.0, contents: "맛있긴 함"),Review(writer: "아이유", score: 5.0, contents: "최고의 맛이었어요 ㅠㅠ")], deliveryFee: 3000, minimumPrice: 14000, menus: [Restaurant.Food(name: "김치찌개", price: 8000, isRecommend: true, foodCategory: "김치찌개", description: "멋쟁이 김치찌개 인기메뉴", image: " "),Restaurant.Food(name: "소주", price: 4000, isRecommend: false, foodCategory: "주류", description: "처음처럼")], mainImage: ["kimchijjigae"], foodType: [.korean], foodCategory: ["식사","사이드","주류"], latitude: 32.44, longitude: 55.22))
        } label: {
            Text("+ 메뉴 추가")
        }
        .font(.caption)
//        VStack {
//            HStack {
//                Text("함께 주문하면 좋을 메뉴")
//                    .bold()
//                    .padding()
//                Spacer()
//            }
//            ScrollView(.horizontal, showsIndicators: false) {
//                HStack {
//                    ForEach(userViewModel.recommendFoods(food: userViewModel.user.foodCart?.cart ?? [], restaurant: userViewModel.user.foodCart?.restaurant ?? [Restaurant.sampleData])) { store in
//
//                        Button {
//
//                        } label: {
//                            HStack {
//                                VStack {
//                                    Text(store.name)
//                                        .foregroundColor(.black)
//                                    Text("\(store.price)")
//                                }
//                                Button {
//
//                                } label: {
//                                    Image(systemName: "plus.circle")
//                                        .font(.title)
//                                }
//                            }
//                            .overlay(
//                                RoundedRectangle(cornerRadius: 5)
//                                    .stroke(Color.gray, lineWidth: 2)
//                            )
//                        }
//                    }
//                }
//            }
//            .padding()
//        }
    }
}

struct CartMenuView_Previews: PreviewProvider {
    static var previews: some View {
        CartMenuView()
            .environmentObject(RestaurantViewModel())
            .environmentObject(UserViewModel())
    }
}
