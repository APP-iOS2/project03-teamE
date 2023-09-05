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
            HStack {
                Button("배달") {
                    
                }
                Button("포장") {
                    
                }
            }
            HStack {
                Text("도착까지 약 19~29분")
                Spacer()
                NavigationLink {
                    //가게 정보
                } label: {
                    Text("매장•원산지정보")
                    Image(systemName: "chevron.forward")
                }
                .foregroundColor(.primary)
            }
            VStack(alignment: .leading) {
                HStack {
                    Text("배달비")
                    Text("0~1,900원")
                    Button("자세히") {
                        
                    }
                }
                HStack {
                    Text("최소주문")
                    Text("5,000원")
                }
            }
        }
    }
}

struct RestaurantSubInfoView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantSubInfoView()
    }
}
