//
//  Extenstion.swift
//  CEatsManager
//
//  Created by Jisoo HAM on 2023/09/13.
//

import SwiftUI

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
