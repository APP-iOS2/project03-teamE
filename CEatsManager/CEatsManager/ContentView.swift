//
//  ContentView.swift
//  CEatsManager
//
//  Created by 박범수 on 2023/09/12.
//

import SwiftUI

struct ContentView: View {
    @State private var columnVisibility = NavigationSplitViewVisibility.all
    @StateObject var restaurantViewModel: RestaurantViewModel = RestaurantViewModel()
    @StateObject var userViewModel: UserViewModel = UserViewModel()
    
    var body: some View {
        NavigationSplitView(columnVisibility: $columnVisibility) {
            ReviewHome()
        } detail: {
            Text(" select Restaurants")
        }
        .navigationSplitViewStyle(.balanced)
        .environmentObject(RestaurantViewModel())
        .environmentObject(UserViewModel())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(RestaurantViewModel())
            .environmentObject(UserViewModel())
    }
}
