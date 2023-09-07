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
    @EnvironmentObject var restaurantsStore: RestaurantViewModel
    @State var data: String
    
    var heartImage: String {
        isFavorited ? "heart.fill" : "heart"
    }
    
    // MARK: - Views
    var body: some View {
        NavigationStack {
            // FoodType으로 먼저 분류 -> 분류된 목록에서 ForEach로 반복
            ScrollView {
                ForEach(restaurantsStore.filterFoodName(data)){ store in
                    NavigationLink {
                        RTRView(restaurant: store)
                    } label: {
                        VStack {
                            ZStack {
                                AsyncImage(url: URL(string: "https://www.jungle.co.kr/image/90e4ffc149968a50c80cac37"))
                                    .frame(width: .screenWidth * 0.92, height: .screenHeight * 0.23)
                                    .cornerRadius(10)
                                
                                Image(systemName: heartImage)
                                    .font(.system(size:20))
                                    .background(
                                        Circle()
                                            .foregroundColor(.white)
                                            .frame(width: 30,height: 30)
                                            .opacity(0.6)
                                    )
                                    .foregroundColor(.red)
                                    .font(.title)
                                    .offset(x: .screenWidth/2.6, y: -(.screenHeight/13))
                                    .onTapGesture {
                                        isFavorited.toggle()
                                    }
                            }
                            
                            VStack{
                                HStack{
                                    Text("\(store.name)")
                                        .bold()
                                        .padding(.bottom,0.1)
                                    Spacer()
                                    Text("35~45 분") //배달시간 프로퍼티가 업서요~ 필요할거 같아요 이게 오더에 있어요.
                                        .foregroundColor(.gray)
                                        .font(.subheadline)
                                }
                                HStack{
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.yellow)
                                    Text("\(store.scoreMessage)")
                                    Text("(\(store.reviews.count))")
                                    Text("1.5km")
                                    Text("-")
                                    Text("배달비 : \(store.deliveryFee)원")
                                    Spacer()
                                }
                                .font(.footnote)
                                .foregroundColor(.secondary)
                                
                            }
                            .padding()
                            .foregroundColor(.black)
                        }
                    }
                }
            }
        }
    }
}

struct AfterSearchView_Previews: PreviewProvider {
    static var previews: some View {
        AfterSearchView(data: "김치찌개")
            .environmentObject(RestaurantViewModel())
    }
}
