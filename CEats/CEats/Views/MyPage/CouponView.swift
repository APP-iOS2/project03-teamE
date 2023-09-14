//
//  CouponView.swift
//  CEats
//
//  Created by 박범수 on 2023/09/10.
//

import SwiftUI

struct CouponView: View {
    let coupons: [Coupon]
    
    @Environment(\.dismiss) private var dismiss
    @State private var couponTFString: String = ""
    var body: some View {
        ScrollView {
            HStack {
                Image(systemName: "tag")
                    .padding()
                TextField("", text: $couponTFString, prompt: Text("쿠폰 번호를 입력하세요 (8, 16자리)"))
                    .bold()
            }
            .background(
                RoundedRectangle(cornerRadius: 3)
                    .stroke(.quaternary, lineWidth: 1)
            )
            .padding()
            ForEach(coupons) { coupon in
                CouponCardView(coupon: coupon)
            }
            .padding()
        }
        .navigationTitle("할인쿠폰")
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                CEatsNavigationBackButton {
                    dismiss()
                }
            }
        }
    }
}

struct CouponView_Previews: PreviewProvider {
    static var previews: some View {
        MyView()
            .environmentObject(UserViewModel())
            .environmentObject(TabViewModel())
    }
}
