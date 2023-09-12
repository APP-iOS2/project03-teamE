//
//  CartAppealView.swift
//  CEats
//
//  Created by 박범수 on 2023/09/07.
//

import SwiftUI

struct CartAppealView: View {
    @State private var selectedFood = "delivery"
    var delivery = ["문 앞에 두고 사진을 보내주세요", "직접 받을게요", "도착하면 전화 주세요"]
    
    @State private var toorder: String = ""
    @State private var ischeckmark: Bool = true
    
    var body: some View {
        VStack {
            HStack {
                Text("가게 사장님에게")
                    .font(.system(size: 16).bold())
                    .padding([.leading, .top, .trailing])
                Spacer()
            }
            TextField("예) 견과류는 빼주세요", text: $toorder)
                .font(.system(size: 16))
                .background(Color.white)
                .padding([.leading, .trailing])
                .textFieldStyle(.roundedBorder)
            HStack {
                Button {
                    ischeckmark.toggle()
                } label: {
                    if ischeckmark {
                        Image(systemName: ischeckmark ? "checkmark.square" : "checkmark.square.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 30, height: 30)
                            .foregroundColor(.gray)
                            .padding([.leading, .trailing])
                        VStack(alignment: .leading) {
                            Text("일화용 수저/포크받기")
                                .font(.system(size: 15))
                                .foregroundColor(.gray)
                            Text("일회용품 사용을 줄이기 위해, 선택 시에만 제공됩니다.")
                                .font(.system(size: 12))
                                .foregroundColor(.lightgray)
                        }
                    } else {
                        Image(systemName: ischeckmark ? "checkmark.square" : "checkmark.square.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 30, height: 30)
                            .foregroundColor(.black)
                            .padding([.leading, .trailing])
                        VStack(alignment: .leading) {
                            Text("일화용 수저/포크받기")
                                .font(.system(size: 15))
                                .foregroundColor(.black)
                            Text("일회용품 사용을 줄이기 위해, 선택 시에만 제공됩니다.")
                                .font(.system(size: 12))
                                .foregroundColor(.lightgray)
                        }
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
            Picker("선택하기", selection: $selectedFood) {
                ForEach(delivery, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(.automatic)
        }
    }
}

struct CartAppealView_Previews: PreviewProvider {
    static var previews: some View {
        CartAppealView()
    }
}
