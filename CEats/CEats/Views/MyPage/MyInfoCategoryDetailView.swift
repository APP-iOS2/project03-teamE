//
//  MyInfoCategoryDetailView.swift
//  CEats
//
//  Created by 박범수 on 2023/09/10.
//

import SwiftUI

struct MyInfoCategoryDetailView: View {
    @EnvironmentObject var userViewModel: UserViewModel
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
                    Image(systemName: review.image ?? "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
        case .order:
            LazyVGrid(columns: grids) {
                ForEach(userViewModel.user.orderHistory) { order in
                    ForEach(order.orderedMenu, id: \.name) { menu in
                        Image(systemName: menu.image ?? "photo")
                    }
                }
            }
        case .favorite:
            VStack {
                ForEach(userViewModel.user.favoriteRestaurant) { restaurant in
                    //RestaurantCardView 컴포넌트
                }
            }
        }
        
    }
}
