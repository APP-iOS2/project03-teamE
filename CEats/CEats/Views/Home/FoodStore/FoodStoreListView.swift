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
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var restaurantsStore: RestaurantViewModel
    @EnvironmentObject var userViewModel: UserViewModel
    @State var selectedFoodType: FoodType?
    
    //MARK: - View
    var body: some View {
        VStack {
            ScalingHeaderScrollView {
                FoodStoreListDetailView(selectedFoodType: $selectedFoodType)
            } content: {
                RestaurantCardView(selectedFoodType: $selectedFoodType)
            }
            .height(min: 47, max: 150)
        }
        .navigationTitle("\(selectedFoodType?.rawValue ?? "한식")")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                navigationBackButton
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink {
                    SearchView()
                } label: {
                    Image(systemName: "magnifyingglass")
                }
            }
        }
        .foregroundColor(.primary)
        .bold()
    }
    
    var navigationBackButton: some View {
        Button {
            dismiss()
        } label: {
            Image(systemName: "arrow.left")
        }
    }
}

struct FoodStoreListView_Previews: PreviewProvider {
    static var previews: some View {
        FoodStoreListView(selectedFoodType: .korean)
            .environmentObject(RestaurantViewModel())
            .environmentObject(UserViewModel())
    }
}
