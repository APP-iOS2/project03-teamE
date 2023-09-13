//
//  ContentView.swift
//  CEatsManager
//
//  Created by 박범수 on 2023/09/12.
//

import SwiftUI

struct ContentView: View {
    @State private var columnVisibility = NavigationSplitViewVisibility.doubleColumn
    @StateObject var restaurantViewModel: RestaurantViewModel = RestaurantViewModel()
    @StateObject var userViewModel: UserViewModel = UserViewModel()
    
    var body: some View {
        NavigationSplitView(columnVisibility: $columnVisibility) {
            ReviewHome()
        } detail: {
            
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
