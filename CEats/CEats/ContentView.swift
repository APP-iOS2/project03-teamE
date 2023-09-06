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
    
    var body: some View {
        TabView(selection: $tabIndex) {
            
            HomeView(restaurantViewModel: restaurantViewModel)
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("홈")
                }
                .tag(1)
            
            SearchView(restaurantViewModel: restaurantViewModel)
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("검색")
                }
                .tag(2)
            
            FavoriteView(favoriteStore: restaurantViewModel)
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("즐겨찾기")
                }
                .tag(3)
            
            OrderedListView()
                .tabItem {
                    Image(systemName: "doc.plaintext")
                    Text("주문내역")
                }
                .tag(4)
            
            MyView()
                .tabItem {
                    Image(systemName: "person")
                    Text("마이페이지")
                }
                .tag(5)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
