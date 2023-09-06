//
//  FoodStoreListView.swift
//  CEats
//
//  Created by Jisoo HAM on 2023/09/04.
//

import SwiftUI

struct FoodStoreListView: View {
    // MARK: - properties
    @ObservedObject var restaurantsStore: RestaurantViewModel
    @State var selectedFoodType: FoodType?
    
    //MARK: - View
    var body: some View {
        NavigationStack {
            FoodStoreListDetailView(restaurantsStore: restaurantsStore, selectedFoodType: $selectedFoodType)
            ScrollView(.vertical, showsIndicators: false) {
                RestaurantCardView(restaurantsStore: restaurantsStore, selectedFoodType: $selectedFoodType)
            }
            .navigationTitle("\(selectedFoodType?.rawValue ?? "한식")")
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
        FoodStoreListView(restaurantsStore: RestaurantViewModel(), selectedFoodType: .korean)
    }
}
