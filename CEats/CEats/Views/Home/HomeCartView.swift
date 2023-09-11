//
//  HomeCartView.swift
//  CEats
//
//  Created by 박범수 on 2023/09/10.
//

import SwiftUI

struct HomeCartView: View {
    @Binding var order: Order
    
    var body: some View {
        VStack(spacing:0){
            NavigationLink {
                // 바인딩 어케 사용하죠?
//                CartView()
            } label: {
                VStack(spacing:0) {
                    HStack{
                        ZStack{
                            Circle()
                                .frame(width: 30)
                            Text("\(order.orderedMenu.count)")
                                .foregroundColor(.blue)
                        }
                        Text("카트보기")
                        Spacer()
                        ZStack{
                            Rectangle()
                                .frame(width: 80, height: 1)
                            Text("10,700원")
                        }
                        .foregroundColor(.lightgray)
                        
                        Text("\(order.orderedMenu[0].price)원")
                            .font(.system(size: 18, weight: .bold))
                    }
                }
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(.blue)
            }
        }
    }
}
