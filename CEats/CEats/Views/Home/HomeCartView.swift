//
//  HomeCartView.swift
//  CEats
//
//  Created by 박범수 on 2023/09/10.
//

import SwiftUI

struct HomeCartView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @Binding var isOpenMapSheet: Bool
    
    var body: some View {
        VStack {
            NavigationLink {
                CartView(isOpenMapSheet: $isOpenMapSheet, tabIndex: .constant(2))
            } label: {
                VStack {
                    HStack {
                        ZStack{
                            Circle()
                                .frame(width: 30)
                            Text("\(userViewModel.user.foodCart?.cart.count ?? 0)")
                                .foregroundColor(.blue)
                        }
                        Text("카트보기")
                        Spacer()
//                        ZStack{
//                            Rectangle()
//                                .frame(width: 80, height: 1)
//                            Text("\(user.foodCart?.fee ?? 0) 원")
//                        }
//                        .foregroundColor(.lightgray)
                        
                        Text("\(userViewModel.cartFee + userViewModel.deliveryOpt.fee) 원")
                            .font(.system(size: 18, weight: .bold))
                            .padding(.trailing, 10)
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

struct HomeCartView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            HomeCartView(isOpenMapSheet: .constant(false))
                .environmentObject(RestaurantViewModel())
                .environmentObject(UserViewModel())
        }
    }
}
