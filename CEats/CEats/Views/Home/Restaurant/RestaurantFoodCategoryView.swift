//
//  RestaurantFoodCategoryView.swift
//  CEats
//
//  Created by gnksbm on 2023/09/05.
//

import SwiftUI

struct RestaurantFoodCategoryView: View {
    @Binding var categories: [String]
    @State var selected: String = ""
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(categories, id: \.self) { category in
                    Button(category) {
                        selected = category
                    }
                    .padding()
                    .font(.system(size: 26, weight: category == selected ? .bold : .thin))
                    .foregroundColor(.primary)
                }
            }
        }
        .scrollIndicators(.hidden)
        .onAppear {
            if !categories.isEmpty {
                selected = categories[0]
            }
        }
    }
}

struct RestaurantFoodCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantFoodCategoryView(categories: .constant(["테스트1", "테스트2", "테스트3", "테스트4"]))
    }
}
