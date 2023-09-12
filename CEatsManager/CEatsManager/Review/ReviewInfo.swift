//
//  ReviewInfo.swift
//  CEatsManager
//
//  Created by 박범수 on 2023/09/12.
//

import SwiftUI

struct ReviewInfo: View {
    @EnvironmentObject private var userViewModel: UserViewModel
    @State var review : Review
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading) {
                    Text("작성자 : \(review.writer)")
                        .font(.system(size: 35, weight: .semibold))
                        .bold()
                    
                    review.score.doubleToStarView
                        .font(.system(size: 35, weight: .semibold))
                        .padding(.bottom)
                    
                }
                Spacer()
                
                Button {
                    
                } label: {
                    Text("삭제")
                        .font(.system(size: 25, weight: .semibold))
                        .foregroundColor(.red)
                        .padding(.trailing, 30)
                }
                
            }
            .padding(.bottom, -40)
            
            HStack {
                Image("review")
                    .resizable()
                    .frame(width: 400, height: 400)
                    .padding(.trailing, 30)
                
                VStack(alignment: .leading) {
                    Divider()
                    Text("구매 날짜 : \(review.createdDate)")
                    Text("리뷰 올린 날짜 : \(review.createdDate)")
                    Divider()
                    
                    Text("리뷰 내용 : \n\(review.contents)")
                    
                }
                .frame(height: 550)
                .font(.system(size: 30, weight: .regular))
            }
        }
    }
}


struct ReviewInfo_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ReviewInfo(review: Review(writer: "김민지", score: 4.0, image: "kimchi2", contents: "이 집 김치찌개는 정말 인정합니다. 계란말이가 더 맛있긴 하지만요~"))
                .environmentObject(UserViewModel())
        }
    }
}
