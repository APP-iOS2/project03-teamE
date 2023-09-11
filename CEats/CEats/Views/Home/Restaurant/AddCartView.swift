//
//  AddCartView.swift
//  CEats
//
//  Created by 변상우 on 2023/09/05.
//

import SwiftUI

struct AddCartView: View {
    let food: Restaurant.Food
    
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
