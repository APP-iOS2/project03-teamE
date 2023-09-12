//
//  MyInfoView.swift
//  CEats
//
//  Created by 박범수 on 2023/09/10.
//

import SwiftUI

struct MyInfoView: View {
    @EnvironmentObject private var userViewModel: UserViewModel
    @State private var selected: MyInfoCategory = .favorite
    
    var body: some View {
        ScrollView {
            VStack {
                Text("\(userViewModel.user.username)")// 내 이름
                    .font(.largeTitle)
                    .padding(5)
                Text("\(userViewModel.user.phoneNumber)")// 내 전화번호
                
                HStack(alignment: .center ,spacing: 10) {
                    VStack {
                        Text("\(userViewModel.user.reviews.count)")
                            .font(.largeTitle)
                            .bold()
                        Text("내가 남긴리뷰")
                            .font(.footnote)
                    }
                    .padding()
                    VStack(alignment: .center) {
                        Text("0")
                            .font(.largeTitle)
                            .bold()
                        Text("도움이 됐어요")
                            .font(.footnote)
                    }
                    .padding()
                    VStack {
                        Text("\(userViewModel.user.favoriteRestaurant.count)")
                            .font(.largeTitle)
                            .bold()
                        Text("즐겨찾기")
                            .font(.footnote)
                    }
                    .padding()
                }
                Spacer()
                .frame(maxWidth: .infinity, minHeight: 5)
                .background(Color.veryLightGray)
                MyInfoCategoryView(selected: $selected)
                MyInfoCategoryDetailView(selected: $selected)
            }
            
        }
    }
}
