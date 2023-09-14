//
//  MyView.swift
//  CEats
//
//  Created by 박범수 on 2023/09/04.
//

import SwiftUI


struct MyView: View {
    @EnvironmentObject private var tabViewModel: TabViewModel
    @EnvironmentObject private var userViewModel: UserViewModel
    @EnvironmentObject private var restaurantViewModel: RestaurantViewModel
    
    @State private var isOpenMapSheet: Bool = false
    
    var body: some View {
        NavigationStack {
            Text("\(userViewModel.user.username)")// 내 이름
                .font(.largeTitle)
                .padding(5)
            Text("\(userViewModel.user.phoneNumber)")// 내 전화번호
            
            HStack(alignment: .center ,spacing: 10) {
                VStack {
                    Text("\(userViewModel.user.reviews.count)")
                        .font(.largeTitle)
                        .bold()
                    Text("내가 남긴리뷰")
                        .font(.footnote)
                }
                .padding()
                VStack(alignment: .center) {
                    Text("0")
                        .font(.largeTitle)
                        .bold()
                    Text("도움이 됐어요")
                        .font(.footnote)
                }
                .padding()
                VStack {
                    Text("\(userViewModel.user.favoriteRestaurant.count)")
                        .font(.largeTitle)
                        .bold()
                    Text("즐겨찾기")
                        .font(.footnote)
                }
                .padding()
            }
            // 자세히보기 버튼
            NavigationLink {
                MyInfoView()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .frame(width: 320, height: 50)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.cEatsBlue, lineWidth: 1)
                        )
                        .foregroundColor(.white)
                        .padding(2)
                    Text("자세히 보기")
                        .bold()
                        .foregroundColor(.cEatsBlue)
                }
            }
            Image("advertisement")
                .resizable()
                .aspectRatio(contentMode: .fit)
            VStack {
                Button {
                    isOpenMapSheet = true
                } label: {
                    HStack {
                        Image(systemName: "list.bullet.rectangle.portrait")
                            .imageScale(.large)
                            .padding()
                        Text("주소 관리")
                            .frame(height: 60)
                        Spacer()
                    }
                }
                NavigationLink {
                    FavoriteView()
                } label: {
                    HStack {
                        Image(systemName: "heart")
                            .imageScale(.large)
                            .padding()
                        Text("즐겨찾기")
                            .frame(height: 60)
                        Spacer()
                    }
                }
                NavigationLink {
                    CouponView(coupons: userViewModel.user.coupons)
                } label: {
                    HStack {
                        Image(systemName: "tag")
                            .imageScale(.large)
                            .padding()
                        Text("할인 쿠폰")
                            .frame(height: 60)
                        if userViewModel.user.coupons.count > 0 {
                            Image(systemName: "\(userViewModel.user.coupons.count).circle.fill")
                                .foregroundColor(.cEatsBlue)
                        }
                        Spacer()
                    }
                }
                
                HStack {
                    Image(systemName: "tag")
                        .imageScale(.large)
                        .padding()
                    Text("CEats 머니")
                        .frame(height: 60)
                    Spacer()
                    Spacer()
                    Text("\(userViewModel.user.cEatsMoney)원")
                    Spacer()
                }
            }
            .foregroundColor(.primary)
            .listStyle(.plain)
        }
        .onAppear {
            userViewModel.fetchUser {
                print("잘가져와짐")
                print(userViewModel.user.favoriteRestaurant.count)
            }
        }
        
        .sheet(isPresented: $isOpenMapSheet) {
            MapHomeView(isOpenMapSheet: $isOpenMapSheet)
        }
    }
}


struct MyView_Previews: PreviewProvider {
    @State private static var tabIndex: Int = 4
    static var previews: some View {
        MyView()
            .environmentObject(UserViewModel())
            .environmentObject(RestaurantViewModel())
            .environmentObject(TabViewModel())
    }
}
