//
//  CartPayView.swift
//  CEats
//
//  Created by 박범수 on 2023/09/07.
//

import SwiftUI

struct CartPayView: View {
     var food: Food = Food.sampleData
    var restaurant: Restaurant = Restaurant.sampleData
    
    @State var isappeal: Bool = false
    @State var ispayment: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text("주문금액")
                        .padding(.leading)
                    Spacer()
                    Text("\(food.price)원")
                        .padding(.trailing)
                }
                HStack {
                    Text("배달비")
                        .padding([.top, .leading, .bottom])
                    Spacer()
                    Text("\(restaurant.deliveryFee)원")
                        .padding(.trailing)
                }
                Divider()
                HStack {
                    Text("총 결제금액")
                    Spacer()
                    Text("\(food.price + restaurant.deliveryFee)원")
                }
                .font(.title3)
                .bold()
                .padding()
                Divider()
                
                HStack {
                    Text("요청사항")
                        .font(.title3)
                        .bold()
                        .padding()
                    Spacer()
                    Button {
                        // 눌리면 꺾새 내려가게 해야함.
                        // CartappealView 가 보임.
                        
                        isappeal.toggle()
                    } label: {
                        Image(systemName: isappeal ? "chevron.down" : "control")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .foregroundColor(.black)
                            .frame(width: 20, height: 10)
                            .padding(.trailing)
                    }
                }
                Divider()
                if isappeal {
                    // CartappealView 가 보임.
                    VStack {
                        CartAppealView()
                    }
                }
                HStack {
                    Text("결제수단")
                        .font(.title3)
                        .bold()
                        .padding()
                    Spacer()
                    Button {
                        //눌리면 꺾새 내려가게 해야함.
                        // CartpaymentVIew 가 보임
//                        if ispayment {
//                            // CartappealView 가 보임.
//                                CartpaymentView()
//
//                        }
                        ispayment.toggle()
                    } label: {
                        Image(systemName: ispayment ? "chevron.down" : "control")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .foregroundColor(.black)
                            .frame(width: 20, height: 10)
                            .padding(.trailing)
                    }
                }
                Divider()
                
            }
            .padding()
        }
    }
}


struct CartPayView_Previews: PreviewProvider {
    static var previews: some View {
        CartPayView()
    }
}
