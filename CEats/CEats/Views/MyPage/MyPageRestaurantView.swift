//
//  MyPageRestaurantView.swift
//  CEats
//
//  Created by 박범수 on 2023/09/11.
//

import SwiftUI

struct MyPageRestaurantView: View {
    let restaurant: Restaurant
    @State private var selectedIndex = 0
    
    var body: some View {
        VStack {
            HStack {
                TabView(selection: $selectedIndex) {
                    ForEach(restaurant.mainImage, id: \.self) { image in
                        Image(image)
                            .resizable()
                            .scaledToFill()
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                .frame(maxWidth: .screenWidth * 0.3)
                .cornerRadius(10)
                .padding()
                VStack(alignment: .leading, spacing: 8) {
                    Text(restaurant.name)
                        .bold()
                    HStack(spacing: 0) {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text("\(restaurant.scoreMessage)(\(restaurant.reviews.count))")
                    }
                    Text("\(restaurant.deliveryTime) · \(restaurant.deliveryFee)")
                    HStack {
                        Image(systemName: "tag.fill")
                            .foregroundColor(.blue)
                            .opacity(0.6)
                        // 레스토랑에 쿠폰필요함
                        Text("1,000원 쿠폰")
                        //                        Text("\(restaurant.coupons)")
                    }
                    .bold()
                    .padding(3)
                    .padding(.horizontal, 3)
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .opacity(0.6)
                    )
                }
                .foregroundColor(.primary)
                Spacer()
            }
            Divider()
                .padding(.horizontal, 15)
        }
        .padding(.horizontal)
    }
}

struct MyPageRestaurantView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageRestaurantView(restaurant: .sampleData)
    }
}
