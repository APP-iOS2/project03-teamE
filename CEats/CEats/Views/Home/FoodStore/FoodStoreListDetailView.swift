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
    @Binding var data: FoodType?
    @State private var isClickedCategory: Bool = false
    
    //MARK: - View
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 20) {
                ForEach(FoodType.allCases, id: \.self) { food in
                    Button {
                        data = food
                        isClickedCategory.toggle()
                        print("\(data)")
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
                                        .foregroundColor(data == food ? .blue : .clear)
                                )
                            Text("\(food.rawValue)")
                                .font(.system(size: 20, weight: data == food ? .bold : .thin))
                                .foregroundColor(.black)
                            
                        }
                    }
                    .overlay {
                        Rectangle()
                            .frame(width: 80, height: 7)
                            .foregroundColor(data == food ? .blue : .clear)
                            .offset(y: .screenWidth * 0.16 )
                    }
                }
            }.frame(height: 125)
        }
    }
}

struct FoodStoreListDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FoodStoreListDetailView(restaurantsStore: RestaurantViewModel(), data: .constant(.korean))
    }
}
