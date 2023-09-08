//
//  OrderedListView.swift
//  CEats
//
//  Created by 박범수 on 2023/09/04.
//

import SwiftUI

struct OrderedListView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @State private var selectedButton: OrderState = .과거주문내역
    enum OrderState: String, CaseIterable {
        case 과거주문내역
        case 준비중
    }
    
    var filteredOrderList: [Order] {
        if selectedButton == .과거주문내역 {
           return userViewModel.user.orderHistory.filter { $0.orderStatus != .waiting }
        } else {
            return userViewModel.user.orderHistory.filter { $0.orderStatus == .waiting }
        }
    }
    
    //    userViewModel.user.orderHistory
    
    var body: some View {
        NavigationStack {
            VStack{
                HStack{
                    ForEach(OrderState.allCases, id: \.self) { state in
                        Button {
                            selectedButton = state
                            print("\(selectedButton)")
                        } label: {
                            VStack{
                                Text(state.rawValue)
                                    .fontWeight(selectedButton == state ? .medium : .regular )
                                    .foregroundColor(.black)
                                Rectangle()
                                    .frame(height: 1)
                                    .foregroundColor(selectedButton == state ? .black : .clear)
                            }
                        }
                    }
                }
                OrderListCellView(filteredOrderList: filteredOrderList)
                    .padding(20)
            }
        }
    }
}

struct OrderedListView_Previews: PreviewProvider {
    static var previews: some View {
        OrderedListView()
            .environmentObject(UserViewModel())
    }
}
