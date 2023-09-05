//
//  MapSearchView.swift
//  CEats
//
//  Created by 유하은 on 2023/09/05.
//

import SwiftUI

struct MapSearchView: View {
    @State var searchText: String = ""
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
                .padding(.trailing,10)
            TextField("도로명, 건물명 또는 지번으로 검색", text: $searchText)
        }
        .padding(30)
    }
}

struct MapSearchVIEW_Previews: PreviewProvider {
    static var previews: some View {
        MapSearchView()
    }
}
