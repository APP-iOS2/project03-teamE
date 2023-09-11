//
//  RTRFoodCategoryView.swift
//  CEats
//
//  Created by gnksbm on 2023/09/05.
//

import SwiftUI

struct RTRFoodCategoryView: View {
    let categories: [String]
    
    @Binding var selected: String
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(categories, id: \.self) { category in
                    VStack {
                        Button {
                            selected = category
                        } label: {
                            Text("\(category)")
                                .frame(minWidth: .screenWidth / 3)
                        }
                        .font(.system(size: 17, weight: category == selected ? .bold : .thin))
                        .foregroundColor(.primary)
                        if selected == category {
                            Capsule()
                                .foregroundColor(.black)
                                .frame(height: 3)
                            
                        } else {
                            Capsule()
                                .foregroundColor(.clear)
                                .frame(height:3)
                        }
                    }
                }
            }
            .overlay(Divider().offset(x:0,y:30))
        }
//        .onAppear {
//            if !categories.isEmpty {
//                selected = categories[0]
//            }
//        }
    }
}

struct RTRFoodCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        RTRFoodCategoryView(categories: ["테스트1", "테스트2", "테스트3", "테스트4"], selected: .constant(""))
    }
}
