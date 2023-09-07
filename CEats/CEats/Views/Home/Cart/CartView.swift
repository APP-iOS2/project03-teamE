//
//  CartView.swift
//  CEats
//
//  Created by 박범수 on 2023/09/07.
//

import SwiftUI

struct CartView: View {
    @Binding var order: Order
    
    var body: some View {
        ScrollView {
            HStack {
                VStack(alignment: .leading) {
                    Text("(으)로 배달")
                    Text("\(order.orderer.userAddress)")
                }
                Spacer()
                NavigationLink {
                    
                } label: {
                    Text("수정")
                }
            }
            VStack(alignment: .leading) {
                HStack {
                    Text("배달 방법")
                        .font(.system(size: 28, weight: .bold))
                    Spacer()
                }
                .padding()
            }
        }
        .padding()
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CartView(order: .constant(.sampleData))
        }
    }
}
