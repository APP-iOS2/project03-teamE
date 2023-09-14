//
//  CouponCardView.swift
//  CEats
//
//  Created by 박범수 on 2023/09/10.
//

import SwiftUI

struct CEatsNavigationBackButton: View {
    let action: () -> ()
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: "arrow.left")
        }
        .foregroundColor(.primary)
        .bold()
        
    }
}

struct CouponCardView: View {
    let coupon: Coupon
    
    var dateStr: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY/MM/dd"
        return formatter.string(from: coupon.endDate)
    }
    
    var body: some View {
        HStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 10) {
                Text("\(coupon.discount)원 할인")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundColor(.cEatsBlue)
                Text("배달")
                    .padding(.vertical, 3)
                    .padding(.horizontal, 10)
                    .background(.quaternary)
                    .cornerRadius(5)
                    .padding(.bottom)
                Text("\(coupon.restaurant.name) 금액 할인 쿠폰")
                    .bold()
                Text("\(coupon.priceCondition) 이상 주문시")
                Text("\(dateStr)까지 사용가능")
            }
            .padding(.vertical, 20)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.background)
            .cornerRadius(10)
            NavigationLink {
                RTRView(restaurant: coupon.restaurant)
            } label: {
                VStack {
                    Image(systemName: "arrow.right")
                    Text("적용가능\n매장보기")
                        .bold()
                }
            }
            .foregroundColor(.primary)
            .padding()
            .frame(maxHeight: .infinity)
            .background(.background)
            .cornerRadius(10)
        }
        .clipped()
        .shadow(color: .lightgray, radius: 3)
    }
}

struct CouponCardView_Previews: PreviewProvider {
    static var previews: some View {
        CouponCardView(coupon: .sampleData)
    }
}
