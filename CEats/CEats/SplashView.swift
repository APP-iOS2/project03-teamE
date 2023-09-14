//
//  SplashView.swift
//  CEats
//
//  Created by 유하은 on 2023/09/12.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        VStack{
            GeometryReader { geometry in
                Image("coupang")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.2)
                    .foregroundColor(.cEatsBlue)
                    .offset(y:geometry.size.height * 0.38)
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
