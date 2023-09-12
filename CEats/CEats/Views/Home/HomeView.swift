//
//  HomeView.swift
//  CEats
//
//  Created by 박범수 on 2023/09/04.
//

import SwiftUI

struct HomeView: View {
    @State private var isOpenMapSheet: Bool = false
    @State private var searchText: String = ""
    @State private var isOpenCartSheet: Bool = false
    @EnvironmentObject private var userViewModel: UserViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView(showsIndicators: false) {
                    HeaderView(isOpenMapSheet: $isOpenMapSheet)
                    NavigationLink {
                        HomeSearchDetailView()
                    } label: {
                        HomeSearchBarView(searchText: $searchText)
                    }
                    FoodTypeGridView()
                    //                    AdvertisementView()
                    SliderView()
                    RecommendedRestaurantsView()
                }
                if userViewModel.user.foodCart != nil {
                    HomeCartView(isOpenMapSheet: $isOpenCartSheet)
                        .padding(.top, -10)
                }
            }
            .padding(.top, 1)
        }
        .onAppear{
            userViewModel.fetchUser {
                print("온어피어적용됨~")
            }
        }
        .fullScreenCover(isPresented: $isOpenMapSheet) {
            MapHomeView(isOpenMapSheet: $isOpenMapSheet)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(RestaurantViewModel())
            .environmentObject(UserViewModel())
    }
}
