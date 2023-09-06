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
                Text("19~29분")
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
                VStack(alignment: .leading) {
                    Text("배달비")
                        .padding(.vertical, 5)
                    Text("최소주문")
                }
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
                .padding(.leading,10)
                Spacer()
            }
            .font(.footnote)
        }
    }
}

struct RTRSubInfoView_Previews: PreviewProvider {
    static var previews: some View {
        RTRSubInfoView(restaurant: .sampleData)
    }
}
