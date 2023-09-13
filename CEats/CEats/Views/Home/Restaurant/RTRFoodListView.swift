//
//  RTRFoodListView.swift
//  CEats
//
//  Created by gnksbm on 2023/09/05.
//

import SwiftUI

struct RTRFoodListView: View {
    let restaurant: Restaurant
    
    var body: some View {
        ForEach(restaurant.foodCategory, id: \.self) { category in
            VStack(alignment: .leading) {
                Text(category)
                    .padding(.top,20)
                    .font(.title2)
                    //.font(.system(size: 19, weight: .medium))
                Text("메뉴 사진은 연출된 이미지로 실제 조리된 음식과 다를 수 있습니다.")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                ForEach(restaurant.menus, id: \.name) { food in
                    NavigationLink {
                        AddCartView(restaurant: restaurant, food: food)
                    } label: {
                        RTRFoodCellView(food: food)
                    }
                    .toolbar(.hidden, for: .tabBar)
                    .foregroundColor(.primary)
                    Divider()
                }
            }
            .padding(.horizontal)
            .id(category)
        }
    }
}

struct RTRFoodListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            RTRFoodListView(restaurant: .sampleData)
        }
    }
}
