//
//  RestaurantFoodCellView.swift
//  CEats
//
//  Created by gnksbm on 2023/09/05.
//

import SwiftUI

struct RestaurantFoodCellView: View {
    @Binding var food: Food
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(food.name)")
                    .font(.system(size: 30, weight: .bold))
                    .padding(.vertical, 5)
                Text("\(food.priceToString)원")
                    .font(.system(size: 30))
                Text("\(food.description)")
                    .font(.system(size: 24))
                    .foregroundColor(.gray)
                    .padding(.vertical, 5)
            }
            Spacer()
            Image(food.image ?? "")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}

struct RestaurantFoodCellView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantFoodCellView(food: .constant(.sampleData))
    }
}
