//
//  ReviewDetail.swift
//  CEatsManager
//
//  Created by 박범수 on 2023/09/12.
//

import SwiftUI

struct ReviewDetail: View {
    var restaurant: Restaurant = Restaurant.sampleData
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                HStack {
                    VStack(alignment: .leading) {
                        Text("작성자 : 아이유")
                            .font(.system(size: 30, weight: .semibold))
                        
                        Text("⭐️⭐️⭐️⭐️⭐️")
                            .font(.system(size: 16, weight: .semibold))
                            .padding(.bottom)
                    }
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Text("삭제")
                            .foregroundColor(.red)
                            .padding(.trailing, 40)
                    }
                    
                }
                .border(.black)
                
                HStack {
                    //                    VStack(alignment: .leading) {
                    //                        Text("작성자 : 아이유")
                    //                            .font(.system(size: 30, weight: .semibold))
                    //
                    //                        Text("⭐️⭐️⭐️⭐️⭐️")
                    //                            .font(.system(size: 16, weight: .semibold))
                    //                            .padding(.bottom)
                    
                    AsyncImage(url: URL(string:  "https://www.thechooeok.com/common/img/default_profile.png")) { image in
                        image
                            .resizable()
                    }placeholder: {
                        Circle()
                            .foregroundColor(.secondary)
                    }
                    .frame(width: 400, height: 400)
                    
                    .padding(.trailing, 30)
                    
                    VStack(alignment: .leading) {
                        Text("구매 날짜 : 2023.09.01")
                        Text("리뷰 올린 날짜 : 2023.09.01")
                        Text("리뷰 내용 :  저 이래서 이랬고 맛있었어요. 아ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏ아아아아아아아아아")
                        Text("가게 이름")
                        Text("가게 전화번호")
                        Text("가게 위치")
                    }
                    .frame(width: 550, height: 550)
                    .font(.system(size: 30, weight: .regular))
                }
                .border(.black)
                
                Spacer()
                
            }
            .padding()
            .navigationTitle("멋쟁이 김치찌개")
        }
    }
}


struct ReviewDetail_Previews: PreviewProvider {
    static var previews: some View {
        ReviewDetail()
    }
}
