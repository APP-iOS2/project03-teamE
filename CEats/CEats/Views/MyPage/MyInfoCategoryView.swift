//
//  MyInfoCategoryView.swift
//  CEats
//
//  Created by 박범수 on 2023/09/10.
//

import SwiftUI


struct MyInfoCategoryView: View {
    let categories: [MyInfoCategory]
    @Binding var selected: MyInfoCategory
    
    var body: some View {
        HStack {
            ForEach(categories, id: \.self) { category in
                VStack {
                    Button {
                        selected = category
                    } label: {
                        Text(category.toString)
                            .frame(minWidth: .screenWidth / 3)
                    }
                    .padding(.top)
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
    }
}
