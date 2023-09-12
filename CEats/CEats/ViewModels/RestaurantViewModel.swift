//
//  RestaurantViewModel.swift
//  CEats
//
//  Created by 유하은 on 2023/09/04.
//

import Foundation

final class RestaurantViewModel: ObservableObject {
    let fireManager = CEatsFBManager.shared
    @Published var restaurants: [Restaurant] = Restaurant.sampleArray
    
    @Published var selectedFoodType: FoodType? = nil
    
    func fetchAllRestaurant() {
        restaurants = []
        fireManager.readAllDocument(type: Restaurant.self) { result in
            self.restaurants.append(result)
        }
    }
    
    func updateFee(restaurant: Restaurant, to: Int) {
        fireManager.update(data: restaurant, value: \.deliveryFee, to: to) { result in
            
        }
    }
    
    
    func appendMenu(restaurant: Restaurant, to: Restaurant.Food) {
        var newRest = restaurant
        newRest.menus.append(to)
        fireManager.update(data: newRest, value: \.menus, to: newRest.menus) { result in
            guard let index = try? self.restaurants.firstIndex(where: { $0.id == result.id }) else { return }
            self.restaurants[index] = newRest
        }
    }
    
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
    
    func findRestaurant(restaurant: Restaurant) -> Restaurant {
        guard let index = restaurants.firstIndex(where: { $0.id == restaurant.id }) else {
            print(#function + ": fail to optional bind")
            return .sampleData
        }
        return restaurants[index]
    }
    
    func findRestaurant(review: Review) -> Restaurant {
        guard let index = restaurants.firstIndex(where: {
            $0.reviews.contains { $0.id == review.id }
        }) else {
            print(#function + ": fail to optional bind")
            return .sampleData
        }
        return restaurants[index]
    }
}
