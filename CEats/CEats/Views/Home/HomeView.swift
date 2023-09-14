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
    @EnvironmentObject private var restaurantViewModel: RestaurantViewModel
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                ScrollView(showsIndicators: false) {
                    HeaderView(isOpenMapSheet: $isOpenMapSheet)
                    NavigationLink {
                        HomeSearchDetailView()
                    } label: {
                        HomeSearchBarView(searchText: $searchText)
                    }
                    FoodTypeGridView()
                    SliderView()
                    HStack{
                        Text("이츠 추천 맛집")
                            .bold()
                        Spacer()
                    }
                    .offset(y:-13)
                    .padding(.leading,20)
                    .font(.system(size:20))
                    RecommendedRestaurantsView()
                }
                if userViewModel.user.foodCart != nil {
                    HomeCartView(isOpenMapSheet: $isOpenCartSheet)
                        .padding(.top, -10)
                }
            }
            .padding(.top, 1)
        }
//        .refreshable {
//            userViewModel.fetchUser {
//            }
//        }
        .onAppear{
            userViewModel.fetchUser {
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
