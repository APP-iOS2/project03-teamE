//
//  RTRTitleImageView.swift
//  CEats
//
//  Created by gnksbm on 2023/09/04.
//

import SwiftUI

struct RTRTitleImageView: View {
    let imageNamss: [String]
    
    @Binding var selectedIndex: Int
    private var totalCount: Int {
        return imageNamss.count
    }
    
    var body: some View {
        ZStack {
            TabView(selection: $selectedIndex) {
                ForEach(Array(zip(imageNamss, imageNamss.indices)), id: \.1) { imgName, _ in
                    Image(imgName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct RTRTitleImageView_Previews: PreviewProvider {
    static var previews: some View {
        RTRTitleImageView(imageNamss: [
            "photo",
            "photo",
            "photo",
        ], selectedIndex: .constant(0))
    }
}
