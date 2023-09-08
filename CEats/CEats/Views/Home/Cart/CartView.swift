//
//  CartView.swift
//  CEats
//
//  Created by 박범수 on 2023/09/07.
//

import SwiftUI

struct CartView: View {
    @Binding var isOpenMapSheet: Bool
    
    var body: some View {
        NavigationStack{
            ScrollView {
                CartDeliveryView(isOpenMapSheet: $isOpenMapSheet)
                //            CartMenuView()
                Text("여기는 메뉴 보여질 뷰 들어갈 자리")
                CartPayView()
            }
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CartView(isOpenMapSheet: .constant(false))
        }
    }
}
