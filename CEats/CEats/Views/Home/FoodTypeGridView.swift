//
//  FoodTypeGridView.swift
//  CEats
//
//  Created by 박범수 on 2023/09/10.
//

import SwiftUI

struct FoodTypeGridView: View {
    private let layout: [GridItem] = Array(repeating: .init(.flexible()), count: 5)
    
    var body: some View {
        LazyVGrid(columns: layout, alignment: .center) {
            ForEach(FoodType.allCases, id: \.self) { content in
                NavigationLink(destination: FoodStoreListView(selectedFoodType: content)) {
                    VStack {
                        Spacer()
                        Image("\(content)")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60, height: 40)
                            .padding(.bottom, 3)
                            .offset(y: 3)
                        Spacer()
                        Text(content.rawValue)
                            .font(.footnote)
                            .foregroundColor(.black)
                            .padding(.bottom, 10)
                    }
                }
            }
        }
        .padding([.trailing, .leading], 20)
    }
}
