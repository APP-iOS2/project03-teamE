//
//  ReviewHome.swift
//  CEatsManager
//
//  Created by 박범수 on 2023/09/12.
//

import SwiftUI

struct ReviewHome: View {
    @EnvironmentObject var restaurantViewModel: RestaurantViewModel
    @EnvironmentObject var userViewModel: UserViewModel
    
//    @State private var restaurantList: [Restaurant] = []
    
    
    var body: some View {
        VStack {
            List(restaurantViewModel.restaurants) { restaurant in
                NavigationLink {
                    ReviewDetail(restaurant: restaurant) // restaurant 파라미터로 넘겨주면 됩니다.
                } label: {
                    Text("\(restaurant.name)")
                }
            }
        }
        .navigationTitle("전체 가게")
        
    }
}

struct ReviewHome_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ReviewHome()
                .environmentObject(RestaurantViewModel())
                .environmentObject(UserViewModel())
        }
    }
}
