//
//  SliderView.swift
//  CEats
//
//  Created by 유하은 on 2023/09/12.
//

import SwiftUI

struct SliderView: View {
    public let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
    @State private var selection = 0
    
    let images = ["advertisement","advertisement2","advertisement3"]
    var body: some View {
        TabView(selection: $selection) {
            ForEach(0..<3) { i in
                Image("\(images[i])")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .onReceive(timer, perform:  { _ in
                withAnimation {
                    selection = selection < 2 ? selection + 1 : 0
                }
            })
        }
            .border(.red)
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView()
    }
}
