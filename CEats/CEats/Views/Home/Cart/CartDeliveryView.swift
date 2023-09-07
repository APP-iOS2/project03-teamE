//
//  CartDeliveryView.swift
//  CEats
//
//  Created by 박범수 on 2023/09/07.
//

import SwiftUI

struct CartDeliveryView: View {
    @Binding var order: Order
    @Binding var isOpenMapSheet: Bool
    @State var onlyMyHome: Bool = false
    
    var body: some View {
        NavigationStack {
            HStack {
                VStack(alignment: .leading) {
                    HStack{
                        Text("\(order.orderer.userAddress)")
                        Text("(으)로 배달")
                    }
                    Text("\(order.orderer.userAddress)")
                        .font(.system(size: 21, weight: .bold))
                }
                Spacer()
                Button {
                    isOpenMapSheet = true
                } label: {
                    Text("수정")
                }
            }
            .padding(.init(top: 0, leading: 10, bottom: 10, trailing: 10))
            
            VStack(alignment: .leading) {
                HStack {
                    Text("배달 방법")
                        .font(.system(size: 23, weight: .bold))
                    Spacer()
                }
                .padding(.leading, 5)
                
                Button {
                    
                } label: {
                    VStack(alignment: .leading) {
                        HStack{
                            Image(systemName: "heart")
                            VStack(alignment: .leading) {
                                Text("한집배달")
                                Text("29 ~ 39 분")
                            }
                            Spacer()
                            Text("배달비 2000원")
                        }
                    }
                    .foregroundColor(.black)
                    .padding()
                }
                .background(
                    RoundedRectangle(cornerRadius: 7)
                        .stroke(Color.accentColor, lineWidth: 3)
                )
                
                    
                    Button {
                        
                    } label: {
                        VStack(alignment: .leading) {
                            HStack{
                                Image(systemName: "heart")
                                VStack(alignment: .leading) {
                                    Text("세이브배달")
                                    Text("34 ~ 49 분")
                                }
                                Spacer()
                                VStack(alignment: .trailing) {
                                    ZStack{
                                        Rectangle()
                                            .frame(width: 60, height: 2)
                                            .padding(.init(top: 4, leading: 50, bottom: 0, trailing: 0))
                                        Text("배달비 2000원")
                                    }
                                    Text("1000원")
                                        .foregroundColor(.red)
                                }
                            }
                        }
                        .foregroundColor(.black)
                        .padding()
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 7)
                            .stroke(Color.accentColor, lineWidth: 3)
                    )
                
                Spacer()
            }
            
            .padding()
            .fullScreenCover(isPresented: $isOpenMapSheet, content: {
                MapHomeView(isOpenMapSheet: $isOpenMapSheet)
            })
            .navigationTitle("카트")
            .navigationBarTitleDisplayMode(.inline)
        }
        .padding(.init(top: 10, leading: 0, bottom: 0, trailing: 0))
    }
}

struct CartDeliveryView_Previews: PreviewProvider {
    static var previews: some View {
        CartDeliveryView(order: .constant(.sampleData), isOpenMapSheet: .constant(false))
    }
}
