//
//  RTRSubInfoView.swift
//  CEats
//
//  Created by gnksbm on 2023/09/04.
//

import SwiftUI

struct RTRSubInfoView: View {
    let restaurant: Restaurant
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "clock")
                Text("도착까지 약 19~39분")
                    .font(.system(size: 15, weight: .bold))
                Spacer()
                NavigationLink {
                    RTRDetailInfoView(restaurant: restaurant)
                } label: {
                    Text("매장•원산지정보")
                    Image(systemName: "chevron.forward")
                }
                .font(.footnote)
                .foregroundColor(.primary)
            }
            .padding(.bottom,20)
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    Text("배달비")
                    Text("최소주문")
                }
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text("\(restaurant.deliveryFee)")
//                        Button("자세히") {
//
//                        }
//                        .foregroundColor(.primary)
//                        .padding(.horizontal, 10)
//                        .background(.quaternary)
//                        .cornerRadius(.greatestFiniteMagnitude)
                    }
                    Text("\(restaurant.minimumPrice)")
                }
                .padding(.leading, 10)
                Spacer()
            }
            .font(.headline)
        }
    }
}

struct RTRSubInfoView_Previews: PreviewProvider {
    static var previews: some View {
        RTRSubInfoView(restaurant: .sampleData)
    }
}
