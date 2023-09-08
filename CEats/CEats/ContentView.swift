//
//  ContentView.swift
//  CEats
//
//  Created by 박범수 on 2023/09/04.
//

import SwiftUI

struct ContentView: View {
    var fireManager = CEatsFBManager()
    @State var tabIndex: Int = 0
    @StateObject var restaurantViewModel = RestaurantViewModel()
    @StateObject var userViewModel = UserViewModel()
    @State var orders = [Order]()
    init() {
        UITabBar.appearance().backgroundColor = UIColor.white
        UITabBar.appearance().backgroundImage = UIImage()
    }
    
    var body: some View {
        TabView(selection: $tabIndex) {
            
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("홈")
                }
                .tag(1)
            
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("검색")
                }
                .tag(2)
            
            FavoriteView(tabIndex: $tabIndex)
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
            
            MyView(tabIndex: $tabIndex)
                .tabItem {
                    Image(systemName: "person")
                    Text("마이페이지")
                }
                .tag(5)
        }
        .environmentObject(restaurantViewModel)
        .environmentObject(userViewModel)
// MARK: 파이어 베이스 테스팅 코드 .toolbar, .onAppear
//        .toolbar {
//            ToolbarItem(placement: .navigationBarLeading) {
//                Button("추가후 네트워킹") {
//                    userViewModel.user.orderHistory.append(.sampleData)
//                    fireManager.create(data: userViewModel.user)
//                }
//            }
//            ToolbarItem(placement: .navigationBarTrailing) {
//                Text("\(orders.count)")
//            }
//        }
//        .onAppear {
//            fireManager.read(type: User.self, id: "cce85ebzswcF8HxlCVv4") { print($0) }
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ContentView()
        }
    }
}
