//
//  AddCartView.swift
//  CEats
//
//  Created by 변상우 on 2023/09/05.
//

import SwiftUI

struct AddCartView: View {
    @State var food: Restaurant.Food
    
    @Environment(\.dismiss) private var dismiss
    @State private var numberOfFoods: Int = 1
    //
    var body: some View {
        VStack {
            Image(food.image ?? "")
                .resizable()
                .scaledToFill()
                .frame(width: .screenWidth * 1 , height: .screenHeight * 0.33)
                .padding(70)
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
            ScrollView(.vertical) {
                HStack {
                    Text("가격")
                        .bold()
                        .font(.title3)
                    
                    Spacer()
                    
                    Text("\(food.price * food.foodCartCount)")
                }
                .padding(.horizontal, 30)
                .padding(.bottom, 20)
                
                
                HStack {
                    Text("수량")
                        .bold()
                        .font(.title3)
                    
                    Spacer()
                    
                    Button {
                        if food.foodCartCount > 1 {
                            food.foodCartCount -= 1
                        }
                    } label: {
                        Circle()
                            .stroke(food.foodCartCount <= 1 ? Color.lightgray : Color.gray)
                            .foregroundColor(.clear)
                            .frame(width: 40, height: 40)
                            .overlay(
                                Text("-")
                                    .foregroundColor(food.foodCartCount <= 1 ? .lightgray : .gray)
                            )
                    }
                    .disabled(food.foodCartCount <= 1)
                    
                    Text("\(food.foodCartCount)")
                        .padding(.horizontal, 5)
                    
                    Button {
                        food.foodCartCount += 1
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
            
            Button {
//                UserViewModel().user.updateCart(cart: )
                dismiss()
            } label: {
                Text("배달 카트에 담기")
                    .font(.title3)
                    .bold()
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(Color.blue)
            }
        }
    }
}

struct AddCartView_Previews: PreviewProvider {
    static var previews: some View {
        AddCartView(food: Restaurant.Food(name: "김치찌개", price: 8000, isRecommend: true, foodCategory: "김치찌개", description: "멋쟁이 김치찌개 인기메뉴", image: "kimchiSoup"))
    }
}
