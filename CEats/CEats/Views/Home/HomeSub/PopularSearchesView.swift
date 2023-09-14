//
//  PopularSearchesView.swift
//  CEats
//
//  Created by 유하은 on 2023/09/05.
//

import SwiftUI

struct PopularSearchView: View {
    let popularSearches = [
        "김밥", "맥도날드", "반찬", "엽기떡볶이", "마라탕",
        "피자", "본죽", "맘스터치", "반찬", "서브웨이"
    ]

    let rows = [
        GridItem(),
        GridItem(),
        GridItem(),
        GridItem(),
        GridItem()
    ]

    var body: some View {
        VStack(alignment: .leading){
            Text("인기 검색어")
                .bold()
            LazyHGrid(rows: rows) {
                ForEach(popularSearches.indices, id: \.self) { index in
                    HStack{
                        Text("\(index+1)")
                            .foregroundColor(index < 3 ? .cEatsBlue : .black)
                        Text(popularSearches[index])
                            .padding(20)
                        Spacer()
                    }
                    .frame(width: 150, height: 60)
                    .padding(20)
                }
            }
            .padding(.bottom,20)
        }
    }
}


struct PopularSearchesView_Previews: PreviewProvider {
    static var previews: some View {
        PopularSearchView()
    }
}
