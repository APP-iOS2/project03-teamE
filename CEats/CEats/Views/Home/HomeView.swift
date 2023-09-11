//
//  HomeView.swift
//  CEats
//
//  Created by 박범수 on 2023/09/04.
//

import SwiftUI

struct HomeView: View {

    @State private var isOpenMapSheet: Bool = false
    @State var searchText: String = ""
    @State var user: User = User.sampleData
    @State private var isOpenCartSheet: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView{
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
                .scrollIndicators(.hidden)

                if user.foodCart?.cart.count ?? 0 > 0 {
                    HomeCartView(user: $user, isOpenMapSheet: $isOpenCartSheet)
                        .padding(.top, -10)
                }
            }
        }
        .fullScreenCover(isPresented: $isOpenMapSheet, content: {
            MapHomeView(isOpenMapSheet: $isOpenMapSheet)
        })
//        .fullScreenCover(isPresented: $isOpenCartSheet, content: {
//            CartView(isOpenMapSheet: $isOpenMapSheet)
//        })
        
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(RestaurantViewModel())
    }
}
