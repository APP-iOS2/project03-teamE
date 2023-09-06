//
//  SearchBar.swift
//  CEats
//
//  Created by 박범수 on 2023/09/04.
//

import SwiftUI


struct SearchBarView: View {
    @Binding var text: String
    
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: 300,height: 45) //뷰 바운드로 수정
                .foregroundColor(.white)
                .cornerRadius(30)
                .shadow(radius: 5)
            ZStack{
                HStack{
                    TextField("고객님, 이거 어때요?", text: $text)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.primary)
                    if !text.isEmpty {
                        Button(action: {
                            self.text = ""
                        }) {
                            Image(systemName: "xmark.circle.fill")
                        }
                    } else {
                        EmptyView()
                    }
                    Spacer()
                    Image(systemName: "magnifyingglass")
                }
            }
            .padding()
        }
    }
}
    
