//
//  ResentSearchView.swift
//  CEats
//
//  Created by 박범수 on 2023/09/06.
//

import SwiftUI

struct ResentSearchView: View {
    
    @ObservedObject var restaurantViewModel: RestaurantViewModel
    @State private var searchTerm = ""
    var array: Set<String> {
        Set(restaurantViewModel.collectAllFoodNames())
    }
    
    
    var body: some View {
        NavigationStack {
            HStack {
                Spacer()
                SearchBarView(text: $searchTerm)
                Image(systemName: "magnifyingglass")
                Spacer()
            }
            Spacer()
            Text("최근 검색어: \(searchTerm)")
                .padding()
        }
    }
}
struct ResentSearchView_Previews: PreviewProvider {
    static var previews: some View {
        ResentSearchView(restaurantViewModel: RestaurantViewModel())
    }
}
