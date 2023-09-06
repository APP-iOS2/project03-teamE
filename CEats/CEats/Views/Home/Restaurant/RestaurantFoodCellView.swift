//
//  RestaurantFoodCellView.swift
//  CEats
//
//  Created by gnksbm on 2023/09/05.
//

import SwiftUI

struct RestaurantFoodCellView: View {
    let food: Food
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(food.name)")
                    .font(.system(size: 20, weight: .bold))
                Text("\(food.priceToString)원")
                    .font(.system(size: 18))
                Text("\(food.description)")
                    .font(.system(size: 15))
                    .foregroundColor(.gray)
                    .padding(.vertical, 5)
            }
            Spacer()
            Image(food.image ?? "")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 150)
        }
    }
}

struct RestaurantFoodCellView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantFoodCellView(food: .sampleData)
    }
}
