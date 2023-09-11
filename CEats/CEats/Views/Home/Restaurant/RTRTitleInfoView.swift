//
//  RTRTitleInfoView.swift
//  CEats
//
//  Created by gnksbm on 2023/09/04.
//

import SwiftUI

struct RTRTitleInfoView: View {
    let restaurant: Restaurant
    
    var body: some View {
        VStack {
            Text(restaurant.name)
                .font(.system(size: 25, weight: .medium))
            NavigationLink {
                ReviewInfoView(restaurant: restaurant)
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
                
            }
        }
        .foregroundColor(.primary)
    }
}

struct RTRMinimalInfoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            RTRTitleInfoView(restaurant: .sampleData)
        }
    }
}
