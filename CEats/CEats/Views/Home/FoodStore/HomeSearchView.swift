//
//  HomeSearchView.swift
//  CEats
//
//  Created by 유하은 on 2023/09/04.
//

import SwiftUI

struct HomeSearchView: View {
    @State private var searchText: String = ""
    @State private var isShowingSheet: Bool = false
    
    var body: some View {
        NavigationStack{
            ZStack{
                Rectangle()
                    .frame(width: .screenWidth * 0.8,height: 45) //뷰 바운드로 수정
                    .foregroundColor(.white)
                    .cornerRadius(30)
                    .shadow(radius: 2)
                ZStack{
                    HStack{
                        Image(systemName: "magnifyingglass")
                        TextField("ooo님, 서브웨이 어때요?", text: $searchText)
                            .padding(15)
                    }
                }
            }
        }
    }
}

struct HomeSearchView_Previews: PreviewProvider {
    static var previews: some View {
        HomeSearchView()
    }
}
