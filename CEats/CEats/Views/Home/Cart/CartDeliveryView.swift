//
//  CartDeliveryView.swift
//  CEats
//
//  Created by 박범수 on 2023/09/07.
//

import SwiftUI

struct CartDeliveryView: View {
    
    //MARK: - Properties
    @EnvironmentObject private var userViewModel: UserViewModel
    @Binding var isOpenMapSheet: Bool
    
    @State private var isSelected1: Bool = true
    @State private var isSelected2: Bool = false
    
    @Environment(\.dismiss) private var dismiss
    
    //MARK: - View
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    HStack{
                        Text("\(userViewModel.user.userAddress)") // edit
                        Text("(으)로 배달")
                    }
                    Text("\(userViewModel.user.userAddress)") // edit
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
                ForEach(UserViewModel.DeliveryKind.allCases, id: \.self) { kind in
                    Button {
                        userViewModel.deliveryOpt = kind
                    } label: {
                        VStack(alignment: .leading) {
                            HStack {
                                Image(systemName: userViewModel.deliveryOpt == kind ? "o.circle.fill" : "o.circle")
                                    .foregroundColor(userViewModel.deliveryOpt == kind ? .accentColor : .black)
                                VStack(alignment: .leading) {
                                    Text(kind.toString)
                                        .font(.system(size: 18, weight: userViewModel.deliveryOpt == kind ? .bold : .regular))
                                    Text("\(kind.deliveryTime)분")
                                        .font(.footnote)
                                }
                                Spacer()
                                switch kind {
                                case .onlyOne:
                                    Text("배달비 \(kind.fee)원")
                                case .save:
                                    VStack(alignment: .trailing) {
                                        ZStack{
                                            Rectangle()
                                                .frame(width: 60, height: 2)
                                                .padding(.init(top: 4, leading: 50, bottom: 0, trailing: 0))
                                            Text("배달비 \(kind.fee)원")
                                        }
                                        Text("\(kind.fee)원")
                                            .bold()
                                            .foregroundColor(.red)
                                            .padding(.init(top: -10, leading: 0, bottom: 0, trailing: 3))
                                    }
                                }
                            }
                        }
                        .foregroundColor(.black)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 7)
                                .stroke(userViewModel.deliveryOpt == kind ?  Color.accentColor : Color.black, lineWidth: 1.6)
                                .shadow(color: .gray, radius: 1.3)
                        )
                    }
                }
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
    func disableAllBtn(deliveryButtonArray: [DeliveryTypeButton]) {
        isSelected1 = false
        isSelected2 = false
    }
}

struct DeliveryTypeButton: View, Identifiable {
    // MARK: - Properties
    @Binding var isSelected: Bool
    var titleLabel: String
    var deliveryTimeString: String
    var deliveryFee: Int = 0
    var discountedFee: Int = 0
    var id: UUID = UUID()
    
    // MARK: - View
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: isSelected ? "o.circle.fill" : "o.circle")
                    .foregroundColor(isSelected ? .accentColor : .black)
                VStack(alignment: .leading) {
                    Text("\(titleLabel)")
                        .font(.system(size: 18, weight: isSelected ? .bold : .regular))
                    Text("\(deliveryTimeString)분")
                        .font(.footnote)
                }
                Spacer()
                // 여기 확인하기
                if discountedFee > 0 {
                    let discountDelivery: Int = deliveryFee - discountedFee
                    
                    VStack(alignment: .trailing) {
                        ZStack{
                            Rectangle()
                                .frame(width: 60, height: 2)
                                .padding(.init(top: 4, leading: 50, bottom: 0, trailing: 0))
                            Text("배달비 \(deliveryFee)원")
                        }
                        Text("\(discountDelivery)원")
                            .bold()
                            .foregroundColor(.red)
                            .padding(.init(top: -10, leading: 0, bottom: 0, trailing: 3))
                    }
                } else {
                    Text("배달비 \(deliveryFee)원")
                }
            }
        }
        .foregroundColor(.black)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 7)
                .stroke(isSelected ?  Color.accentColor : Color.black, lineWidth: 1.6)
                .shadow(color: .gray, radius: 1.3)
        )
    }
}

struct CartDeliveryView_Previews: PreviewProvider {
    static var previews: some View {
        CartDeliveryView(isOpenMapSheet: .constant(false))
            .environmentObject(UserViewModel())
    }
}
