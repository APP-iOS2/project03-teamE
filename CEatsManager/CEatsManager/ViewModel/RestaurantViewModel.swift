//
//  RestaurantViewModel.swift
//  CEatsManager
//
//  Created by Jisoo HAM on 2023/09/13.
//

import Foundation

final class RestaurantViewModel: ObservableObject {
    @Published var restaurants: [Restaurant] = Restaurant.sampleArray
}
