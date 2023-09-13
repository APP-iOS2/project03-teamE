//
//  SearchBar.swift
//  CEats
//
//  Created by 박범수 on 2023/09/04.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var text: String
    @EnvironmentObject var userViewModel: UserViewModel
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: .screenWidth * 0.89, height: .screenHeight * 0.05) //뷰 바운드로 수정
                .foregroundColor(.white)
                .cornerRadius(30)
                .shadow(radius: 2)
            HStack {
                Image(systemName: "magnifyingglass")
                    .padding(.leading,30)
                    .foregroundColor(.black)
                TextField("\(userViewModel.user.username)님, 서브웨이 어때요?", text: $text)
                    .offset(x:-20)
                    .foregroundColor(.secondary)
                if !text.isEmpty {
                    Button(action: {
                        self.text = ""
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .offset(x:-30)
                    }
                } else {
                    EmptyView()
                }
            }
        }
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(text: .constant("hi"))
            .environmentObject(UserViewModel())
    }
}


