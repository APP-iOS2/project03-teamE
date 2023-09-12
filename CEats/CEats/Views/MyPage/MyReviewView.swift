//
//  MyReviewView.swift
//  CEats
//
//  Created by 유하은 on 2023/09/12.
//

import SwiftUI

struct MyReviewView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    let review: Review
    
    var body: some View {
        VStack{
            VStack(alignment: .leading) {
                
                Text(review.writer)
                    .bold()
                HStack{
                    review.score.doubleToStarView
                    Spacer()
                    Text("\(review.createdDate)")
                        .font(.system(size:13))
                        .foregroundColor(.gray)
                }
            }
            Image(review.image ?? "soju")
                .resizable()
                .frame(width: .screenWidth*0.8 , height: .screenHeight*0.34)
            HStack{
                Text(review.contents)
                    .padding(10)
                Spacer()
            }
            HStack {
                ForEach(review.menus, id: \.name) { menu in
                    Text(menu.name)
                        .font(.footnote)
                        .foregroundColor(.white)
                        .padding(10)
                        .background(Color.cyan)
                        .cornerRadius(25)
                }
                Spacer()
            }
            .offset(x:5)
        }
        .padding(30)
    }
}

struct MyReviewVIew_Previews: PreviewProvider {
    static var previews: some View {
        MyReviewView(review: Review(writer: "김민지", score: 4.0, image: "kimchiSoup", contents: "맛있긴 함"))
            .environmentObject(UserViewModel())
    }
}
