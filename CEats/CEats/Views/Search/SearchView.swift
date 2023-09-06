//
//  SearchView.swift
//  CEats
//
//  Created by 박범수 on 2023/09/04.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searchTerm = ""

    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                SearchBarView(text: $searchTerm)
                Image(systemName: "magnifyingglass")
                Spacer()
            }
            Spacer()
            ScrollView {
                SearchViewImage()
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

