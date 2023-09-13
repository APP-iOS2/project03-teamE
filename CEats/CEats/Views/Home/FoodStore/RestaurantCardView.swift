//
//  RestaurantCardView.swift
//  CEats
//
//  Created by 장여훈 on 2023/09/04.
//

import SwiftUI

struct RestaurantCardView: View {
    // MARK: - properties
    @EnvironmentObject var restaurantsStore: RestaurantViewModel
    @EnvironmentObject var userViewModel: UserViewModel
    @Binding var selectedFoodType: FoodType?
    
    
    // MARK: - Views
    var body: some View {
        NavigationStack {
            // FoodType으로 먼저 분류 -> 분류된 목록에서 ForEach로 반복
            ForEach(restaurantsStore.filterFoodTypes(selectedFoodType)){ store in
                NavigationLink { //
                    RTRView(restaurant: store)
                } label: {
                    if store.isOpen {
                        VStack {
                            ZStack {
                                Image(store.mainImage.first ?? "restaurant3")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: .screenWidth * 0.92, height: .screenHeight * 0.23)
                                    .cornerRadius(10)
                                
                                Button {
                                    
                                    //                                restaurantsStore.user.favoriteRestaurant.append(store)
                                } label: {
                                    Image(systemName: userViewModel.getLikeImageName(restaurant: store))
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
                                    
                                }
                                .onTapGesture {
                                    userViewModel.likeButtonTapped(restaurant: store)
                                }
                                .buttonStyle(.plain)
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
                    } else {
                        ZStack {
                            VStack {
                                ZStack {
                                    Image(store.mainImage.first ?? "restaurant3")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: .screenWidth * 0.92, height: .screenHeight * 0.23)
                                        .overlay{
                                            Color.black
                                                .opacity(0.5)
                                        }
                                        .cornerRadius(10)
                                    
                                    Button {
                                        
                                        //                                restaurantsStore.user.favoriteRestaurant.append(store)
                                    } label: {
                                        
                                        Image(systemName: userViewModel.getLikeImageName(restaurant: store))
                                            .font(.system(size:20))
                                            .background(
                                                Circle()
                                                    .foregroundColor(.white)
                                                    .frame(width: 30,height: 30)
                                            )
                                            .foregroundColor(.red)
                                            .font(.title)
                                            .offset(x: .screenWidth/2.6, y: -(.screenHeight/13))
                                        
                                    }
                                    .onTapGesture {
                                        userViewModel.likeButtonTapped(restaurant: store)
                                    }
                                    .buttonStyle(.plain)
                                }
                                
                                VStack{
                                    HStack{
                                        Text("\(store.name)")
                                            .bold()
                                            .padding(.bottom,0.1)
                                        Spacer()
                                        Text("35~45 분")
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
                            .opacity(0.8)
                            
                            Text("영업 준비중")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(.white)
                                .padding(.bottom, 50)
                        }
                    }
                }
            }
        }
    }
}

struct RestaurantCardView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantCardView(selectedFoodType: .constant(.korean))
            .environmentObject(RestaurantViewModel())
            .environmentObject(UserViewModel())
    }
}
