//
//  MapHomeView.swift
//  CEats
//
//  Created by 유하은 on 2023/09/05.
//

import SwiftUI

struct MapHomeView: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack{
            VStack{
                MapSearchView()
                Rectangle()
                    .foregroundColor(.veryLightGray) //이거 색을 다른걸로 하든 섹션으로 분류하든 해야겟으요
                    .frame(height: 5)
                Button {
                    
                } label: {
                    Label("현재 위치로 주소찾기", systemImage: "location.north")
                }
                .padding(.top,20)
                .buttonStyle(.borderedProminent)

                
            }
        }
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button {
                } label: {
                    HStack {
                        Image(systemName: "multiply") //유민영 강사님이 쓰지 말라고 할듯~
                    }
                }
            }
        }
}
        
    
        
}

struct MapHomeView_Previews: PreviewProvider {
    static var previews: some View {
        MapHomeView()
    }
}
