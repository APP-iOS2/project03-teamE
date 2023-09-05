//
//  RestaurantSubInfoView.swift
//  CEats
//
//  Created by gnksbm on 2023/09/04.
//

import SwiftUI

struct RestaurantSubInfoView: View {
    @Binding var restaurant: Restaurant
    
    var body: some View {
        VStack {
//            HStack {
//                Button("배달") {
//                    
//                }
//                Button("포장") {
//                    
//                }
//            }
           
            HStack {
                Image(systemName: "clock")
                Text("19~29분")
                    .font(.system(size: 15, weight: .bold))
                Spacer()
                NavigationLink {
                    RestaurantDetailInfoView(restaurant: $restaurant)
                } label: {
                    Text("매장•원산지정보")
                    Image(systemName: "chevron.forward")
                }
                .font(.footnote)
                .foregroundColor(.primary)
            }
            .padding(.bottom,20)
            HStack {
                VStack(alignment: .leading) {
                    Text("배달비")
                        .padding(.vertical, 5)
                    Text("최소주문")
                }
                Spacer()
                VStack(alignment: .leading) {
                    HStack {
                        Text("0~1,900원")
                            .font(.footnote)
                        Button("자세히") {
                            
                        }
                        .foregroundColor(.primary)
                        .padding(.vertical, 5)
                        .padding(.horizontal, 10)
                        .background(.quaternary)
                        .cornerRadius(.greatestFiniteMagnitude)
                    }
                    Text("5,000원")
                }
                Spacer()
            }
            .font(.footnote)
        }
    }
}

struct RestaurantSubInfoView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantSubInfoView(restaurant: .constant(.sampleData))
    }
}
