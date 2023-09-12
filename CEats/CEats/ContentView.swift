//
//  ContentView.swift
//  CEats
//
//  Created by 박범수 on 2023/09/04.
//

import SwiftUI

struct ContentView: View {
    @State var tabIndex: Int = 0
    @StateObject var restaurantViewModel = RestaurantViewModel()
    @StateObject var userViewModel = UserViewModel()
    
    var body: some View {
        TabView(selection: $tabIndex) {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("홈")
                }
                .tag(0)
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("검색")
                }
                .tag(1)
            FavoriteView(tabIndex: $tabIndex)
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("즐겨찾기")
                }
                .tag(2)
            OrderedListView()
                .tabItem {
                    Image(systemName: "doc.plaintext")
                    Text("주문내역")
                }
                .tag(3)
            MyView(tabIndex: $tabIndex)
                .tabItem {
                    Image(systemName: "person")
                    Text("마이페이지")
                }
                .tag(4)
        }
        .environmentObject(restaurantViewModel)
        .environmentObject(userViewModel)
        .navigationBarBackButtonHidden()
        .onAppear {
            userViewModel.login()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
