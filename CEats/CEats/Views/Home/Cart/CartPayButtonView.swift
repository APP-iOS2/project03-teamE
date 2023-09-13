//
//  CartPayButtonView.swift
//  CEats
//
//  Created by 박범수 on 2023/09/11.
//

import SwiftUI

struct CartPayButtonView: View {
    // MARK: - Properties
    @EnvironmentObject private var userViewModel: UserViewModel
    @EnvironmentObject private var restaurantViewModel: RestaurantViewModel

    @Binding var showingAlert: Bool
    // MARK: - View
    var body: some View {
        Button {
            showingAlert = true
        } label: {
            switch userViewModel.deliveryOpt{
            case .onlyOne:
                HStack {
                    Text("\(userViewModel.cartFee + userViewModel.deliveryOpt.fee)원")
                        .font(.system(size: 18, weight: .bold))
                    Text("결제하기")
                        .font(.system(size: 18, weight: .bold))
                }
            case .save:
                HStack {
                    ZStack{
                        Rectangle()
                            .frame(width: 65, height: 1)
                        // 할인 전 금액
                        Text("\(userViewModel.cartFee + userViewModel.deliveryOpt.fee + 1000)원")
                            .font(.system(size: 16, weight: .regular))
                            .foregroundColor(.lightgray)
                    }
                    Text("\(userViewModel.cartFee + userViewModel.deliveryOpt.fee)원")
                        .font(.system(size: 18, weight: .bold))
                    Text("결제하기")
                        .font(.system(size: 18, weight: .bold))
                }
            }
        }
        .foregroundStyle(.white)
        .frame(maxWidth: .infinity)
        .padding()
        .background(
            userViewModel.user.cEatsMoney > userViewModel.cartFee + userViewModel.deliveryOpt.fee &&
            restaurantViewModel.isOpen(restaurant: userViewModel.user.foodCart?.restaurant) ? .blue : .gray)
//        .background(
//            restaurantViewModel.isOpen(restaurant: userViewModel.user.foodCart?.restaurant) ? .gray : .blue
//        )
        .disabled(!(userViewModel.user.cEatsMoney > userViewModel.cartFee + userViewModel.deliveryOpt.fee &&
                  restaurantViewModel.isOpen(restaurant: userViewModel.user.foodCart?.restaurant)))
//        .disabled(!restaurantViewModel.isOpen(restaurant: userViewModel.user.foodCart?.restaurant))
        .onAppear {
            print(userViewModel.user.cEatsMoney > userViewModel.cartFee + userViewModel.deliveryOpt.fee &&
                  restaurantViewModel.isOpen(restaurant: userViewModel.user.foodCart?.restaurant))
        }
    }
}

struct CartPayButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CartPayButtonView(showingAlert: .constant(false))
            .environmentObject(UserViewModel())
    }
}
