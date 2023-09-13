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
    @EnvironmentObject private var userViewModel: UserViewModel
    @State private var showingAlert: Bool = false
    var colorSet: UIColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
    
    var body: some View {
        VStack {
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
                                
                                Text("\(food.price * food.foodCount)원")
                                    .bold()
                            }
                            Spacer()
                            ZStack {
                                Capsule()
                                    .fill(Color(colorSet))
                                    .frame(width: 100, height: 30)
                                HStack {
                                    
                                    if food.foodCount == 1 {
                                        Button {
                                            print("alert")
                                            showingAlert = true
                                            userViewModel.removeFood(food: food)
                                        } label: {
                                            Image(systemName: "trash.fill")
                                        }
                                        .alert(isPresented: $showingAlert) {
                                            Alert(
                                                title: Text("hi"),
                                                message: Text("alert"),
                                                dismissButton: .default(Text("ok"))
                                            )
                                        }
                                    } else {
                                        Button {
                                            userViewModel.subtractCount(food: food)
                                        } label: {
                                            Image(systemName: "minus.circle.fill")
                                        }.disabled(food.foodCount == 0)
                                    }
                                    
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
            NavigationLink {
                // userViewModel.user.foodCart.restaurant을 통해서 뷰를 호출해야함.
                // if let으로 ! -> 아닐 경우 넘어가지 않게 !
                if let restaurant = userViewModel.user.foodCart?.restaurant {
                    RTRView(restaurant: restaurant)
                }
            } label: {
                Text("+ 메뉴 추가")
            }
            .font(.caption)
        }
        .padding()
    }
}

struct CartMenuView_Previews: PreviewProvider {
    static var previews: some View {
        CartMenuView()
            .environmentObject(UserViewModel())
    }
}
