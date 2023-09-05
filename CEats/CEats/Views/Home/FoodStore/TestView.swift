//
//  TestView.swift
//  CEats
//
//  Created by Jisoo HAM on 2023/09/05.
//

import SwiftUI

struct TestView: View {
    
    @State var isFavorited: Bool = false
    @ObservedObject var restaurantsStore: RestaurantViewModel
    @Binding var data: FoodType
    
    var heartImage: String {
        isFavorited ? "heart.fill" : "heart"
    }
    
    var body: some View {
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
                Text("\(restaurantsStore.restaurants[0].name)")
                    .font(.title2)
                Spacer()
                Text("최소 금액: \(restaurantsStore.restaurants[0].minimumPrice)")
            }
            HStack {
                Text("⭐️별점(총별점수) • 거리 • 배달비")
                Spacer()
            }
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView(restaurantsStore: RestaurantViewModel(), data: .constant(.korean))
    }
}
