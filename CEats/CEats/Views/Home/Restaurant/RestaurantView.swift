//
//  RestaurantView.swift
//  CEats
//
//  Created by gnksbm on 2023/09/04.
//

import SwiftUI

struct SampleReview {
    let id = UUID()
    let imageName: String
    let message: String
    let grade: Double
}

extension SampleReview {
    static let sampleData: SampleReview = .init(imageName: "photo", message: "리뷰냠냠ㅋ", grade: 4.5)
    static let sampleDatas: [SampleReview] = [
        .init(imageName: "photo", message: "리뷰냠냠ㅋ", grade: 4.5),
        .init(imageName: "photo", message: "리뷰냠냠ㅋ", grade: 4.5),
        .init(imageName: "photo", message: "리뷰냠냠ㅋ", grade: 4.5),
    ]
}

struct RestaurantView: View {
    @State private var sampleImageNames: [String] = [
        "photo",
        "photo",
        "photo",
    ]
    @State private var sampleReview = SampleReview.sampleDatas
    
    var body: some View {
        ScrollView {
            ZStack {
                VStack {
                    RestaurantTitleImageView(imageNamss: $sampleImageNames)
                    .frame(width: .screenWidth, height: .screenHeight / 3)
                    .background(.blue)
                    VStack {
                        RestaurantSubInfoView()
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach($sampleReview, id: \.id) { $review in
                                    ReviewMinimalView(review: $review)
                                        .frame(width: .screenWidth * 0.7, height: .screenHeight / 20)
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                    .offset(y: .screenHeight / 9)
                }
                RestaurantTitleInfoView()
                    .frame(width: .screenWidth * 0.85, height: .screenHeight / 6)
                    .background(.white)
                    .clipped()
                    .shadow(radius: 5)
                    .offset(y: .screenHeight / 9)
            }
        }
        .ignoresSafeArea()
    }
}

struct RestaurantView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            RestaurantView()
        }
    }
}
