//
//  MyInfoCategoryDetailView.swift
//  CEats
//
//  Created by 박범수 on 2023/09/10.
//

import SwiftUI

struct MyInfoCategoryDetailView: View {
    @EnvironmentObject private var userViewModel: UserViewModel
    @EnvironmentObject private var restaurantViewModel: RestaurantViewModel
    
    @Binding var selected: MyInfoCategory
    private let grids: [GridItem] = [
        .init(),
        .init(),
        .init(),
    ]
    
    var body: some View {
        switch selected {
        case .review:
            LazyVGrid(columns: grids) {
                ForEach(userViewModel.user.reviews) { review in
                    NavigationLink {
                        MyReviewView(review: review)
                    } label: {
                        Image(review.image ?? "")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                }
            }
        case .order:
            LazyVGrid(columns: grids) {
                ForEach(userViewModel.user.orderHistory) { order in
                    NavigationLink {
                        RTRView(restaurant: restaurantViewModel.findRestaurant(restaurant: order.restaurant))
                    } label: {
                        Image(order.orderedMenu[0].image ?? "soju")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                }
            }
        case .favorite:
            VStack {
                ForEach(userViewModel.user.favoriteRestaurant) { restaurant in
                    NavigationLink {
                        RTRView(restaurant: restaurant)
                    } label: {
                        MyPageRestaurantView(restaurant: restaurant)
                    }
                }
            }
        }
            
    }
}


struct MyInfoCategoryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MyInfoView()
                .environmentObject(UserViewModel())
                .environmentObject(RestaurantViewModel())
        }
    }
}
