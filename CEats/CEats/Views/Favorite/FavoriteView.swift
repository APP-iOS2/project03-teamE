//
//  FavoriteView.swift
//  CEats
//
//  Created by 박범수 on 2023/09/04.
//

import SwiftUI

struct FavoriteView: View {
    // MARK: - Properties
    @ObservedObject var favoriteStore: RestaurantViewModel
    @State private var isEdited: Bool = false
    @State private var isPicked: Bool = false
    private var isFavoriteEmpty: Bool {
        favoriteStore.restaurants.isEmpty
    }
    // MARK: - Views
    var body: some View {
        VStack(alignment: .leading){
            NavigationStack {
                // 유저.Favorite배열.count 해서 값 받아올 예정
                // 왼쪽에 붙었으면 좋겠는데 안붙.. 왜?
                Text("총 N개")
                    .font(.title3)
                    .bold()
                
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
                                    // RTRView로
                                } label: {
                                    VStack{
                                        HStack {
                                            // 로고 - 프레임 크기가 비슷한 이미지를 가져와야함
                                            AsyncImage(url: URL(string: "https://modo-phinf.pstatic.net/20180801_18/1533094943595JAukT_PNG/mosahFjNCA.png?type=w1100")) { image in
                                                image
                                                    .resizable()
                                                    .frame(width: .screenWidth * 0.44, height: .screenHeight * 0.17)
                                                    .scaledToFill()
                                                    .aspectRatio(contentMode: .fit)
                                                
                                            }placeholder: {
                                                ProgressView()
                                            }
                                            .frame(width: .screenWidth * 0.35, height: .screenHeight * 0.13)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                            //라운드 된건지 확인하기 위함
                                            .background(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(Color.black, lineWidth: 1)
                                            )
                                            .padding(.bottom, 10)
                                            
                                            VStack(alignment: .leading, spacing: 10) {
                                                Spacer()
                                                Text(store.name)
                                                    .font(.title3)
                                                    .bold()
                                                Text("⭐️ \(store.scoreMessage) (\(store.reviews.count))")
                                                    .font(.subheadline)
                                                    .bold()
                                                HStack{
                                                    Text("0.5 km • 35~45 분 •")
                                                    Text("배달비 \(store.deliveryFee)원")
                                                }
                                                .font(.caption)
                                                .foregroundColor(.gray)
                                                
                                                Spacer()
                                            }
                                            .padding(.leading, 10)
                                            
                                            //얘도 결국 하나 누르면 다 눌림..
                                            if isEdited {
                                                Button {
                                                    isPicked.toggle()
                                                } label: {
                                                    Image(systemName: isPicked ? "checkmark.circle.fill" : "circle")
                                                }
                                            }
                                            

                                        }
//                                        .padding(.leading, -20)
                                        
                                        Divider()
                                    }
                                    .foregroundColor(.black)
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
