//
//  OrderListCellView.swift
//  CEats
//
//  Created by 유하은 on 2023/09/08.
//

import SwiftUI

struct OrderListCellView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @State var filteredOrderList: [Order]
    //lazy var firstFood = userViewModel.user.orderHistory[0].orderedMenu[0].name
    //유저 초기화가 되기 전에 쓸 수 없음
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 0){
                ForEach(filteredOrderList) { order in
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
                            .frame(width: .screenWidth * 0.30, height: .screenHeight * 0.3)
                    }
                    //.border(.red)
                    
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
                    .offset(y:-60)
                    .foregroundColor(.gray)
                    HStack{
                        Text("합계:")
                        Text("\(order.totalFee)원")
                            .bold()
                    }
                    .offset(y:-30)
                }
            }
            .padding(30)
            .background(RoundedRectangle(cornerRadius: 10)
                .stroke(Color.lightgray))
        }
        .padding(10) // 왜 여기 이렇게 위아래로 패딩이 크게 잡힘?
    }
}


struct waitingListView_Previews: PreviewProvider {
    static var previews: some View {
        OrderListCellView(filteredOrderList: [Order.sampleData])
            .environmentObject(UserViewModel())
    }
}
