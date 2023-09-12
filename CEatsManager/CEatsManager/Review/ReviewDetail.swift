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
            HStack {
                Text("가게 전화번호 : 02-111-1111")
                Text("가게 위치 : ")
                Spacer()
            }
            .font(.system(size: 30))
            .padding(.horizontal)
            
            VStack(alignment: .leading) {
                HStack {
                    VStack(alignment: .leading) {
                        Text("작성자 : 아이유")
                            .font(.title)
                            .bold()
                        
                        Text("⭐️⭐️⭐️⭐️⭐️")
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
                        Divider()
                        
                        Text("구매 날짜 : 2023.09.01")
                        Text("리뷰 올린 날짜 : 2023.09.01")
                        Divider()
                        
                        Text("리뷰 내용 : \n저 이래서 이랬고 맛있었어요. 아ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏ아아아아아아아아아")
                        
                    }
                    .frame(height: 550)
                    .font(.system(size: 30, weight: .regular))
                }
                
                
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: 1)
            )
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
