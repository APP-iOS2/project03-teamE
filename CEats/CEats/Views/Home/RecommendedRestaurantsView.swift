//
//  RecommendedRestaurantsView.swift
//  CEats
//
//  Created by 박범수 on 2023/09/10.
//

import SwiftUI

struct RecommendedRestaurantsView: View {
    @EnvironmentObject var restaurantViewModel: RestaurantViewModel
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 20) {
                ForEach(restaurantViewModel.restaurants) { restaurant in
                    NavigationLink {
                        RTRView(restaurant: restaurant)
                    } label: {
                        RecommendRestaurantView(restaurant: restaurant)
                    }
                }
            }
        }
        .scrollIndicators(.hidden)
        .padding(.leading, 20)
        .padding(.bottom, 20)
    }
}
