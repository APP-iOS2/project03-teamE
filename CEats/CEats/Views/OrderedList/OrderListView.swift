//
//  OrderListView.swift
//  CEats
//
//  Created by 유하은 on 2023/09/08.
//

import SwiftUI

struct OrderListView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @State var isShowingSheet: Bool = false
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                ForEach(userViewModel.filteredOrderList) { order in
                    OrderCellView(order: order)
                }
            }
            .padding(20)
        }
    }
}


struct waitingListView_Previews: PreviewProvider {
    static var previews: some View {
        OrderListView()
            .environmentObject(UserViewModel())
    }
}
