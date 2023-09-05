//
//  RestaurantTitleImageView.swift
//  CEats
//
//  Created by gnksbm on 2023/09/04.
//

import SwiftUI

struct RestaurantTitleImageView: View {
    @Binding var imageNamss: [String]
    @State private var selectedIndex = 0
    var totalCount: Int {
        return imageNamss.count
    }
    var body: some View {
        ZStack {
            TabView(selection: $selectedIndex) {
                ForEach(Array(zip(imageNamss, imageNamss.indices)), id: \.1) { imgName, index in
                    Image(systemName: imgName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
            Text("\(selectedIndex + 1) / \(totalCount)")
                .padding(.vertical, 5)
                .padding(.horizontal)
                .font(.caption)
                .foregroundColor(.white)
                .background(Color.secondary)
                .cornerRadius(.greatestFiniteMagnitude)
                .offset(x: -.screenWidth / 3, y: .screenHeight / 17)
            
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct RestaurantTitleImageView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantTitleImageView(imageNamss: .constant([
            "photo",
            "photo",
            "photo",
        ]))
    }
}
