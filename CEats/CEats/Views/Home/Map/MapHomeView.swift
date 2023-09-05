//
//  MapHomeView.swift
//  CEats
//
//  Created by 유하은 on 2023/09/05.
//

import SwiftUI

struct MapHomeView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @Binding var isOpenMapSheet: Bool

    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink {
                    MapSearchView(isOpenMapSheet: $isOpenMapSheet)
                } label: {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.lightgray)
                            .padding(.trailing, 10)
                        Text("도로명, 건물명 또는 지번으로 검색")
                            .foregroundColor(.lightgray)
                        
                        Spacer()
                    }
                    .padding(.leading, 30)
                }
                .padding(.top, 30)
                .padding(.bottom, 10)
                
                Rectangle()
                    .foregroundColor(.veryLightGray)
                    .frame(height: 5)
                NavigationLink {
                    NowMapView(isOpenMapSheet: $isOpenMapSheet, isSelectedPlace: .constant(""), selectedPlaceLat: .constant(0), selectedPlaceLong: .constant(0))
                } label: {
                    Label("현재 위치로 주소찾기", systemImage: "location.north")
                        .frame(width: .screenWidth * 0.8, height: 60)
                        .background(.clear)
                        .foregroundColor(.black)
                        .border(Color.gray, width: 1.5)
                        .cornerRadius(3)
                }
                .padding(.top, 20)
                
                Spacer()
            }
            .navigationTitle("주소 설정")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: backButton)
        }
    }
    
    var backButton: some View {
        Button {
            dismiss()
        } label: {
            Image(systemName: "xmark")
                .aspectRatio(contentMode: .fit)
                .foregroundColor(Color.black)
        }
    }
}

struct MapHomeView_Previews: PreviewProvider {
    static var previews: some View {
        MapHomeView(isOpenMapSheet: .constant(true))
    }
}
