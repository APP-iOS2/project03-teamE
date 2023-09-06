//
//  RTRTitleImageView.swift
//  CEats
//
//  Created by gnksbm on 2023/09/04.
//

import SwiftUI

struct RTRTitleImageView: View {
    let imageNamss: [String]
    
    @State private var selectedIndex = 0
    private var totalCount: Int {
        return imageNamss.count
    }
    
    var body: some View {
        ZStack {
            TabView(selection: $selectedIndex) {
                ForEach(Array(zip(imageNamss, imageNamss.indices)), id: \.1) { imgName, index in
                    Image(imgName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }
            }
            Text("\(selectedIndex + 1) / \(totalCount)")
                .padding(.vertical, 5)
                .padding(.horizontal)
                .font(.caption)
                .foregroundColor(.white)
                .background(Color.secondary)
                .cornerRadius(.greatestFiniteMagnitude)
                .offset(x: -.screenWidth / 3, y: .screenHeight / 35) // 사진이 하나라 굳이 없어도 되는 부분 같아요 (1/1이거 표현하는게)
            
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
        ])
    }
}
