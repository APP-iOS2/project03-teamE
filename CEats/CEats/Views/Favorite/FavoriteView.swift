//
//  FavoriteView.swift
//  CEats
//
//  Created by 박범수 on 2023/09/04.
//

import SwiftUI

struct FavoriteView: View {
    // MARK: - Properties
    @Binding var tabIndex: Int
    @ObservedObject var favoriteStore: RestaurantViewModel
    @State private var isEdited: Bool = false
    @State private var isPicked: Bool = false
    private var isFavoriteEmpty: Bool {
        favoriteStore.user.favoriteRestaurant.isEmpty
    }
    // MARK: - Views
    var body: some View {
        VStack(alignment: .leading){
            NavigationStack {
                // 유저.Favorite배열.count 해서 값 받아올 예정
                // 왼쪽에 붙었으면 좋겠는데 안붙.. 왜?
                HStack {
                    Text("총 \(favoriteStore.user.favoriteRestaurant.count)개")
                        .font(.title3)
                        .bold()
                        .padding()
                    
                    Spacer()
                }
                if isFavoriteEmpty {
                    VStack {
                        Image("isFavorite")
                            .resizable()
                            .frame(width: 350, height: 400)
                            .cornerRadius(10)
                            .padding()
                        
                        Button {
                            tabIndex = 0
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
                            ForEach(favoriteStore.user.favoriteRestaurant) { store in
                                NavigationLink {
                                    RTRView(restaurant: store)
                                } label: {
                                    VStack{
                                        HStack {
                                            // 로고 - 프레임 크기가 비슷한 이미지를 가져와야함
                                            AsyncImage(url: URL(string: "https://is2-ssl.mzstatic.com/image/thumb/Purple115/v4/a1/ab/24/a1ab2400-647c-53f1-629d-1000f10e8e6e/source/512x512bb.jpg")) { image in
                                                image
                                                    .resizable()
                                                    .scaledToFill()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(width: .screenWidth * 0.44, height: .screenHeight * 0.17)
                                                
                                            }placeholder: {
                                                ProgressView()
                                            }
                                            .frame(width: .screenWidth * 0.35, height: .screenHeight * 0.13)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                            //라운드 된건지 확인하기 위함
                                            .padding(.bottom, 20)
                                            
                                            VStack(alignment: .leading, spacing: 10) {
                                                Spacer()
                                                Text(store.name)
                                                    .font(.system(size:17))
                                                    .bold()
                                                    .padding(.top,-20)
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
                                            
                                            //얘도 결국 하나 누르면 다 눌림.
                                            Button {
                                                //                                                print("btn Tap favorite")
                                                if !isPicked {
                                                    isPicked.toggle()
                                                    favoriteStore.removeRestaurant(restaurant: store)
                                                }
                                                isPicked.toggle()
                                            } label: {
                                                Text("삭제")
                                                    .background(Color.red)
                                                    .foregroundColor(.white)
                                                    .padding()
                                            }
                                        }
                                        //                                        .padding(.leading, -20)
                                        
                                        Divider()
                                            .padding(.bottom,20)
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
                            //                            Button {
                            //                                isEdited.toggle()
                            //                            } label: {
                            //                                Text(isEdited ? "취소" : "수정")
                            //                            }
                            //
                        }
                    }
                }
            }
        }
    }
    //    func removeFavorite() {
    //        if !isPicked {
    //            isPicked.toggle()
    //            favoriteStore.removeRestaurant(restaurant: store)
    //        }
    //    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView(tabIndex: .constant(2), favoriteStore: RestaurantViewModel())
    }
}
