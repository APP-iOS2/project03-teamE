//
//  Extension+CGFloat.swift
//  CEats
//
//  Created by gnksbm on 2023/09/04.
//

import SwiftUI

extension CGFloat {
    static let screenWidth = UIScreen.main.bounds.width
    static let screenHeight = UIScreen.main.bounds.height
}

extension Double {
    @ViewBuilder
    var doubleToStarView: some View {
        let fullStarCount = Int(self)
        let hasHalfStar = self.truncatingRemainder(dividingBy: 1) >= 0.5
        
        HStack(spacing: 0) {
            ForEach(1...5, id: \.self) { index in
                if index <= fullStarCount {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                } else if index == fullStarCount + 1 && hasHalfStar {
                    Image(systemName: "star.leadinghalf.filled")
                        .foregroundColor(.yellow)
                } else {
                    Image(systemName: "star.fill")
                        .foregroundColor(.gray)
                }
            }
        }
    }
}

extension String {
    static let defaultImgName = "photo"
}
