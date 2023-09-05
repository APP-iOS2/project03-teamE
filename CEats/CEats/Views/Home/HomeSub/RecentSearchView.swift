//
//  RecentSearchView.swift
//  CEats
//
//  Created by 유하은 on 2023/09/05.
//

import SwiftUI

struct RecentSearchView: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("최근 검색어")
            Divider()
            HStack{
                Image(systemName: "timer")
                    .foregroundColor(.secondary)
                    .bold()
                    .frame(width: 15,height: 15)
                Text("와플")
                    .font(.footnote)
                Spacer()
                Text("01.13")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                /*
                Button {
                    
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.secondary)
                }
                 */
            }
            .padding(.top,10)
        }
    }
}

struct RecentSearchView_Previews: PreviewProvider {
    static var previews: some View {
        RecentSearchView()
    }
}
