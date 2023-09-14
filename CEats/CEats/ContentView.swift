//
//  ContentView.swift
//  CEats
//
//  Created by 박범수 on 2023/09/04.
//

import SwiftUI

enum TabKind: Int, CaseIterable, Identifiable {
    case home, search, favorite, ordered, my
    
    @ViewBuilder
    var view: some View {
        switch self {
        case .home:
            HomeView()
        case .search:
            SearchView()
        case .favorite:
            FavoriteView()
        case .ordered:
            OrderedListView()
        case .my:
            MyView()
        }
    }
    
    var imgName: String {
        switch self {
        case .home:
            return "house.fill"
        case .search:
            return "magnifyingglass"
        case .favorite:
            return "heart.fill"
        case .ordered:
            return "doc.plaintext"
        case .my:
            return "person"
        }
    }
    
    var title: String {
        switch self {
        case .home:
            return "홈"
        case .search:
            return "검색"
        case .favorite:
            return "즐겨찾기"
        case .ordered:
            return "주문내역"
        case .my:
            return "마이페이지"
        }
    }
    
    var id: Self { self }
}

class TabViewModel: ObservableObject {
    @Published var tabIndex = 0
}

struct ContentView: View {
    @StateObject private var tabViewModel = TabViewModel()
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        TabView(selection: $tabViewModel.tabIndex) {
            ForEach(TabKind.allCases) { kind in
                kind.view
                    .tabItem {
                        Image(systemName: kind.imgName)
                        Text(kind.title)
                    }
                    .tag(kind.rawValue)
            }
        }
        .environmentObject(tabViewModel)
        .navigationBarBackButtonHidden()        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserViewModel())
            .environmentObject(RestaurantViewModel())
    }
}
