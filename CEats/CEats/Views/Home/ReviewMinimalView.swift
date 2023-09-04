//
//  ReviewMinimalView.swift
//  CEats
//
//  Created by gnksbm on 2023/09/04.
//

import SwiftUI

struct ReviewMinimalView: View {
    @Binding var review: SampleReview
    var body: some View {
        HStack {
            Image(systemName: "\(review.imageName)")
                .resizable()
                .aspectRatio(contentMode: .fit)
            VStack {
                Text("\(review.message)")
                starRating(rating: review.grade)
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
                } else if index == fullStarCount + 1 && hasHalfStar {
                    Image(systemName: "star.leadinghalf.filled")
                } else {
                    Image(systemName: "star")
                }
            }
        }
    }
}

struct ReviewMinimalView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewMinimalView(review: .constant(.sampleData))
    }
}
