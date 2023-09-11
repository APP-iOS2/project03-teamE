//
//  HomeSearchBarView.swift
//  CEats
//
//  Created by 박범수 on 2023/09/10.
//

import SwiftUI

struct HomeSearchBarView: View {
    @Binding var searchText: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: .screenWidth * 0.9, height: .screenHeight * 0.05)
                .foregroundColor(.white)
                .cornerRadius(30)
                .shadow(radius: 2)
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.black)
                TextField("ooo님, 서브웨이 어때요?", text: $searchText)
                    .frame(width: .screenWidth * 0.43)
                Spacer()
            }
            .padding(.leading,40)
        }
        .padding(.bottom,4)
    }
}
