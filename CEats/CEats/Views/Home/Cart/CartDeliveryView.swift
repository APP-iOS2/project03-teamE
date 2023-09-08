//
//  CartDeliveryView.swift
//  CEats
//
//  Created by 박범수 on 2023/09/07.
//

import SwiftUI

struct CartDeliveryView: View {
    var order: Order = .sampleData
    @Binding var isOpenMapSheet: Bool
    // 불값이 아닌 ?-? 
    
    @State var onlyMyHome: Bool = false
    @State var severalHome: Bool = true
    @Environment(\.dismiss) private var dismiss
    
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
            .padding(.init(top: 0, leading: 20, bottom: 10, trailing: 10))
            
            VStack(alignment: .leading) {
                HStack {
                    Text("배달 방법")
                        .font(.system(size: 23, weight: .bold))
                    Spacer()
                }
                
                Button {
                    onlyMyHome.toggle()
                    if onlyMyHome {
                        severalHome = !onlyMyHome
                    } else {
                        severalHome = !onlyMyHome
                    }
                } label: {
                    VStack(alignment: .leading) {
                        HStack{
                            Image(systemName: onlyMyHome ? "o.circle" : "o.circle.fill")
                                .foregroundColor(onlyMyHome ? .black : .accentColor)
                            VStack(alignment: .leading) {
                                Text("한집배달")
                                    .font(.system(size: 18, weight: onlyMyHome ? .regular : .bold))
                                Text("29 ~ 39 분")
                                    .font(.footnote)
                            }
                            Spacer()
                            Text("배달비 \(order.restaurantName.deliveryFee)원")
                        }
                    }
                    .foregroundColor(.black)
                    .padding()
                }
                .background(
                    RoundedRectangle(cornerRadius: 7)
                        .stroke(onlyMyHome ?  Color.black : Color.accentColor, lineWidth: 1.6)
                        .shadow(color: .gray, radius: 1.3)
                )
                
                Button {
                    severalHome.toggle()
                    if severalHome {
                        onlyMyHome = !severalHome
                    } else {
                        onlyMyHome = !severalHome
                    }
                } label: {
                    VStack(alignment: .leading) {
                        HStack{
                            Image(systemName: severalHome ? "o.circle" : "o.circle.fill")
                                .foregroundColor(severalHome ? .black : .accentColor)
                            VStack(alignment: .leading) {
                                Text("세이브배달")
                                    .font(.system(size: 18, weight: severalHome ? .regular : .bold))
                                Text("34 ~ 49 분")
                                    .font(.footnote)
                            }
                            Spacer()
                            VStack(alignment: .trailing) {
                                ZStack{
                                    Rectangle()
                                        .frame(width: 60, height: 2)
                                        .padding(.init(top: 4, leading: 50, bottom: 0, trailing: 0))
                                    Text("배달비 \(order.restaurantName.deliveryFee)원")
                                }
                                Text("\(order.restaurantName.deliveryFee - 1000)원")
                                    .bold()
                                    .foregroundColor(.red)
                                    .padding(.init(top: -10, leading: 0, bottom: 0, trailing: 3))
                            }
                        }
                    }
                    .foregroundColor(.black)
                    .padding()
                }
                .background(
                    RoundedRectangle(cornerRadius: 7)
                        .stroke(severalHome ? Color.black : Color.accentColor, lineWidth: 1.6)
                        .shadow(color: .gray, radius: 1.3)
                )
                
                Spacer()
            }
            
            .padding()
            .fullScreenCover(isPresented: $isOpenMapSheet, content: {
                MapHomeView(isOpenMapSheet: $isOpenMapSheet)
            })
            .navigationTitle("카트")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: backButton)
        }
        .padding(.init(top: 10, leading: 0, bottom: 0, trailing: 0))
    }
    
    var backButton: some View {
        
        Button {
            dismiss()
        } label: {
            Image(systemName: "xmark")
                .aspectRatio(contentMode: .fit)
                .foregroundColor(Color.black)
        }
    }
}



struct CartDeliveryView_Previews: PreviewProvider {
    static var previews: some View {
        CartDeliveryView(isOpenMapSheet: .constant(false))
    }
}
