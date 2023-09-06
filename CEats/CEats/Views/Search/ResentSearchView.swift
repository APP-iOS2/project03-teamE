
//  ResentSearchView.swift
//  CEats
//
//  Created by 박범수 on 2023/09/06.
//

//import SwiftUI
//
//struct ResentSearchView: View {
//    
//    @State private var searchTerm = ""
//    @State private var searchArray: [String] = []
//    
//    init() {
//        if let savedSearchTerm = UserDefaults.standard.string(forKey: "searchTerm") {
//            searchTerm = savedSearchTerm
//            searchArray = [savedSearchTerm]
//        }
//    }
//    
//    var body: some View {
//        NavigationStack{
//            VStack {
//                SearchBarView(text: $searchTerm)
//                Spacer()
//                List {
//                    ForEach(searchArray, id: \.self) { searchText in
//                        Text(searchText)
//                    }
//                }
//                Spacer()
//            }
//        }
//    }
//}
//
//struct ResentSearchView_Previews: PreviewProvider {
//    static var previews: some View {
//        ResentSearchView()
//    }
//}
