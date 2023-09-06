//
//  SearchView.swift
//  CEats
//
//  Created by 박범수 on 2023/09/04.
//

import SwiftUI

struct SearchView: View {
    
    @ObservedObject var restaurantViewModel: RestaurantViewModel
    @State private var searchTerm = ""
    
    //    init() {
    //        if let savedSearchTerm = UserDefaults.standard.string(forKey: "searchTerm") {
    //            searchTerm = savedSearchTerm
    //        }
    //    }
    
    var body: some View {
        NavigationView{
            VStack {
                HStack {
                    Spacer()
                    SearchBarView(text: $searchTerm)
                    Image(systemName: "magnifyingglass")
                    Spacer()
                }
                .onChange(of: searchTerm) { newValue in
                    UserDefaults.standard.set(newValue, forKey: "searchTerm")
                }
                Spacer()
                ScrollView {
                    SearchViewImage()
                }
            }
            .onTapGesture {
                hideKeyboard()
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(restaurantViewModel: RestaurantViewModel())
    }
}

