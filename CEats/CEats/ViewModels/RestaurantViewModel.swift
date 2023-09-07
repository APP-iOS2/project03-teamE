//
//  RestaurantViewModel.swift
//  CEats
//
//  Created by 유하은 on 2023/09/04.
//

import Foundation

final class RestaurantViewModel: ObservableObject {
    @Published var restaurants: [Restaurant] = Restaurant.sampleArray
    
    @Published var selectedFoodType: FoodType? = nil
    
    func filterFoodTypes(_ data: FoodType?) -> [Restaurant] {
        return restaurants.filter { store in
            if let data = data {
                return store.foodType.contains(data)
            } else {
                return true
            }
        }
    }
    
    
    func filterFoodName(_ name: String) -> [Restaurant] {
        return restaurants.filter { restaurant in
            restaurant.menus.contains { food in
                return food.name == name
            }
        }
    }
    
    func collectAllFoodNames() -> Set<String> {
        var foodNames: Set<String> = []
        
        for restaurant in restaurants {
            for menu in restaurant.menus {
                foodNames.insert(menu.name)

            }
        }
        
        return foodNames
    }
}
