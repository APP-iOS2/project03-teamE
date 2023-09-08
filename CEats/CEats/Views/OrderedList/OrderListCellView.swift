//
//  OrderListCellView.swift
//  CEats
//
//  Created by 유하은 on 2023/09/08.
//

import SwiftUI

struct OrderListCellView: View {
    @EnvironmentObject var userViewModel: UserViewModel

    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                ForEach(userViewModel.filteredOrderList) { order in
                    HStack{
                        VStack(alignment: .leading){
                            Text(order.restaurantName.name)
                                .font(.system(size:22))
                                .bold()
                            Text("2023-09-07 오전 11:29")
                                .font(.system(size:12))
                                .foregroundColor(.secondary)
                                .padding(.bottom,9)
                            HStack{
                                Image(systemName: "staroflife.circle.fill")
                                    .foregroundColor(.yellow)
                                Text(order.orderStatus.toString)
                                    .font(.system(size:15))
                            }
                        }
                        Spacer()
                        Image(order.restaurantName.mainImage[0])
                            .resizable()
                            .scaledToFit()
                            .frame(width: .screenWidth * 0.30)
                    }
                    
                    ForEach(order.orderedMenu, id: \.name) { food in
                        HStack{
                            Image(systemName: "circle.fill")
                                .font(.system(size: 5))
                            Text(food.name)
                                .font(.system(size:16))
                        }
                        Text(food.description)
                            .font(.system(size:14))
                            .padding(.bottom,2)
                    }

                    .foregroundColor(.gray)
                    HStack{
                        Text("합계:")
                        Text("\(order.totalFee)원")
                            .bold()
                    }
                }
            }
            .padding(30)
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
        }
        .padding(10) // 왜 여기 이렇게 위아래로 패딩이 크게 잡힘?
    }
}


struct waitingListView_Previews: PreviewProvider {
    static var previews: some View {
        OrderListCellView()
            .environmentObject(UserViewModel())
    }
}
