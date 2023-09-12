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

    @State private var showingAlert: Bool = false
    @State private var isOpenOrderedSheet: Bool = false
    
    // MARK: - View
    var body: some View {
        Button {
            showingAlert = false
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
        .background(userViewModel.user.cEatsMoney < userViewModel.cartFee + userViewModel.deliveryOpt.fee ? .gray : .blue)
        .alert("결제가 됩니다.", isPresented: $showingAlert) {
            Button("뒤로가기") {
                showingAlert = false
            }
            Button {
                userViewModel.newOrder { result in
                    isOpenOrderedSheet = true
                }
                // 결제하기 눌렀을때 값 차감
                userViewModel.user.cEatsMoney -= userViewModel.cartFee + userViewModel.deliveryOpt.fee
                print(userViewModel.user.cEatsMoney)
                print(" 111 ")
            } label: {
                Text("결제하기")
            }
        } message: {
            Text("주문이 성공적으로 완료되었습니다.")
        }
        .fullScreenCover(isPresented: $isOpenOrderedSheet) {
            RealTimeOrderInfoView(isOpenOrderedSheet: $isOpenOrderedSheet)
        }
    }
}

struct CartPayButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CartPayButtonView()
            .environmentObject(UserViewModel())
    }
}
