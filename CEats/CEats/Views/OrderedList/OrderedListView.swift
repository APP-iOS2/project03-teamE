//
//  OrderedListView.swift
//  CEats
//
//  Created by 박범수 on 2023/09/04.
//

import SwiftUI

struct OrderedListView: View {
    //StateObject , observedObject 는 뷰를 바라보고 있어서 변하면 초기화 돼서 다시 그려줌
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var userViewModel: UserViewModel
    @State var isRoot = true
    
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
                                    .foregroundColor(.primary)
                                Rectangle()
                                    .frame(height: 1)
                                    .foregroundColor(userViewModel.selectedButton == state ? .primary : .clear)
                            }
                        }
                    }
                }
                .padding(.top,19)
                
                OrderListView()
                    .padding(16)
            }
            .navigationBarBackButtonHidden()
            .toolbar {
                if !isRoot {
                    ToolbarItem(placement: .navigationBarLeading) {
                        CEatsNavigationBackButton {
                            dismiss()
                        }
                    }
                }
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
