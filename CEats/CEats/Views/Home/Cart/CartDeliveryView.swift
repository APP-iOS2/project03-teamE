//
//  CartDeliveryView.swift
//  CEats
//
//  Created by 박범수 on 2023/09/07.
//

import SwiftUI

struct CartDeliveryView: View {
    //MARK: - Properties
    @EnvironmentObject var userViewModel: UserViewModel
    @Binding var order: Order
    @Binding var isOpenMapSheet: Bool
    
    @State var isSelected1: Bool = true
    @State var isSelected2: Bool = false
    
    @Environment(\.dismiss) private var dismiss
    
    //MARK: - View
    var body: some View {
        NavigationStack {
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
                
                // 일단 되게 !!!!! + 간단한걸 만들기 + 많이 만들기 !!!!!! 1일1기능 만들기 !! 많이 물어보기 !!!!!!!!!
                let deliveryTypeButton1 = DeliveryTypeButton(isSelected: $isSelected1, titleLabel: "한집배달", deliveryTimeString: "29 ~ 39", deliveryFee: 3000)
                let deliveryTypeButton2 = DeliveryTypeButton(isSelected: $isSelected2, titleLabel: "세이브배달", deliveryTimeString: "34 ~ 43", deliveryFee: 3000, discountedFee: 1000)
                
                let deliveryButtonArray: [DeliveryTypeButton] = [deliveryTypeButton1, deliveryTypeButton2]
                
                // ⭐️ Refactoring 해서 검사맡기 !!!!! 숙제임!!
                deliveryTypeButton1
                    .onTapGesture {
                        disableAllBtn(deliveryButtonArray: deliveryButtonArray)
                        isSelected1 = true
                    }
                deliveryTypeButton2
                    .onTapGesture {
                        disableAllBtn(deliveryButtonArray: deliveryButtonArray)
                        isSelected2 = true
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
    var deliveryFee: UInt = 0
    var discountedFee: UInt = 0
    var id: UUID = UUID()
    
    // MARK: - View
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Image(systemName: isSelected ? "o.circle.fill" : "o.circle")
                    .foregroundColor(isSelected ? .accentColor : .black)
                VStack(alignment: .leading) {
                    Text("\(titleLabel)")
                        .font(.system(size: 18, weight: isSelected ? .bold : .regular))
                    Text("\(deliveryTimeString)분")
                        .font(.footnote)
                }
                Spacer()
                
                if discountedFee > 0 {
                    VStack(alignment: .trailing) {
                        ZStack{
                            Rectangle()
                                .frame(width: 60, height: 2)
                                .padding(.init(top: 4, leading: 50, bottom: 0, trailing: 0))
                            Text("배달비 \(deliveryFee)원")
                        }
                        Text("\(discountedFee)원")
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
        CartDeliveryView(order: .constant(.sampleData), isOpenMapSheet: .constant(false))
            .environmentObject(UserViewModel())
    }
}
