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
        VStack() {
            Button {
                ispayMoneyMethod.toggle()
            } label: {
                if !ispayMoneyMethod {
                    Image(systemName: ispayMoneyMethod ? "circle" : "smallcircle.filled.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 0, height: 30)
                        .foregroundColor(.black)
                    Text("CEats 머니 (보유: \(user.cEatsMoney)원)")
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                        .padding()
                }else {
                    Image(systemName: ispayMoneyMethod ? "circle" : "smallcircle.filled.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 0, height: 30)
                        .foregroundColor(.gray)
                    Text("CEats 머니 (보유: \(user.cEatsMoney)원)")
                        .font(.system(size: 20))
                        .foregroundColor(.gray)
                        .padding()
                }
            }
            Spacer()
            HStack(alignment: .center) {
                Spacer()
                Button {
                    // 결제수단을 추가하는 뷰?
                } label: {
                    Text("+ 결제수단 추가")
                }
                Spacer()
            }
        }
        .padding()
    }
}

struct CartPaymentView_Previews: PreviewProvider {
    static var previews: some View {
        CartPaymentView()
    }
}
