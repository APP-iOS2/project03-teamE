//
//  RestaurantCardView.swift
//  CEats
//
//  Created by 장여훈 on 2023/09/04.
//

import SwiftUI

struct RestaurantCardView: View {
    
    // MARK: - properties
    @State var isFavorited: Bool = false
    @ObservedObject var restaurantsStore: RestaurantViewModel
    
    var heartImage: String {
        isFavorited ? "heart.fill" : "heart"
    }
    
    // MARK: - Views
    var body: some View {
        NavigationStack {
            ForEach(restaurantsStore.restaurants){ store in
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
                        Text("최소 금액: \(store.minimumPrice)")
                    }
                    HStack {
                        Text("⭐️별점(총별점수) • 거리 • 배달비")
                        Spacer()
                    }
                }
            }
            
            .padding()
            .foregroundColor(.black)
        }
        
    }
}

struct RestaurantCardView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantCardView(restaurantsStore: RestaurantViewModel())
    }
}
