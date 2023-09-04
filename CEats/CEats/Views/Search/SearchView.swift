//
//  SearchView.swift
//  CEats
//
//  Created by 박범수 on 2023/09/04.
//

import SwiftUI

@State private var searchTerm = ""

struct SearchView: View {
    var body: some View {
        VStack {
            SearchBarView(text: $searchTerm)
                .padding(.horizontal)
            //List foodType
            
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
