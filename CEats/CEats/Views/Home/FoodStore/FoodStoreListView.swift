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
            // 좌우 스크롤
            FoodStoreListDetailView(restaurantsStore: restaurantsStore, selectedFoodType: $selectedFoodType)
            // 좌우 스크롤에 맞춘 가게들 나오는 상하 스크롤
            // 근데 지금 안됨 왜 ?
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
