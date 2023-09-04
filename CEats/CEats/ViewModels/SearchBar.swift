//
//  SearchBar.swift
//  CEats
//
//  Created by 박범수 on 2023/09/04.
//

import SwiftUI


struct SearchBarView: View {
    @Binding var text: String
    
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
            
            TextField("Search", text: $text)
                .foregroundColor(.primary)
            
            if !text.isEmpty {
                Button(action: {
                    self.text = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                }
            } else {
                EmptyView()
            }
        }
        .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
        .foregroundColor(.secondary)
#if os(iOS)
        .background(Color(.secondarySystemBackground))
#endif
        .cornerRadius(10.0)
    }

}
