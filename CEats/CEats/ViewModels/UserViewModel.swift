//
//  UserViewModel.swift
//  CEats
//
//  Created by 박범수 on 2023/09/07.
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
