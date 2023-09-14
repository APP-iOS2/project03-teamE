//
//  ReviewInfo.swift
//  CEatsManager
//
//  Created by 박범수 on 2023/09/12.
//

import SwiftUI

struct ReviewInfo: View {
    @EnvironmentObject private var userViewModel: UserViewModel
    @EnvironmentObject private var restaurantViewModel: RestaurantViewModel
    @State var review : Review
    @State var restaurant: Restaurant
    @State private var showingAlert: Bool = false
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                // Image("\(review.image)") 이미지 없는게 많아서 일단 Asset에 추가한 이미지 올렸습니다.
                //만약 이미지가 없으면 대체 이미지로 나타나게.
                if (review.image != nil) {
                    Image("review")
                        .resizable()
                        .frame(width: 400, height: 400)
                        .padding([.leading, .trailing], 20)
                } else {
                    Image(systemName: "x.square")
                        .resizable()
                        .frame(width: 400, height: 400)
                        .padding([.leading, .trailing], 20)
                }
                VStack(alignment: .leading) {
                    Spacer()
                    VStack(alignment: .leading) {
                        Spacer()
                        HStack {
                            VStack(alignment: .leading) {
                                Text("작성자 : \(review.writer)")
                                    .font(.system(size: 25, weight: .semibold))
                                    .bold()
                                
                                review.score.doubleToStarView
                                    .font(.system(size: 25, weight: .semibold))
                                    .padding(.horizontal, -6)
                            }
                            .padding(.top, 50)
                            Spacer()
                            Button {
                                showingAlert = true
                                print(restaurant.reviews)
                            } label: {
                                Text("삭제")
                                    .font(.system(size: 25, weight: .semibold))
                                    .foregroundColor(.red)
                                    .padding(.trailing, 40)
                            }
                            .padding(.top, 50)
                            .alert("선택하신 리뷰를 삭제하시겠습니까?", isPresented: $showingAlert) {
                                Button("뒤로가기", role: .cancel) {
                                    showingAlert = false
                                }
                                Button(role: .destructive) {
                                    restaurantViewModel.deleteReview(restaurant: &restaurant, review: review)
                                } label: {
                                    Text("삭제")
                                }
                            }
                        }
//                        Spacer()
                            .padding(.bottom, 10)
                        VStack(alignment: .leading) {
                            Text("구매 날짜 :         \(review.createdDate)")
                                .font(.system(size: 20, weight: .semibold))
                            
                            Text("리뷰 올린 날짜 : \(review.createdDate)")
                                .font(.system(size: 20, weight: .semibold))
                        }
                        .padding(.bottom)
                        Divider()
                        Spacer()
                        VStack(alignment: .leading) {
                            Text("리뷰 내용 : ")
                                .font(.system(size: 20, weight: .semibold))
                            Spacer()
                            Text("\(review.contents)")
                                .font(.system(size: 20, weight: .semibold))
                                .padding(.bottom, 100)
                            Spacer()
                        }
                    }
                    Spacer()
                }
                .frame(height: 450)
                .font(.system(size: 25, weight: .regular))
                .padding(.bottom, 80)
            }
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: 1)
                    .frame(height: 450)
                    .padding(.top, 10)
            )
        }
        .padding(.bottom, -50)
        .refreshable {
        }
    }
}


struct ReviewInfo_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ReviewInfo(review: Review(writer: "김민지", score: 4.0, image: "kimchi2", contents: "이 집 김치찌개는 정말 인정합니다. 계란말이가 더 맛있긴 하지만요~"), restaurant: Restaurant.sampleData)
                .environmentObject(UserViewModel())
        }
    }
}
