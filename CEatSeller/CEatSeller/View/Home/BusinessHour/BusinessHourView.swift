//
//  BusinessHourView.swift
//  CEatSeller
//
//  Created by 박범수 on 2023/09/12.
//

import Foundation
import SwiftUI

struct BusinessHourView: View {
    @EnvironmentObject var sellerViewModel: SellerViewModel
    @State private var isEditing = false
    
    var body: some View {
        NavigationStack{
            
            VStack(alignment: .leading){
                HStack{
                    Spacer()
                    Button(isEditing ? "저장" : "수정") {
                        isEditing.toggle()
                        if !isEditing {
                            sellerViewModel.updateTimeTable(data: sellerViewModel.seller, to:sellerViewModel.seller.restaurant.restaurantInfo.timeTable)
                        }
                    }
                }
                Divider()
                HStack{
                    Spacer()
                    VStack{
                        Text("상호명 ")
                        Text("\(sellerViewModel.seller.restaurant.name)")
                            .font(.system(size: 25))
                            .bold()
                    }
                    Spacer()
                }
                Divider()
                    .padding(.bottom,10)
                
                Text("영업 시간")
                    .bold()
                    .padding(.bottom,3)
                if isEditing {
                    TextEditor(text: $sellerViewModel.seller.restaurant.restaurantInfo.timeTable)
                        .frame(height: .screenHeight * 0.04)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                        .padding()
                        .border(Color.black, width: 1)
                        .padding()
                } else {
                    Text(sellerViewModel.seller.restaurant.restaurantInfo.timeTable)
                }
                Spacer()
            }
            .padding(20)
        }
    }
}


struct BusinessHourView_Previews: PreviewProvider {
    static var previews: some View {
        BusinessHourView()
            .environmentObject(SellerViewModel()) 
    }
}
