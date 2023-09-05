//
//  RestaurantCardView.swift
//  CEats
//
//  Created by 장여훈 on 2023/09/04.
//

import SwiftUI

struct RestaurantCardView: View {
    
    // MARK: - properties
    @State var isFavorited: Bool = false
    @ObservedObject var restaurantsStore: RestaurantViewModel
    @Binding var data: FoodType
    
    var filterFoodType: [Restaurant] {
        restaurantsStore.restaurants.filter { store in
            return store.foodType.contains(self.data)
        }
    }
    
    // MARK: - Views
    var body: some View {
        NavigationStack {
            // FoodType으로 먼저 분류 -> 분류된 목록에서 ForEach로 반복
            NavigationLink {
                
            } label: {
                
                ForEach(filterFoodType){ store in
                    TestView(restaurantsStore: restaurantsStore, data: $data)
                }
                
                .padding()
                .foregroundColor(.black)
            }
        }
        
    }
}

struct RestaurantCardView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantCardView(restaurantsStore: RestaurantViewModel(), data: .constant(.korean))
    }
}
