//
//  FoodStoreListView.swift
//  CEats
//
//  Created by Jisoo HAM on 2023/09/04.
//

import SwiftUI
import ScalingHeaderScrollView

struct FoodStoreListView: View {
    // MARK: - properties
    @StateObject var restaurantsStore: RestaurantViewModel
    @State var selectedFoodType: FoodType?
    
    //MARK: - View
    var body: some View {
        NavigationStack {
            ScalingHeaderScrollView {
                FoodStoreListDetailView(restaurantsStore: restaurantsStore, selectedFoodType: $selectedFoodType)
            } content: {
                RestaurantCardView(restaurantsStore: restaurantsStore, selectedFoodType: $selectedFoodType)
            }
            .height(min: 47, max: 150)
            .navigationTitle("\(selectedFoodType?.rawValue ?? "한식")")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    NavigationLink {
                        SearchView(restaurantViewModel: restaurantsStore)
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
