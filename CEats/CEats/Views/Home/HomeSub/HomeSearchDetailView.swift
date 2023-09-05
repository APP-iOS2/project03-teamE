//
//  HomeSearchDetailView.swift
//  CEats
//
//  Created by 유하은 on 2023/09/05.
//

import SwiftUI

struct HomeSearchDetailView: View {
    @ObservedObject var restaurantViewModel: RestaurantViewModel
    @State var searchText: String = ""
    var body: some View {
        VStack{
            ZStack{
                Rectangle()
                    .frame(width: 350,height: 45) //뷰 바운드로 수정
                    .foregroundColor(.white)
                    .cornerRadius(30)
                    .shadow(radius: 5)
                ZStack{
                    HStack{
                        Image(systemName: "magnifyingglass")
                        TextField("ooo님, 서브웨이 어때요?", text: $searchText)
                    }.padding(.leading,40)
                }
            }
            PopularSearchView()
                .padding(.leading,30)
                .padding(.top,30)
            Rectangle()
                .foregroundColor(.veryLightGray)
                .frame(width: .screenWidth, height: 10)
            RecentSearchView()
                .padding(20)
            Spacer()
        }
    }
    
    func searchRestaurant(_ restaurants : [Restaurant], _ searchString: String, _ pickSearch: String) -> [Restaurant] {
            guard searchString.isEmpty else {
                return restaurants.filter { restaurant in
                    if pickSearch == "이름" {
                        return restaurant.name.contains(searchString) ?? false
                    } else {
                        return restaurant.name.contains(searchString)
                    }
                }
            }
            return restaurants
    }
}

struct HomeSearchDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HomeSearchDetailView(restaurantViewModel: RestaurantViewModel())
    }
}
