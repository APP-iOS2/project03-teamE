//
//  CartPaymentView.swift
//  CEats
//
//  Created by 박범수 on 2023/09/07.
//

import SwiftUI

struct CartPaymentView: View {
    @EnvironmentObject private var userViewModel: UserViewModel
    @State private var ispayMoneyMethod: Bool = false
    
    var body: some View {
        VStack {
            Button {
                ispayMoneyMethod.toggle()
            } label: {
                if !ispayMoneyMethod {
                    Image(systemName: ispayMoneyMethod ? "circle" : "smallcircle.filled.circle")
                        .resizable()
                        .cEatsImg()
//                        .modifier(CEatsImg())
//                        .aspectRatio(contentMode: .fill)
//                        .frame(width: 0, height: 30)
//                        .foregroundColor(.black)
                    Text("CEats 머니 (보유: \(userViewModel.user.cEatsMoney)원)")
//                        .font(.system(size: 20))
//                        .foregroundColor(.black)
//                        .padding()
//                        .modifier(CEatsTextColor(color: .black))
                        .cEatsTextColor(color: .black)
                } else {
                    Image(systemName: ispayMoneyMethod ? "circle" : "smallcircle.filled.circle")
                        .resizable()
                        .cEatsImg()
//                        .modifier(CEatsImg())
//                        .aspectRatio(contentMode: .fill)
//                        .frame(width: 0, height: 30)
//                        .foregroundColor(.gray)
                    Text("CEats 머니 (보유: \(userViewModel.user.cEatsMoney)원)")
                    // 방법 1
//                        .font(.system(size: 20))
//                        .foregroundColor(.gray)
//                        .padding()
                    // 방법 2
//                        .modifier(CEatsTextColor(color: .gray))
                    // 방법 3
                        .cEatsTextColor(color: .gray)
                }
            }
            Spacer()
        }
        .padding()
    }
}

struct CartPaymentView_Previews: PreviewProvider {
    static var previews: some View {
        CartPaymentView()
            .environmentObject(UserViewModel())
    }
}
