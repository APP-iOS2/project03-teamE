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
                    VStack{
                        Button(category) {
                            selected = category
                        }
                        .padding()
                        .font(.system(size: 20, weight: category == selected ? .bold : .thin))
                        .foregroundColor(.primary)
                        
                        if selected == category {
                            Capsule()
                                .foregroundColor(.black)
                                .frame(height: 3)
                            
                        }
                        else {
                            Capsule()
                                .foregroundColor(.clear)
                                .frame(height:3)
                        }
                    }

                }
            
            }
            .overlay(Divider().offset(x:0,y:30))

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
