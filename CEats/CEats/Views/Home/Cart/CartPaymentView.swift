//
//  CartPaymentView.swift
//  CEats
//
//  Created by 박범수 on 2023/09/07.
//

import SwiftUI

struct CartPaymentView: View {
    var user: User = User.sampleData
    @State var ispayMoneyMethod: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Button {
                
            } label: {
                Image(systemName: ispayMoneyMethod ? "circle" : "circle.fill")
                Text("CEats 머니 (보유: \(user.cEatsMoney)원)")
                    .font(.system(size: 15))
            }
        }
        Spacer()
    }
}

struct CartPaymentView_Previews: PreviewProvider {
    static var previews: some View {
        CartPaymentView()
    }
}
