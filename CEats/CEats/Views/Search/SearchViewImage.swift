//
//  SearchViewDetail.swift
//  CEats
//
//  Created by 박범수 on 2023/09/06.
//

import SwiftUI

struct SearchViewImage: View {
    @StateObject var restaurantViewModel: RestaurantViewModel
    var columns = Array(repeating: GridItem(.flexible(), spacing: 0), count: 3)
    let imageSize: CGFloat = 99
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 30) {
            ForEach(FoodType.allCases, id: \.self) { content in
                NavigationLink {
                    FoodStoreListView(restaurantsStore: restaurantViewModel, selectedFoodType: content)
                } label: {
                    VStack(alignment: .center, spacing: 15) {
                        Image("\(content)")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: imageSize, height: imageSize)
                            .padding(.top,10)
                            .offset(y:3)
                        Text("\(content.rawValue)")
                            .font(.body)
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
}

struct SearchViewImage_Previews: PreviewProvider {
    static var previews: some View {
        SearchViewImage(restaurantViewModel: RestaurantViewModel())
    }
}
