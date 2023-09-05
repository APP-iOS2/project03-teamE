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
                NavigationLink {
                    NowMapView(isSelectedPlace: .constant(""), selectedPlaceLat: .constant(0), selectedPlaceLong: .constant(0))
                } label: {
                    Label("현재 위치로 주소찾기", systemImage: "location.north")
                }
                .padding(.top,20)
                .buttonStyle(.borderedProminent)
                
                ScrollView{
                    ForEach(0..<5, id:\.self){ content in
                        HStack{
                            Image(systemName: "bell")
                            VStack(alignment: .leading){
                                Text("잠실 더 힐츠 아파트")
                                    .font(.system(size:15))
                                Text("서울시 잠실 잠실대로 1023 1302-606")
                                    .font(.footnote)
                                    .foregroundColor(.secondary)
                            }
                            Spacer()
                        }
                        .padding(30)
                        Spacer()
                        Divider()

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
