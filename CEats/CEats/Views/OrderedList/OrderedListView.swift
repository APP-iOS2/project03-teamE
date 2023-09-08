//
//  OrderedListView.swift
//  CEats
//
//  Created by 박범수 on 2023/09/04.
//

import SwiftUI

struct OrderedListView: View {
    //StateObject , observedObject 는 뷰를 바라보고 있어서 변하면 초기화 돼서 다시 그려줌.
    @EnvironmentObject var userViewModel: UserViewModel
    
    var body: some View {
        NavigationStack {
            VStack{
                HStack{
                    ForEach(UserViewModel.OrderState.allCases, id: \.self) { state in
                        Button {
                            userViewModel.selectedButton = state
                        } label: {
                            VStack{
                                Text(state.rawValue)
                                    .fontWeight(userViewModel.selectedButton == state ? .medium : .regular )
                                    .foregroundColor(.black)
                                Rectangle()
                                    .frame(height: 1)
                                    .foregroundColor(userViewModel.selectedButton == state ? .black : .clear)
                            }
                        }
                    }
                }
                    OrderListCellView()
                    .padding(16)
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
