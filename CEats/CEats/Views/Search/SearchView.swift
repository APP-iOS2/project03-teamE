//
//  SearchView.swift
//  CEats
//
//  Created by 박범수 on 2023/09/04.
//

import SwiftUI

struct SearchView: View {
    @StateObject var restaurantViewModel: RestaurantViewModel
    @State private var searchTerm = ""

    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                SearchBarView(text: $searchTerm)
                Image(systemName: "magnifyingglass")
                Spacer()
            }
            Spacer()
            ScrollView {
                SearchViewImage(restaurantViewModel: restaurantViewModel)
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(restaurantViewModel: RestaurantViewModel())
    }
}

