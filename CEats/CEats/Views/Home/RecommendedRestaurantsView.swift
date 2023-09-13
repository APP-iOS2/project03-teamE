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
                        if restaurant.isOpen {
                            RecommendRestaurantView(restaurant: restaurant)
                        } else {
                            ZStack {
                                RecommendRestaurantView(restaurant: restaurant)
                                   
                                Text("영업 준비중")
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(.white)
                                    .padding(.bottom, 50)
                            }
                        }
                    }
                }
            }
        }
        .scrollIndicators(.hidden)
        .padding(.leading, 20)
        .padding(.bottom, 20)
    }
}

struct RecommendedRestaurantsView_Preview: PreviewProvider {
    static var previews: some View {
        RecommendedRestaurantsView()
            .environmentObject(RestaurantViewModel())
    }
}
