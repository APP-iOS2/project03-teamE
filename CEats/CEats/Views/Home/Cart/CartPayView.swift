//
//  CartPayView.swift
//  CEats
//
//  Created by 박범수 on 2023/09/07.
//

import SwiftUI

struct CartPayView: View {
     var food: Food = Food.sampleData
    var restaurant: Restaurant = Restaurant.sampleData
    
    @State var isappeal: Bool = false
    @State var ispayment: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text("주문금액")
                        .padding(.leading)
                    Spacer()
                    Text("\(food.price)원")
                        .padding(.trailing)
                }
                HStack {
                    Text("배달비")
                        .padding([.top, .leading, .bottom])
                    Spacer()
                    Text("\(restaurant.deliveryFee)원")
                        .padding(.trailing)
                }
                Divider()
                HStack {
                    Text("총 결제금액")
                    Spacer()
                    Text("\(food.price + restaurant.deliveryFee)원")
                }
                .font(.title3)
                .bold()
                .padding()
                Divider()
                
                HStack {
                    Text("요청사항")
                        .font(.title3)
                        .bold()
                        .padding()
                    Spacer()
                    Button {
                        // 눌리면 꺾새 내려가게 해야함.
                        // CartappealView 가 보임.
                        
                        isappeal.toggle()
                    } label: {
                        Image(systemName: isappeal ? "chevron.down" : "control")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .foregroundColor(.black)
                            .frame(width: 20, height: 10)
                            .padding(.trailing)
                    }
                }
                Divider()
                if isappeal {
                    // CartappealView 가 보임.
                    VStack {
                        CartappealView()
                    }
                }
                HStack {
                    Text("결제수단")
                        .font(.title3)
                        .bold()
                        .padding()
                    Spacer()
                    Button {
                        //눌리면 꺾새 내려가게 해야함.
                        // CartpaymentVIew 가 보임
//                        if ispayment {
//                            // CartappealView 가 보임.
//                                CartpaymentView()
//
//                        }
                        ispayment.toggle()
                    } label: {
                        Image(systemName: ispayment ? "control" : "chevron.down")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .foregroundColor(.black)
                            .frame(width: 20, height: 10)
                            .padding(.trailing)
                    }
                }
                Divider()
//                if ispayment {
//                    // CartappealView 가 보임.
//                    VStack {
//                        CartpaymentView()
//                    }
//                }
            }
            .padding()
        }
    }
}
struct CartappealView: View {
    
    @State private var selectedFood = "delivery"
    var delivery = ["문 앞에 두고 사진을 보내주세요", "직접 받을게요", "도착하면 전화 주세요"]
    
    @State private var toorder: String = ""
    @State var ischeckmark: Bool = false
    
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
                    Image(systemName: ischeckmark ? "checkmark.square" : "checkmark.square.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 30, height: 30)
                        .foregroundColor(.black)
                        .padding([.leading, .trailing])
                }
                VStack(alignment: .leading) {
                    Text("일화용 수저/포크받기")
                        .font(.system(size: 15))
                    Text("일회용품 사용을 줄이기 위해, 선택 시에만 제공됩니다.")
                        .font(.system(size: 12))
                        .foregroundColor(.lightgray)
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
struct CartpaymentView: View {
    var body: some View {
        VStack {
            Text("결제수단 뷰")
        }
    }
}


struct CartpaymentView_Previews: PreviewProvider {
    static var previews: some View {
        CartpaymentView()
    }
}
struct CartappealView_Previews: PreviewProvider {
    static var previews: some View {
        CartappealView()
    }
}
struct CartPayView_Previews: PreviewProvider {
    static var previews: some View {
        CartPayView()
    }
}
