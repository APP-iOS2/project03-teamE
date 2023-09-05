//
//  RestaurantTitleInfoView.swift
//  CEats
//
//  Created by gnksbm on 2023/09/04.
//

import SwiftUI

struct RestaurantTitleInfoView: View {
    @State private var sampleTitle = "대한냉면"
    @State private var sampleGrade = 4.9
    @State private var sampleReviewCount = 60
    @Binding var restaurant: Restaurant
    
    var body: some View {
        VStack {
            Text(restaurant.name)
                .font(.system(size: 25, weight: .medium))
            NavigationLink {
                ReviewInfoView()
            } label: {
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text("\(restaurant.scoreMessage)")
                    Text("\(restaurant.reviews.count)")
                        .padding(.leading,10)
                    Image(systemName: "chevron.forward")
                }
                .font(.footnote)
                .foregroundColor(.primary)
            }
        }
    }
}

struct RestaurantMinimalInfoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            RestaurantTitleInfoView(restaurant: .constant(.sampleData))
        }
    }
}
