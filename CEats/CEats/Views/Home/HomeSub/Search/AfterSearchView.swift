//
//  AfterSearchView.swift
//  CEats
//
//  Created by 유하은 on 2023/09/06.
//

import SwiftUI

struct AfterSearchView: View {
    // MARK: - properties
    @State var isFavorited: Bool = false
    @ObservedObject var restaurantsStore: RestaurantViewModel
    @Binding var data: FoodType?
    
    var heartImage: String {
        isFavorited ? "heart.fill" : "heart"
    }
    
    // MARK: - Views
    var body: some View {
        NavigationStack {
            // FoodType으로 먼저 분류 -> 분류된 목록에서 ForEach로 반복
            ForEach(restaurantsStore.filterFoodType){ store in
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 380, height: 300)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        .foregroundColor(.white)
                        .padding(2)
                        .shadow(radius: 3)
                    NavigationLink {
//                        RestaurantView(restaurant: $store)
                    } label: {
                        VStack {
                            ZStack {
                                AsyncImage(url: URL(string: "https://www.jungle.co.kr/image/90e4ffc149968a50c80cac37"))
                                    .frame(width: 360, height: 200)
                                    .cornerRadius(10)
                                
                                Image(systemName: heartImage)
                                    .background(
                                        Circle()
                                            .foregroundColor(.white)
                                            .frame(width: 40, height: 40)
                                    )
                                    .opacity(0.7)
                                    .foregroundColor(.red)
                                    .font(.title)
                                    .offset(x: 140, y: -60)
                                    .onTapGesture {
                                        isFavorited.toggle()
                                    }
                            }
                            HStack {
                                Text("\(store.name)")
                                    .font(.title2)
                                Spacer()
                                Text("최소 금액: \(store.minimumPrice)원")
                            }
                            HStack {
                                Text("⭐️ 평점 : \(store.scoreMessage)")
                                Text("배달비 : \(store.deliveryFee)원")
                                Spacer()
                            }
                        }
                        .padding()
                        .foregroundColor(.black)
                    }
                }
            }
        }
    }
}


struct AfterSearchView_Previews: PreviewProvider {
    static var previews: some View {
        AfterSearchView(restaurantsStore: RestaurantViewModel(), data: .constant(.korean))
    }
}
