//
//  Extension +.swift
//  CEatSeller
//
//  Created by 유하은 on 2023/09/11.
//

import Foundation
import SwiftUI

extension Color {
    static let lightgray = Color("lightgray")
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
