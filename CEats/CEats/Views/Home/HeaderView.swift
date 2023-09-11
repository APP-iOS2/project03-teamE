//
//  HeaderView.swift
//  CEats
//
//  Created by 박범수 on 2023/09/10.
//

import SwiftUI

struct HeaderView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @Binding var isOpenMapSheet: Bool
    
    var body: some View {
        HStack {
            Button(action: {
                isOpenMapSheet = true
            }) {
                HStack {
                    Label("\(userViewModel.user.userAddress)", systemImage: "location.circle")
                        .foregroundColor(.black)
                    Image(systemName: "chevron.down")
                }
            }
            Spacer()
        }
        .padding(20)
    }
}
