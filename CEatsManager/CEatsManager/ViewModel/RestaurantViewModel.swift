//
//  RestaurantViewModel.swift
//  CEatsManager
//
//  Created by Jisoo HAM on 2023/09/13.
//

import Foundation

final class RestaurantViewModel: ObservableObject {
    @Published var restaurants: [Restaurant] = Restaurant.sampleArray
    
    let fireManager = CEatsFBManager.shared
    
    func fetchAllRestaurant() {
        restaurants = []
        fireManager.readAllDocument(type: Restaurant.self) { result in
            self.restaurants.append(result)
        }
    }
    
    func setRestaurant(data: Restaurant){
        for i in 0..<restaurants.count {
            fireManager.create(data: restaurants[i])
        }
    }
    //update시키는 것 보다 얘가 낫다.
    
    func findRestaurant(restaurant: Restaurant) -> Restaurant {
        guard let index = restaurants.firstIndex(where: { $0.id == restaurant.id }) else {
            print(#function + ": fail to optional bind")
            return .sampleData
        }
        return restaurants[index]
    }
    
    
}
