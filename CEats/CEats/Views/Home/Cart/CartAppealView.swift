//
//  CartAppealView.swift
//  CEats
//
//  Created by 박범수 on 2023/09/07.
//

import SwiftUI

struct CartAppealView: View {
    @EnvironmentObject private var userViewModel: UserViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text("가게 사장님에게")
                    .font(.system(size: 16).bold())
                    .padding([.leading, .top, .trailing])
                Spacer()
            }
            TextField("예) 견과류는 빼주세요", text: $userViewModel.rtrReq)
                .font(.system(size: 16))
                .background(Color.white)
                .padding([.leading, .trailing])
                .textFieldStyle(.roundedBorder)
            HStack {
                Button {
                    userViewModel.isCheckmark.toggle()
                } label: {
                    Image(systemName: userViewModel.isCheckmark ? "checkmark.square.fill" : "checkmark.square")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 30, height: 30)
                        .foregroundColor(userViewModel.isCheckmark ? .primary : .gray)
                        .padding([.leading, .trailing])
                    VStack(alignment: .leading) {
                        Text("일화용 수저/포크받기")
                            .font(.system(size: 15))
                            .foregroundColor(userViewModel.isCheckmark ? .primary : .gray)
                        Text("일회용품 사용을 줄이기 위해, 선택 시에만 제공됩니다.")
                            .font(.system(size: 12))
                            .foregroundColor(.lightgray)
                    }
                }
                Spacer()
            }
            HStack {
                Text("배달 기사님에게")
                    .font(.system(size: 16).bold())
                    .padding([.leading, .top, .trailing])
                Spacer()
            }
            Picker("선택하기", selection: $userViewModel.deliReq) {
                ForEach(UserViewModel.DeliveryRequest.allCases) { req in
                    Text(req.toString)
                }
            }
            .pickerStyle(.automatic)
        }
    }
}

struct CartAppealView_Previews: PreviewProvider {
    static var previews: some View {
        CartAppealView()
            .environmentObject(UserViewModel())
    }
}
