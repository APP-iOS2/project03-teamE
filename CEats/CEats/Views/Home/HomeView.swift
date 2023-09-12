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
                    //헤더뷰, 위치 정해주는 뷰
                    NavigationLink {
                        HomeSearchDetailView()
                    } label: {
                        HomeSearchBarView(searchText: $searchText)
                    }
                    //서치뷰
                    FoodTypeGridView()
                    //푸드 타입 정하는 뷰
                    AdvertisementView()
                        .padding(18)
                    //광고
                    RecommendedRestaurantsView()
                    //추천맛집뷰
                }
                if userViewModel.user.foodCart != nil {
                    HomeCartView(isOpenMapSheet: $isOpenCartSheet)
                        .padding(.top, -10)
                }
            }
            .padding(.top, 1)
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
