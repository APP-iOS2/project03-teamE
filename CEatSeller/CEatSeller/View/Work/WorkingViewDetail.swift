//
//  WorkingViewDetail.swift
//  CEatSeller
//
//  Created by 박범수 on 2023/09/06.
//

import SwiftUI

struct WorkingViewDetail: View {
    let order: Order
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    HStack{
                        Text("주문번호")
                        Text(order.id.prefix(6))
                    }
                        .font(.title3)
                        .bold()
                        .padding(.bottom, 1)
                    Text("\(order.orderer)")
                }
                Spacer()
                
                Text("\(order.orderDate)")
                    .foregroundColor(.gray)
                    .font(.footnote)
            }
            .padding(.top, 10)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("[메뉴 \(order.orderedMenu.count)개] \(order.totalFee)")
                        .bold()
                        .font(.headline)
                        .padding(.bottom, 0.5)
                    
                    ForEach(order.orderedMenu, id: \.name) { menu in
                        Text("\(menu.name)")
                            .lineLimit(1)
                    }
                    
                }
                .padding(.horizontal, 5)
                .padding(.bottom, 10)
                
                Spacer()
            }
            .padding(.top, 10)
            .background(Color.gray)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("남은 준비시간")
                        .font(.footnote)
                        .foregroundColor(.gray)
                    
                    HStack(alignment: .bottom) {
                        Text("0")
                            .font(.largeTitle)
                            .bold()
                        Text("분")
                            .font(.footnote)
                            .foregroundColor(.gray)
                            .padding(.bottom, 5)
                    }
                }
                .frame(width: .screenWidth * 0.2)
                
                VStack(alignment: .leading) {
                    Text("김쿠팡(배달원)")
                        .font(.footnote)
                        .foregroundColor(.gray)
                    HStack(alignment: .bottom) {
                        Text("20")
                            .font(.largeTitle)
                            .bold()
                        Text("분")
                            .font(.footnote)
                            .foregroundColor(.gray)
                            .padding(.bottom, 5)
                    }
                }
                .frame(width: .screenWidth * 0.3)
                
                Spacer()
                
                Button {
                    print("준비 완료")
                } label: {
                    Text("배달 시작")
                        .font(.footnote)
                        .foregroundColor(.green)
                        .bold()
                        .frame(width: 80, height: 40)
                        .border(Color.green, width: 1)
                }
            }
            .padding(.top, 10)
        }
    }
}

struct WorkingViewDetail_Previews: PreviewProvider {
    static var previews: some View {
        WorkingViewDetail(order: Order.sampleData)
    }
}
