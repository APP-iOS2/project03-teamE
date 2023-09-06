//
//  FavoriteView.swift
//  CEats
//
//  Created by 박범수 on 2023/09/04.
//

import SwiftUI

struct FavoriteView: View {
    @ObservedObject var favoriteStore: RestaurantViewModel
    
    private var isFavoriteEmpty: Bool {
        favoriteStore.restaurants.isEmpty
    }
    
    var body: some View {
        NavigationStack {
            if isFavoriteEmpty {
                VStack {
                    Image("isFavorite")
                        .resizable()
                        .frame(width: 350, height: 400)
                        .cornerRadius(10)
                        .padding()
                    
                    NavigationLink {
                        HomeView(restaurantViewModel: RestaurantViewModel())
                    } label: {
                        Text("쿠팡이츠 맛집 구경가기")
                            .frame(width: 180, height: 50)
                            .clipShape(Rectangle())
                            .overlay(
                                Rectangle()
                                    .stroke(Color.gray,lineWidth: 1)
                            )
                    }
                }
            } else {
                ScrollView {
                    VStack {
                        ForEach(favoriteStore.restaurants) { store in
                            NavigationLink {
                                
                            } label: {
                                HStack {
                                    AsyncImage(url: URL(string: "https://www.jungle.co.kr/image/90e4ffc149968a50c80cac37")) { image in
                                        image
                                            .resizable()
                                            .cornerRadius(10)
                                            .frame(width: .screenWidth * 0.42, height: .screenHeight * 0.15)
                                            
                                    }placeholder: {
                                        ProgressView()
                                    }
                                    
                                    VStack(alignment: .leading) {
                                        Text(store.name)
                                            .font(.title)
                                        Text("\(store.deliveryFee)")
                                        Divider()
                                    }
                                    .padding()
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView(favoriteStore: RestaurantViewModel())
    }
}
