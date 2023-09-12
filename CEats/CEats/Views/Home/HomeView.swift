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
    @EnvironmentObject var userViewModel: UserViewModel
    
    public let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
    @State private var selection = 0
    let images = ["advertisement","advertisement2","advertisement3"]
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView{
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
                .padding(.top,1)
                .scrollIndicators(.hidden)
                
                if userViewModel.user.foodCart?.cart.count ?? 0 > 0 {
                    HomeCartView(isOpenMapSheet: $isOpenCartSheet)
                        .padding(.top, -10)
                }
            }
            
            .onAppear{
                userViewModel.fetchUser {
                    print("온어피어적용됨~")
                }
            }
            .fullScreenCover(isPresented: $isOpenMapSheet, content: {
                MapHomeView(isOpenMapSheet: $isOpenMapSheet)
            })
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
