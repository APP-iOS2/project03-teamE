//
//  ReviewMinimalView.swift
//  CEats
//
//  Created by gnksbm on 2023/09/04.
//

import SwiftUI

struct ReviewMinimalView: View {
    let review: Review
    
    var body: some View {
        HStack {
            Image(review.image ?? "korean")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.trailing, 10)
            VStack(alignment: .leading) {
                Text("\(review.contents)")
                    .frame(maxWidth: .screenWidth * 0.3)
                    .font(.system(size:15))
                Spacer()
                review.score.doubleToStarView
            }
        }
    }
}

struct ReviewMinimalView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewMinimalView(review: Review(writer: "김멋사", score: 4.0, contents: "맛있긴 함"))
    }
}
