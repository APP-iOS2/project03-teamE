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
        NavigationStack{
            VStack {
                HStack {
                    Spacer()
                    NavigationLink {
//                        ResentSearchView()
                        HomeSearchDetailView(restaurantViewModel: restaurantViewModel)
                    } label: {
                        SearchBarView(text: $searchTerm)
                    }
                }
                ScrollView {
                    SearchViewImage(restaurantViewModel: restaurantViewModel)
                }
            }
        }
//        .onTapGesture {
//            hideKeyboard() //추가
//        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(restaurantViewModel: RestaurantViewModel())
    }
}

