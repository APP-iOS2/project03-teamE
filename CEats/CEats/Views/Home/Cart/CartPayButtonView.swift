//
//  CartPayButtonView.swift
//  CEats
//
//  Created by 박범수 on 2023/09/11.
//

import SwiftUI

struct CartPayButtonView: View {
    // MARK: - Properties
    @EnvironmentObject var userViewModel: UserViewModel
    @Binding var fee: Int
    @State var showingAlert: Bool = false
    @State var isOpenOrderedSheet: Bool = false
    
    var foodCost: Int {
        let totalFoodFee = userViewModel.user.foodCart?.cart.map({ $0.price * $0.foodCount }).reduce(0) { $0 + $1 } ?? 0
        return totalFoodFee
    }
    
    
    
    // MARK: - View
    var body: some View {
        NavigationStack {
            // CEats 머니가 결제 금액보다 적으면 잠기게 
            if userViewModel.user.cEatsMoney < foodCost + fee {
                HStack {
                    if userViewModel.user.foodCart?.fee ?? 0 == foodCost + fee {
                        Text("\(userViewModel.user.foodCart?.fee ?? 0)원")
                            .font(.system(size: 18, weight: .bold))
                        Text("결제하기")
                            .font(.system(size: 18, weight: .bold))
                    }else if userViewModel.user.foodCart?.fee ?? 0 > foodCost + fee {
                        ZStack{
                            Rectangle()
                                .frame(width: 65, height: 1)
                            // 할인 전 금액
                            Text("\(userViewModel.user.foodCart?.fee ?? 0)원")
                                .font(.system(size: 16, weight: .regular))
                        }
                        .foregroundColor(.lightgray)
                        
                        // Total fee 로 !
                        Text("\(foodCost + fee)원")
                            .font(.system(size: 18, weight: .bold))
                        Text("결제하기")
                            .font(.system(size: 18, weight: .bold))
                    }
                }
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.gray)
            } else {
                Button {
                    showingAlert = true
                } label: {
                    HStack {
                        if userViewModel.user.foodCart?.fee ?? 0 == foodCost + fee {
                            Text("\(userViewModel.user.foodCart?.fee ?? 0)원")
                                .font(.system(size: 18, weight: .bold))
                            Text("결제하기")
                                .font(.system(size: 18, weight: .bold))
                        }else if userViewModel.user.foodCart?.fee ?? 0 > foodCost + fee {
                            ZStack{
                                Rectangle()
                                    .frame(width: 65, height: 1)
                                // 할인 전 금액
                                Text("\(userViewModel.user.foodCart?.fee ?? 0)원")
                                    .font(.system(size: 16, weight: .regular))
                            }
                            .foregroundColor(.lightgray)
                            
                            // Total fee 로 !
                            Text("\(foodCost + fee)원")
                                .font(.system(size: 18, weight: .bold))
                            Text("결제하기")
                                .font(.system(size: 18, weight: .bold))
                        }
                    }
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.blue)
                }
                .fullScreenCover(isPresented: $isOpenOrderedSheet, content: {
                    RealTimeOrderInfoView(isOpenOrderedSheet: $isOpenOrderedSheet)
                })
                .alert("결제가 됩니다.", isPresented: $showingAlert) {
                    Button("뒤로가기") {
                        showingAlert = false
                        isOpenOrderedSheet = false
                    }
                    Button {
                        isOpenOrderedSheet = true
                        
                        // 결제하기 눌렀을때 값 차감
                        userViewModel.user.cEatsMoney = userViewModel.user.cEatsMoney - (foodCost + fee)
                        print(userViewModel.user.cEatsMoney)
                        print(" 111 ")
                    } label: {
                        Text("결제하기")
                    }
                } message: {
                    Text("This is alert dialog sample")
                }
                
            }
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
        CartPayButtonView(fee: .constant(1000))
            .environmentObject(UserViewModel())
    }
}
