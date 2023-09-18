//
//  Extension+Viewmodifier.swift
//  CEats
//
//  Created by Jisoo HAM on 2023/09/18.
//

import SwiftUI

struct CEatsImg: ViewModifier {
    func body(content: Content) -> some View {
        content
            .aspectRatio(contentMode: .fill)
            .frame(width: 0, height: 30)
    }
}

struct CEatsTextColor: ViewModifier {
    let color: Color
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 20))
            .foregroundColor(color)
            .padding()
    }
}

extension View {
    func cEatsImg() -> some View {
        modifier(CEatsImg())
    }
    
    func cEatsTextColor(color: Color) -> some View {
        modifier(CEatsTextColor(color: color))
    }
}
