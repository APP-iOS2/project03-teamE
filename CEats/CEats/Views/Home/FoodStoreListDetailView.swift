//
//  FoodStoreListDetailView.swift
//  CEats
//
//  Created by Jisoo HAM on 2023/09/04.
//

import SwiftUI

struct FoodStoreListDetailView: View {
    //삼항연산자
    
    //MARK: - View
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 20) {
                ForEach(FoodType.allCases, id: \.self) { food in
                    Button {
                        
                    } label: {
                        VStack {
                            Image("\(food)")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                                .cornerRadius(10)
                            Text("\(food.rawValue)")
                        }
                    }
                }
            }
            .padding()
        }
    }
}

struct FoodStoreListDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FoodStoreListDetailView()
    }
}
