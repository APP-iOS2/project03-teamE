//
//  FoodStoreListDetailView.swift
//  CEats
//
//  Created by Jisoo HAM on 2023/09/04.
//

import SwiftUI

struct FoodStoreListDetailView: View {
    // MARK: - properties
    @ObservedObject var restaurantsStore: RestaurantViewModel
    @Binding var selectedFoodType: FoodType?
    @State private var isClickedCategory: Bool = false
    
    // MARK: - View
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 20) {
                ForEach(FoodType.allCases, id: \.self) { food in
                    Button {
                        selectedFoodType = food
                        isClickedCategory.toggle()
                    } label: {
                        VStack {
                            Image("\(food)")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                                .background(
                                    Circle()
                                        .stroke(lineWidth: 3)
                                        .foregroundColor(selectedFoodType == food ? .blue : .clear)
                                )
                            Text("\(food.rawValue)")
                                .font(.system(size: 16, weight: selectedFoodType == food ? .bold : .thin))
                                .foregroundColor(selectedFoodType == food ? .blue : .black)
                            
                        }
                    }
                    .overlay {
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 80, height: 4)
                            .foregroundColor(selectedFoodType == food ? .blue : .clear)
                            .offset(y: .screenWidth * 0.16 )
                    }
                }
            }
            .frame(height: 120)
            .padding()
        }
    }
}

struct FoodStoreListDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FoodStoreListDetailView(restaurantsStore: RestaurantViewModel(), selectedFoodType: .constant(.korean))
    }
}
