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
    @Environment(\.colorScheme) private var colorScheme
    //@State private var numberOfFoods: Int = 1
    @State private var showAlert: Bool = false
    
    let restaurant: Restaurant
    @State var food: Restaurant.Food
    
    var body: some View {
        
        VStack {
            ScrollView {
                if let foodImage = food.image {
                    Image(foodImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: .screenWidth * 1 , height: .screenHeight * 0.33)
                    Spacer()
                    HStack {
                        VStack(alignment: .leading) {
                            Text("\(food.name)")
                                .padding(.top,20)
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
                    HStack {
                        Text("가격")
                            .bold()
                            .font(.title3)
                        
                        Spacer()
                        
                        Text("\(food.price * food.foodCount)")
                    }
                    .padding(.horizontal, 30)
                    .padding(.bottom, 20)
                    
                    HStack {
                        Text("수량")
                            .bold()
                            .font(.title3)
                        
                        Spacer()
                        
                        Button {
                            if food.foodCount > 1 {
                                food.foodCount -= 1
                            }
                        } label: {
                            Circle()
                                .stroke(
                                    colorScheme == .light ?
                                    food.foodCount <= 1 ?
                                        Color.lightgray : .gray :
                                        food.foodCount <= 1 ?
                                            .gray : .lightgray
                                )
                                .foregroundColor(.clear)
                                .frame(width: 40, height: 40)
                                .overlay(
                                    Text("-")
                                        .foregroundColor(
                                            colorScheme == .light ?
                                            food.foodCount <= 1 ?
                                                .lightgray : .gray :
                                                food.foodCount <= 1 ?
                                                    .gray : .lightgray
                                        )
                                )
                        }
                        .disabled(food.foodCount <= 1)
                        
                        Text("\(food.foodCount)")
                            .padding(.horizontal, 5)
                        
                        Button {
                            food.foodCount += 1
                        } label: {
                            Circle()
                                .stroke(
                                    colorScheme == .light ?
                                        .gray : .lightgray
                                )
                                .foregroundColor(.clear)
                                .frame(width: 40, height: 40)
                                .overlay(
                                    Text("+")
                                        .foregroundColor(
                                            colorScheme == .light ?
                                                .gray : .lightgray
                                        )
                                )
                            
                        }
                        
                    }
                    .padding(.horizontal, 30)
                    
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
                    HStack {
                        Text("가격")
                            .bold()
                            .font(.title3)
                        
                        Spacer()
                        
                        Text("\(food.price * food.foodCount)")
                    }
                    .padding(.horizontal, 30)
                    .padding(.bottom, 20)
                    
                    HStack {
                        Text("수량")
                            .bold()
                            .font(.title3)
                        
                        Spacer()
                        
                        Button {
                            if food.foodCount > 1 {
                                food.foodCount -= 1
                            }
                        } label: {
                            Circle()
                                .stroke(
                                    colorScheme == .light ?
                                    food.foodCount <= 1 ?
                                        Color.lightgray : .gray :
                                        food.foodCount <= 1 ?
                                            .gray : .lightgray
                                )
                                .foregroundColor(.clear)
                                .frame(width: 40, height: 40)
                                .overlay(
                                    Text("-")
                                        .foregroundColor(
                                            colorScheme == .light ?
                                            food.foodCount <= 1 ?
                                                .lightgray : .gray :
                                                food.foodCount <= 1 ?
                                                    .gray : .lightgray
                                        )
                                )
                        }
                        .disabled(food.foodCount <= 1)
                        
                        Text("\(food.foodCount)")
                            .padding(.horizontal, 5)
                        
                        Button {
                            food.foodCount += 1
                        } label: {
                            Circle()
                                .stroke(
                                    colorScheme == .light ?
                                        .gray : .lightgray
                                )
                                .foregroundColor(.clear)
                                .frame(width: 40, height: 40)
                                .overlay(
                                    Text("+")
                                        .foregroundColor(
                                            colorScheme == .light ?
                                                .gray : .lightgray
                                        )
                                )
                        }
                    }
                    .padding(.horizontal, 30)
                }
                
                Spacer()
            }
            if restaurant.isOpen {
                Button {
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
                        dismiss()
                    }
                } label: {
                    Text("배달 카트에 담기")
                        .font(.title3)
                        .bold()
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        .background(Color.cEatsBlue)
                }
            } else {
                Text("지금은 준비 중이에요")
                    .font(.title3)
                    .bold()
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(Color.gray)
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                CEatsNavigationBackButton {
                    dismiss()
                }
            }
        }
        .foregroundColor(colorScheme == .light ? .white : .lightgray)
        .bold()
        .alert(isPresented: $showAlert) {
            Alert(title: Text("같은 가게의 메뉴만 담을 수 있습니다"),
                  message: Text("주문할 가게를 변경하실 경우 이전에 담은 메뉴가 삭제됩니다.."),
                  primaryButton: .cancel(Text("취소")) {
                dismiss()
            },
                  secondaryButton: .default(Text("새로담기")) {
                userViewModel.user.foodCart?.cart.removeAll()
                userViewModel.user.foodCart = User.Cart(restaurant: restaurant, cart: [])
                userViewModel.updateUserCart(restaurant: restaurant, food: food)
                dismiss()
            }
            )
            
        }
    }
    
    
}


struct AddCartView_Previews: PreviewProvider {
    static var previews: some View {
        AddCartView(restaurant: Restaurant.sampleData, food: Restaurant.Food(name: "김치찌개", price: 8000, isRecommend: true, foodCategory: "김치찌개", description: "멋쟁이 김치찌개 인기메뉴"))
            .environmentObject(RestaurantViewModel())
    }
}



