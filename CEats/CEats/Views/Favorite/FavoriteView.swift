//
//  FavoriteView.swift
//  CEats
//
//  Created by 박범수 on 2023/09/04.
//

import SwiftUI

struct FavoriteView: View {
    // MARK: - Properties
    @EnvironmentObject private var tabViewModel: TabViewModel
    @EnvironmentObject private var favoriteStore: RestaurantViewModel
    @EnvironmentObject private var userViewModel: UserViewModel
    @State private var isEdited: Bool = false
    @State private var progress: CGFloat = 0.0
    @State private var isAnimating = false
    
    private var isFavoriteEmpty: Bool {
        userViewModel.user.favoriteRestaurant.isEmpty
    }
    
    // MARK: - Views
    var body: some View {
        VStack(alignment: .leading) {
            NavigationStack {
                HStack {
                    Text("총 \(userViewModel.user.favoriteRestaurant.count)개")
                        .font(.title3)
                        .bold()
                        .padding()
                    
                    Spacer()
                }
                if isFavoriteEmpty {
                    VStack(spacing: 50) {
                        VStack {
                            Text("즐겨찾는 맛집이 없습니다.")
                            Text("좋아하는 맛집에 \u{2665}를 눌러주세요.")
                        }
                        Image("FavoriteEx")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding()
                        
                        Button {
                            do { withAnimation(.easeOut(duration: 0.1)) {
                                self.isAnimating.toggle()
                                self.progress = self.isAnimating ? 1 : 0
                            }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                    tabViewModel.tabIndex = 0
                                    self.isAnimating.toggle()
                                    self.progress = 0
                                }
                            }
                        } label: {
                            ZStack(alignment: .leading) {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 2)
                                    .frame(width: 180, height: 50)
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.gray)
                                    .frame(width: 180 * progress, height: 50)
                                    .animation(.linear(duration: 0.3), value: isAnimating)
                                Text("쿠팡이츠 맛집 구경가기")
                                    .foregroundColor(.primary)
                                    .frame(width: 180, height: 50)
                            }
                        }
                    }
                } else {
                    ScrollView {
                        VStack {
                            Spacer()
                            .frame(maxWidth: .infinity, maxHeight: 10)
                            .background(Color.veryLightGray)
                            .opacity(0.6)
                            .padding(.bottom)
                            ForEach(userViewModel.user.favoriteRestaurant) { store in
                                NavigationLink {
                                    RTRView(restaurant: store)
                                } label: {
                                    VStack{
                                        HStack {
                                            Image(store.mainImage.first ?? "kimchiSoup")
                                                .resizable()
                                                .scaledToFill()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: .screenWidth * 0.44, height: .screenHeight * 0.17)
                                            
                                                .frame(width: .screenWidth * 0.35, height: .screenHeight * 0.13)
                                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                                .padding(.bottom, 20)
                                            
                                            VStack(alignment: .leading, spacing: 10) {
                                                Spacer()
                                                HStack {
                                                    Text(store.name)
                                                        .font(.system(size:17))
                                                        .bold()
                                                        .padding(.top,-20)
                                                    Spacer()
                                                    if isEdited {
                                                        Button {
                                                            userViewModel.likeButtonTapped(restaurant: store)
                                                            userViewModel.updateFavoriteRTR(user: userViewModel.user)
                                                        } label: {
                                                            Text("삭제")
                                                                .font(.system(size: 12))
                                                                .padding([.all], 5)
                                                                .background(Color.red)
                                                                .foregroundStyle(.background)
                                                                .cornerRadius(5)
                                                            
                                                        }
                                                        .padding(.top, -20)
                                                        Spacer()
                                                    }
                                                }
                                                HStack{
                                                    Image(systemName: "star.fill")
                                                        .foregroundColor(.yellow)
                                                    Text("\(store.scoreMessage) (\(store.reviews.count))")
                                                }
                                                .padding(.bottom,-5)
                                                .font(.system(size:14))
                                                HStack{
                                                    Text("0.5 km • 35~45 분 •")
                                                    Text("배달비 \(store.deliveryFee)원")
                                                }
                                                .font(.caption)
                                                .foregroundColor(.gray)
                                                
                                                Spacer()
                                            }
                                            .padding(.leading, 10)
                                        }
                                        .padding(.leading, 20)
                                        
                                        Divider()
                                            .padding(.bottom,20)
                                    }
                                    .foregroundColor(.primary)
                                }
                            }
                        }
                    }
                    .navigationTitle("즐겨찾기")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem {
                            Button {
                                isEdited.toggle()
                            } label: {
                                Text(isEdited ? "취소" : "수정")
                                    .foregroundColor(Color.cEatsBlue)
                            }
                        }
                    }
                }
            }
        }
        .padding(.bottom, 50)
        .onAppear{
            userViewModel.fetchUser {
            }
        }
        .onChange(of: tabViewModel.tabIndex) { newValue in
            isEdited = false
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
            .environmentObject(RestaurantViewModel())
            .environmentObject(UserViewModel())
            .environmentObject(TabViewModel())
    }
}
