//
//  FoodStoreListView.swift
//  CEats
//
//  Created by Jisoo HAM on 2023/09/04.
//

import SwiftUI

struct FoodStoreListView: View {
    // MARK: - properties
    @ObservedObject var restaurantsStore: RestaurantViewModel = RestaurantViewModel()
//    @State var data: FoodType
    
    //MARK: - View
    var body: some View {
        NavigationStack {
            FoodStoreListDetailView(restaurantsStore: restaurantsStore, data: $restaurantsStore.data)
            ScrollView(.vertical, showsIndicators: false) {
                RestaurantCardView(restaurantsStore: restaurantsStore, data: $restaurantsStore.data)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    NavigationLink {
                        SearchView()
                    } label: {
                        Image(systemName: "magnifyingglass")
                    }

                }
            }
        }
    }
}

struct FoodStoreListView_Previews: PreviewProvider {
    static var previews: some View {
        FoodStoreListView()
    }
}
