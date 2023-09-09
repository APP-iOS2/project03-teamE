//
//  HeaderView.swift
//  CEats
//
//  Created by 박범수 on 2023/09/10.
//

import SwiftUI

struct HeaderView: View {
    @Binding var isOpenMapSheet: Bool
    
    var body: some View {
        HStack {
            Button(action: {
                isOpenMapSheet = true
            }) {
                HStack {
                    Label("위치를 정해주세요", systemImage: "location.circle")
                        .foregroundColor(.black)
                    Image(systemName: "chevron.down")
                }
            }
            Spacer()
        }
        .padding(20)
    }
}
