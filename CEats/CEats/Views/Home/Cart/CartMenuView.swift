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
    
    var colorSet: Color = Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                
                Text(userViewModel.user.foodCart?.restaurantName ?? "없습니다")
                    .font(.title3)
                    .bold()
                ForEach(userViewModel.user.foodCart?.cart ?? []){ food in //함수의 파라미터로 들어온 애는 상수로 들어온다. ~?~??~?~?~??~?~?~?~?? 뷰모델에서 바꾸는 함수를 만등러줘야하ㅏㅏㅏㅏㅏ
                    VStack{
                        HStack{
                            Button {
                                userViewModel.subtractCount(food: food)
                            } label: {
                                Image(systemName: "minus.circle.fill")
                            }
                            Text("\(food.foodCount)")
                            Button {
                                userViewModel.addCount(food: food)
                            } label: {
                                Image(systemName: "plus.circle.fill")
                            }
                        }
                        Text(food.description)
                    }
                }
            }
            .padding()
            NavigationLink {
                RTRView(restaurant: Restaurant(id: "ceoId", password: "1234", restaurantInfo: RestaurantInfo(), name: "멋쟁이 김치찌개", reviews: [Review(writer: "김멋사", score: 4.0, contents: "맛있긴 함"), Review(writer: "아이유", score: 5.0, contents: "최고의 맛이었어요 ㅠㅠ")], deliveryFee: 3000, minimumPrice: 14000, menus: [Restaurant.Food(name: "김치찌개", price: 8000, isRecommend: true, foodCategory: "김치찌개", description: "멋쟁이 김치찌개 인기메뉴", image: " "), Restaurant.Food(name: "소주", price: 4000, isRecommend: false, foodCategory: "주류", description: "처음처럼")], mainImage: ["kimchijjigae"], foodType: [.korean], foodCategory: ["식사", "사이드", "주류"], latitude: 32.44, longitude: 55.22))
            } label: {
                Text("+ 메뉴 추가")
            }
            .font(.caption)
            VStack {
                HStack {
                    Text("함께 주문하면 좋을 메뉴")
                        .bold()
                        .padding()
                    Spacer()
                }
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        // Add your code here for additional menu items
                    }
                }
                .padding()
            }
        }
        
    }
}



struct CartMenuView_Previews: PreviewProvider {
    static var previews: some View {
        CartMenuView()
            .environmentObject(RestaurantViewModel())
            .environmentObject(UserViewModel())
    }
}
