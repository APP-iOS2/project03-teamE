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
    @Binding var data: FoodType
    
    var filterFoodType: [Restaurant] {
        restaurantsStore.restaurants.filter { store in
            return store.foodType.contains(self.data)
        }
    }
    // filter된 배열에서 score를 가져다가 평균을 낸 값
    // filterFoodType은 배열임 -> 배열에 접근해서 값을 가지고 나오고, 거기서 평균내서 Return의 방식이 되는거겟지 ?
    // filterFoodType 안에 reviews안에 또 배열잇음.
    var averageScore: [[Double]] {
        let mollu = filterFoodType.map { store in
            let mollu3 = store.reviews.map { review in
                let mollu2 = review.score / Double(store.reviews.count)
                return mollu2
            }
            
            return mollu3
        }
        return mollu
    }
    
    var heartImage: String {
        isFavorited ? "heart.fill" : "heart"
    }
    
    // MARK: - Views
    var body: some View {
        NavigationStack {
            // FoodType으로 먼저 분류 -> 분류된 목록에서 ForEach로 반복
            ForEach(filterFoodType){ store in
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
                        RestaurantView()
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
                                Text("⭐️평점 : \(averageScore[0][0])")
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

struct RestaurantCardView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantCardView(restaurantsStore: RestaurantViewModel(), data: .constant(.korean))
    }
}
