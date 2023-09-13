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
        NavigationStack{
            VStack {
                HStack {
                    Spacer()
                    NavigationLink {
                        HomeSearchDetailView()
                    } label: {
                        SearchBarView(text: $searchTerm)
                    }
                    .padding(.bottom,30)
                }
                ScrollView {
                    SearchViewImage()
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .environmentObject(UserViewModel())
    }
}

