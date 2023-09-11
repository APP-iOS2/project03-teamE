//
//  FullScreenImageView.swift
//  CEats
//
//  Created by 박범수 on 2023/09/11.
//

import SwiftUI

import SwiftUI

struct FullScreenImageView: View {
    @Environment(\.dismiss) private var dismiss
    let imageName: [String]
    
    var body: some View {
        ForEach(imageName, id: \.self) { content in
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                Image(content)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            dismiss()
        }) {
            Image(systemName: "xmark")
                .foregroundColor(.white)
        })
    }
}
