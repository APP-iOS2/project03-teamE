//
//  RestaurantViewModel.swift
//  CEats
//
//  Created by 유하은 on 2023/09/04.
//

import Foundation

final class UserViewModel: ObservableObject {
    @Published var user: User = User.sampleData
    
    func checkLike(restaurant: Restaurant) -> Bool {
        return user.favoriteRestaurant.contains(where: { $0.id == restaurant.id })
    }
    
    func removeRestaurant(restaurant: Restaurant) {
        guard let index = user.favoriteRestaurant.firstIndex(where: { $0.id == restaurant.id }) else { return }
        user.favoriteRestaurant.remove(at: index)
    }
}

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
    
//    func removeRestaurant(restaurant: Restaurant) {
//        guard let index = user.favoriteRestaurant.firstIndex(where: { $0.id == restaurant.id }) else { return }
//        user.favoriteRestaurant.remove(at: index)
//    }
    
//    func removeRTR(store: Restaurant) {
//        var index: Int = 0
//
//        for tempStore in user.favoriteRestaurant {
//            if tempStore.id == store.id {
//                user.favoriteRestaurant.remove(at: index)
//                break
//            }
//            index += 1
//        }
//    }
}
