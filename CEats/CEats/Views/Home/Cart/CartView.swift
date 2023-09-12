//
//  CartView.swift
//  CEats
//
//  Created by 박범수 on 2023/09/07.
//

import SwiftUI

struct CartView: View {
    // MARK: - Properties
    @EnvironmentObject var userViewModel: UserViewModel
    @Binding var isOpenMapSheet: Bool
//    @State var isOpenOrderedSheet: Bool = false
    
    @State var fee: Int
    
    init(userViewModel: UserViewModel, isOpenMapSheet: Binding<Bool>) {
        self._isOpenMapSheet = isOpenMapSheet
        self.fee = userViewModel.user.foodCart?.restaurant.deliveryFee ?? 0
    }
    
    // MARK: - View
    var body: some View {
        NavigationStack {
            ScrollView {
                CartDeliveryView(isOpenMapSheet: $isOpenMapSheet, fee: $fee)
                CartMenuView()
                CartPayView(fee: $fee)
                // 결제 버튼 눌렸을 때 alert 뜨게 하기 ! (완)
                // 결제 버튼 눌렀을 때 cEatsMoney 차감되게 만들기
                // 멋쟁이 김치찌개 -> 수량 변경하면 그에 맞춰서 값 변동될 수 있게 만들기 (완 ~!1)
                // 멋쟁이 김치찌개 -> 메뉴 추가 -> 맞는 가게 뷰 연동
                // [CartMenuView] user.foodCart.restaurant을 통해서 뷰를 호출해야함
                // 값이 변경될 요소들 뷰모델 사용하기 !!!! (완)
                // 결제 금액 > CEats 머니 : 버튼 막기
                CartPayButtonView(fee: $fee)
            }
        }
        
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(userViewModel: UserViewModel(), isOpenMapSheet: .constant(false))
            .environmentObject(UserViewModel())
            .environmentObject(RestaurantViewModel())
    }
}
