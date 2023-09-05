//
//  MapGuide.swift
//  CEats
//
//  Created by 유하은 on 2023/09/05.
//

import SwiftUI

struct MapGuide: View {
    var body: some View {
            Text("지도를 움직여 주소지를 설정하세요")
            .frame(width: .screenWidth * 0.70, height: .screenHeight / 20)
            .background(.gray)
            .opacity(0.8)
            .cornerRadius(30)
            .clipped()
    }
}

struct MapGuide_Previews: PreviewProvider {
    static var previews: some View {
        MapGuide()
    }
}
