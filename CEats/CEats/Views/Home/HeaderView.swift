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
                        .foregroundColor(.primary)
                    Image(systemName: "chevron.down")
                        .foregroundColor(.cEatsBlue)
                }
            }
            Spacer()
        }
        .padding(20)
    }
}

struct HeaderView_Preview: PreviewProvider {
    static var previews: some View {
        HeaderView(isOpenMapSheet: .constant(true))
            .environmentObject(UserViewModel())
    }
}
