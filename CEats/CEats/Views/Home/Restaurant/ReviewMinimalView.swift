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
                    .font(.system(size:15))
                Spacer()
                starRating(rating: review.score)
            }
        }
    }
    
    func starRating(rating: Double) -> some View {
        let fullStarCount = Int(rating)
        let hasHalfStar = rating.truncatingRemainder(dividingBy: 1) >= 0.5
        
        return HStack {
            ForEach(1...5, id: \.self) { index in
                if index <= fullStarCount {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                } else if index == fullStarCount + 1 && hasHalfStar {
                    Image(systemName: "star.leadinghalf.filled")
                        .foregroundColor(.yellow)
                } else {
                    Image(systemName: "star.fill")
                        .foregroundColor(.gray)
                }
            }
        }
    }
}

struct ReviewMinimalView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewMinimalView(review: Review(writer: "김멋사", score: 4.0, contents: "맛있긴 함"))
    }
}
