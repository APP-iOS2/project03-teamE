//
//  AddCartView.swift
//  CEats
//
//  Created by 변상우 on 2023/09/05.
//

import SwiftUI

struct AddCartView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @Environment(\.dismiss) private var dismiss
    
    @State private var numberOfFoods: Int = 1
    @State private var showAlert: Bool = false
    
    let restaurant: Restaurant
    let food: Restaurant.Food
    
    // 중복되는 뷰를 ViewBuilder를 통해 정리
    @ViewBuilder
    var headerView: some View {
        VStack {
            if let foodImage = food.image {
                VStack{
                    Image(foodImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: .screenWidth * 1 , height: .screenHeight * 0.33)
                        .padding(.bottom,30)
                    HStack {
                        VStack(alignment: .leading) {
                            Text("\(food.name)")
                                .font(.largeTitle)
                                .bold()
                                .padding(.bottom, 4)
                            
                            Text("\(food.description)")
                        }
                        Spacer()
                    }
                    .padding(.horizontal, 30)
                    .padding(.bottom, 20)
                }
            }
            else {
                HStack {
                    VStack(alignment: .leading) {
                        Text("\(food.name)")
                            .font(.largeTitle)
                            .bold()
                            .padding(.bottom, 4)
                        
                        Text("\(food.description)")
                    }
                    Spacer()
                }
                .padding(.top, 20)
                .padding(.horizontal, 30)
                .padding(.bottom, 30)
            }
        }
    }
    
    var body: some View {
        VStack {
            ScrollView {
                headerView // ViewBuilder로 정리한 뷰 적용
                
                // 가격 및 수량 부분
                HStack {
                    Text("가격")
                        .bold()
                        .font(.title3)
                    
                    Spacer()
                    
                    Text("\(food.price * numberOfFoods)")
                }
                .padding(.horizontal, 30)
                .padding(.bottom, 20)
                
                // 수량 설정 부분
                HStack {
                    Text("수량")
                        .bold()
                        .font(.title3)
                    
                    Spacer()
                    
                    Button {
                        if numberOfFoods > 1 {
                            numberOfFoods -= 1
                        }
                    } label: {
                        CircleButton(symbol: "-", isEnabled: numberOfFoods > 1)
                    }
                    
                    Text("\(numberOfFoods)")
                        .padding(.horizontal, 5)
                    
                    Button {
                        numberOfFoods += 1
                    } label: {
                        CircleButton(symbol: "+", isEnabled: true)
                    }
                }
                .padding(.horizontal, 30)
                
                Spacer()
            }
            Spacer()
            
            if restaurant.isOpen {
                Button {
                    print(userViewModel.user.foodCart?.restaurant.name)
                    print(restaurant.name)
                    print("------------")
                    if let userCart = userViewModel.user.foodCart {
                        if userCart.restaurant.name != restaurant.name {
                            showAlert = true
                        }
                        else {
                            userViewModel.updateUserCart(restaurant: restaurant, food: food)
                            dismiss()
                        }
                    }
                    else{
                        userViewModel.user.foodCart = User.Cart(restaurant: restaurant, cart: [])
                        userViewModel.updateUserCart(restaurant: restaurant, food: food)
                        print(userViewModel.user.foodCart)
                        dismiss()
                    }
                } label: {
                    Text("배달 카트에 담기")
                        .font(.title3)
                        .bold()
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        .background(Color.blue)
                }
            } else {
                Text("오늘 오후 12:00 오픈")
                    .font(.title3)
                    .bold()
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(Color.gray)
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("같은 가게의 메뉴만 담을 수 있습니다"),
                message: Text("주문할 가게를 변경하실 경우 이전에 담은 메뉴가 삭제됩니다.."),
                primaryButton: .cancel(Text("취소")) {
                    dismiss()
                },
                secondaryButton: .default(Text("새로담기")) {
                    // TODO: 새로운 가게의 메뉴로 갱신하기
                }
            )
        }
        
        
    }
    
    private func handleAddToCart() {
        //...
    }
}

// 플러스/마이너스 버튼을 위한 커스텀 뷰
struct CircleButton: View {
    let symbol: String
    let isEnabled: Bool
    
    var body: some View {
        Circle()
            .stroke(isEnabled ? Color.gray : Color.lightgray)
            .foregroundColor(.clear)
            .frame(width: 40, height: 40)
            .overlay(
                Text(symbol)
                    .foregroundColor(isEnabled ? .gray : .lightgray)
            )
    }
}


struct AddCartView_Previews: PreviewProvider {
    static var previews: some View {
        AddCartView(restaurant: Restaurant.sampleData, food: Restaurant.Food(name: "김치찌개", price: 8000, isRecommend: true, foodCategory: "김치찌개", description: "멋쟁이 김치찌개 인기메뉴",image: "kimchiSoup"))
            .environmentObject(RestaurantViewModel())
    }
}
