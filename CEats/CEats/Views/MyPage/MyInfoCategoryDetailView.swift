//
//  MyInfoCategoryDetailView.swift
//  CEats
//
//  Created by 박범수 on 2023/09/10.
//

import SwiftUI

struct MyInfoCategoryDetailView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @EnvironmentObject var restaurantViewModel: RestaurantViewModel
    
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
                        ReviewInfoView(restaurant: restaurantViewModel.findRestaurant(review: review), scrollID: review.id)
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
                    ForEach(order.orderedMenu, id: \.name) { menu in
                        NavigationLink {
                            RTRView(restaurant: restaurantViewModel.findRestaurant(restaurant: order.restaurantName))
                        } label: {
                            Image(menu.image ?? "photo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
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

struct MyPageRestaurantView: View {
    let restaurant: Restaurant
    @State private var selectedIndex = 0
    
    var body: some View {
        VStack {
            HStack {
                TabView(selection: $selectedIndex) {
                    ForEach(restaurant.mainImage, id: \.self) { image in
                        Image(image)
                            .resizable()
                            .scaledToFill()
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                .frame(maxWidth: .screenWidth * 0.3)
                .cornerRadius(10)
                .padding()
                VStack(alignment: .leading, spacing: 8) {
                    Text(restaurant.name)
                        .bold()
                    HStack(spacing: 0) {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text("\(restaurant.scoreMessage)(\(restaurant.reviews.count))")
                    }
                    Text("\(restaurant.deliveryTime) · \(restaurant.deliveryFee)")
                    HStack {
                        Image(systemName: "tag.fill")
                            .foregroundColor(.blue)
                            .opacity(0.6)
                        // 레스토랑에 쿠폰필요함
                        Text("1,000원 쿠폰")
                        //                        Text("\(restaurant.coupons)")
                    }
                    .bold()
                    .padding(3)
                    .padding(.horizontal, 3)
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .opacity(0.6)
                    )
                }
                .foregroundColor(.primary)
                Spacer()
            }
            Divider()
                .padding(.horizontal, 15)
        }
        .padding(.horizontal)
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
