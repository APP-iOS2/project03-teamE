//
//  RestaurantViewModel.swift
//  CEatsManager
//
//  Created by Jisoo HAM on 2023/09/13.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

final class RestaurantViewModel: ObservableObject {
    @Published var restaurants: [Restaurant] = Restaurant.sampleArray
    private let db = Firestore.firestore()
    let fireManager = CEatsFBManager.shared
    
    func fetchAllRestaurant() {
        restaurants = []
        fireManager.addCollectionSnapshotForRest(type: Restaurant.self) { success in
            self.restaurants = success
        }
    }
    
    func readRestaurant(completion: @escaping () -> ()) {
        fireManager.read(type: Restaurant.self, id: "ceoID") { result in
            self.restaurants.append(result)
            completion()
        }
        for index in 2..<restaurants.count{
            fireManager.read(type: Restaurant.self, id: "ceoID\(index)") { result in
                self.restaurants.append(result)
                completion()
            }
        }
    }
    
    
    func updateRestaurant(restaurant: Restaurant) {
        fireManager.create(data: restaurant)
    }
    
    func setRestaurant(){
        fireManager.uploadDummyArray(datas: restaurants)
    }
    
    func deleteReview(restaurant: inout Restaurant, review: Review) {
        var index: Int = 0

        for temp in restaurant.reviews {
            if temp.writer == review.writer {
                restaurant.reviews.remove(at: index)
                break
            }
            
            index += 1
        }
        updateRestaurant(restaurant: restaurant)
    }
    
    func findRestaurant(restaurant: Restaurant) -> Restaurant {
        guard let index = restaurants.firstIndex(where: { $0.id == restaurant.id }) else {
            print(#function + ": fail to optional bind")
            return .sampleData
        }
        return restaurants[index]
    }
    
    
}
