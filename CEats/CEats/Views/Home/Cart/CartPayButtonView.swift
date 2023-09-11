//
//  CartPayButtonView.swift
//  CEats
//
//  Created by 박범수 on 2023/09/11.
//

import SwiftUI

struct CartPayButtonView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    
    var body: some View {
        VStack {
            HStack {
                ZStack{
                    Rectangle()
                        .frame(width: 65, height: 1)
                    // 할인 전 금액
                    Text("\(userViewModel.user.foodCart?.fee ?? 0)원")
                        .font(.system(size: 16, weight: .regular))
                }
                .foregroundColor(.lightgray)
                
                // Total fee 로 !
                Text("\(userViewModel.user.foodCart?.fee ?? 0)원")
                    .font(.system(size: 18, weight: .bold))
                Text("결제하기")
                    .font(.system(size: 18, weight: .bold))
            }
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .padding()
            .background(.blue)
        }
        .onTapGesture {
            userViewModel.newOrder(restaurant: Restaurant.sampleData) { result in
                print("Update\n \(result)")
            }
        }
    }
}

struct CartPayButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CartPayButtonView()
            .environmentObject(UserViewModel())
    }
}
