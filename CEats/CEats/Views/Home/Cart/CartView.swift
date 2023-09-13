//
//  CartView.swift
//  CEats
//
//  Created by 박범수 on 2023/09/07.
//

import SwiftUI

struct CartView: View {
    // MARK: - Properties
    @Binding var isOpenMapSheet: Bool
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var userViewModel: UserViewModel
    @State private var showingAlert: Bool = false
    @State private var isOpenOrderedSheet: Bool = false
    @Binding var tabIndex: Int
    @State private var isEdited: Bool = false
    @State private var progress: CGFloat = 0.0
    @State private var isAnimating = false
    
    private var isCartEmpty: Bool {
        ((userViewModel.user.foodCart?.cart.isEmpty) == nil)
    }
    
    // MARK: - View
    var body: some View {
        if isCartEmpty {
            VStack(spacing: 50) {
                VStack {
                    Text("즐겨찾는 맛집이 없습니다.")
                    Text("좋아하는 맛집에 \u{2665}를 눌러주세요.")
                }
                Image("FavoriteEx")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()

                Button {
                    do { withAnimation(.easeOut(duration: 0.1)) {
                        self.isAnimating.toggle()
                        self.progress = self.isAnimating ? 1 : 0
                    }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            tabIndex = 0
                            self.isAnimating.toggle()
                            self.progress = 0
                        }
                    }
                } label: {
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 2)
                            .frame(width: 180, height: 50)
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.gray)
                            .frame(width: 180 * progress, height: 50)
                            .animation(.linear(duration: 0.3), value: isAnimating)
                        Text("쿠팡이츠 맛집 구경가기")
                            .foregroundColor(.black)
                            .frame(width: 180, height: 50)
                    }
                }
            }
        } else {
            ScrollView(showsIndicators: false) {
                CartDeliveryView(isOpenMapSheet: $isOpenMapSheet)
                CartMenuView()
                CartPayView()
                // 결제 버튼 눌렸을 때 alert 뜨게 하기 ! (완)
                // 결제 버튼 눌렀을 때 cEatsMoney 차감되게 만들기 (완)
                // 멋쟁이 김치찌개 -> 수량 변경하면 그에 맞춰서 값 변동될 수 있게 만들기 (완 ~!1)
                // 멋쟁이 김치찌개 -> 메뉴 추가 -> 맞는 가게 뷰 연동
                // [CartMenuView] user.foodCart.restaurant을 통해서 뷰를 호출해야함
                // 값이 변경될 요소들 뷰모델 사용하기 !!!! (완)
                // 결제 금액 > CEats 머니 : 버튼 막기 (완)
                CartPayButtonView(showingAlert: $showingAlert)
            }
            .alert("결제가 됩니다.", isPresented: $showingAlert) {
                Button("뒤로가기") {
                    showingAlert = false
                }
                Button {
                    userViewModel.newOrder { result in
                        isOpenOrderedSheet = true
                    }
                } label: {
                    Text("결제하기")
                }
            } message: {
                Text("주문이 성공적으로 완료되었습니다.")
            }
            .fullScreenCover(isPresented: $isOpenOrderedSheet) {
                RealTimeOrderInfoView(isOpenOrderedSheet: $isOpenOrderedSheet, completion: { dismiss() })
            }
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CartView(isOpenMapSheet: .constant(false), tabIndex: .constant(2))
                .environmentObject(UserViewModel())
                .environmentObject(RestaurantViewModel())
        }
    }
}
