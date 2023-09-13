//
//  SearchViewDetail.swift
//  CEats
//
//  Created by 박범수 on 2023/09/06.
//

import SwiftUI

struct SearchViewImage: View {
    private var columns = Array(repeating: GridItem(.flexible(), spacing: 0), count: 3)
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 30) {
            ForEach(FoodType.allCases, id: \.self) { content in
                NavigationLink {
                    FoodStoreListView(selectedFoodType: content)
                } label: {
                    VStack(alignment: .center, spacing: 15) {
                        Image("\(content)")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 70, height: 70)
                            .padding(.top,10)
                        Text("\(content.rawValue)")
                            .font(.system(size:15))
                            .foregroundColor(.primary)
                            .offset(y:0)
                    }
                }
            }
        }
    }
}

struct SearchViewImage_Previews: PreviewProvider {
    static var previews: some View {
        SearchViewImage()
    }
}
