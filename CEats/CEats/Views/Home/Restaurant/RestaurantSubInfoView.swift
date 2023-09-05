//
//  RestaurantSubInfoView.swift
//  CEats
//
//  Created by gnksbm on 2023/09/04.
//

import SwiftUI

struct RestaurantSubInfoView: View {
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
                Button("배달") {
                    
                }
                Button("포장") {
                }
            }
            HStack {
                Text("도착까지 약 19~29분")
                    .font(.system(size: 18, weight: .bold))
                Spacer()
                NavigationLink {
                    //가게 정보
                } label: {
                    Text("매장•원산지정보")
                    Image(systemName: "chevron.forward")
                }
                .foregroundColor(.primary)
            }
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
        }
    }
}

struct RestaurantSubInfoView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantSubInfoView()
    }
}
