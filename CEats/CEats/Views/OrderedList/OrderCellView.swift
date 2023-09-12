//
//  OrderCellView.swift
//  CEats
//
//  Created by 유하은 on 2023/09/12.
//

import SwiftUI

struct OrderCellView: View {
    @State var isShowingSheet: Bool = false
    @EnvironmentObject var userViewModel: UserViewModel

    let order: Order
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                VStack(alignment: .leading){
                    Text(order.restaurant.name)
                        .font(.system(size:20))
                        .bold()
                    Text("2023-09-07 오전 11:29")
                        .font(.system(size:12))
                        .foregroundColor(.secondary)
                        .padding(.bottom,9)
                    HStack{
                        Image(systemName: "staroflife.circle.fill")
                            .foregroundColor(.yellow)
                        Text(order.orderStatus.toString)
                            .font(.system(size:13))
                    }
                }
                Spacer()
                Image(order.restaurant.mainImage[0])
                    .resizable()
                    .scaledToFit()
                    .frame(width: .screenWidth * 0.30)
            }
            
            ForEach(order.orderedMenu, id: \.name) { food in
                HStack{
                    Image(systemName: "circle.fill")
                        .font(.system(size: 5))
                    Text(food.name)
                        .font(.system(size:13))
                }
//                Text(food.description)
//                    .font(.system(size:14))
//                    .padding(.bottom,2)
            }
            
            .foregroundColor(.gray)
            HStack{
                Text("합계:")
                Text("\(order.totalFee)원")
                    .bold()
            }
            .padding(.top,10)
            .padding(.bottom,10)
            Spacer()
            HStack{
                Spacer()
                Button {
                    isShowingSheet = true
                } label: {
                    HStack{
                        Spacer()
                        Image(systemName: "list.clipboard")
                        Text("영수증 보기")
                            
                        //                        .foregroundColor(.white)
                        //                        .background(RoundedRectangle(cornerRadius: 10)
                        //                            .foregroundColor(.gray)
                        //                            .frame(width: .screenWidth * 0.82))
                        //                        .padding([.leading,.trailing],20)
                    }
                }
                .font(.system(size: 11))
                .padding(.bottom,10)
                Spacer()
            }
        }
        .padding([.top,.leading,.trailing],20)
        .background(
            Group {
                if !userViewModel.filteredOrderList.isEmpty {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.lightgray)
                } else {
                    Color.clear
                }
            }
        )
        .sheet(isPresented: $isShowingSheet, content: {
            NavigationStack{
                ReciptView()
                    .padding(20)
            }
        })
    }
}


struct OrderCellView_Previews: PreviewProvider {
    static var previews: some View {
        OrderCellView(order: Order.sampleData)
            .environmentObject(UserViewModel())
    }
}
