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
    
    var body: some View {
        
        VStack {
            ScrollView {
                if let foodImage = food.image {
                    Image(foodImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: .screenWidth * 1 , height: .screenHeight * 0.33)
                    
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
                        
                        Text("\(food.price * numberOfFoods)")
                    }
                    .padding(.horizontal, 30)
                    .padding(.bottom, 20)
                    
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
                            Circle()
                                .stroke(numberOfFoods <= 1 ? Color.lightgray : Color.gray)
                                .foregroundColor(.clear)
                                .frame(width: 40, height: 40)
                                .overlay(
                                    Text("-")
                                        .foregroundColor(numberOfFoods <= 1 ? .lightgray : .gray)
                                )
                        }
                        .disabled(numberOfFoods <= 1)
                        
                        Text("\(numberOfFoods)")
                            .padding(.horizontal, 5)
                        
                        Button {
                            numberOfFoods += 1
                        } label: {
                            Circle()
                                .stroke(Color.gray)
                                .foregroundColor(.clear)
                                .frame(width: 40, height: 40)
                                .overlay(
                                    Text("+")
                                        .foregroundColor(.gray)
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
                        
                        Text("\(food.price * numberOfFoods)")
                    }
                    .padding(.horizontal, 30)
                    .padding(.bottom, 20)
                    
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
                            Circle()
                                .stroke(numberOfFoods <= 1 ? Color.lightgray : Color.gray)
                                .foregroundColor(.clear)
                                .frame(width: 40, height: 40)
                                .overlay(
                                    Text("-")
                                        .foregroundColor(numberOfFoods <= 1 ? .lightgray : .gray)
                                )
                        }
                        .disabled(numberOfFoods <= 1)
                        
                        Text("\(numberOfFoods)")
                            .padding(.horizontal, 5)
                        
                        Button {
                            numberOfFoods += 1
                        } label: {
                            Circle()
                                .stroke(Color.gray)
                                .foregroundColor(.clear)
                                .frame(width: 40, height: 40)
                                .overlay(
                                    Text("+")
                                        .foregroundColor(.gray)
                                )
                        }
                    }
                    .padding(.horizontal, 30)
                }
                
                Spacer()
            }
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



