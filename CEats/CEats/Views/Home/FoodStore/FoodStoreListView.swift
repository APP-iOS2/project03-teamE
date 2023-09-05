//
//  FoodStoreListView.swift
//  CEats
//
//  Created by Jisoo HAM on 2023/09/04.
//

import SwiftUI

struct FoodStoreListView: View {
    
    //MARK: - View
    var body: some View {
        NavigationStack {
            FoodStoreListDetailView()
            
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    NavigationLink {
                        
                    } label: {
                        Image(systemName: "magnifyingglass")
                    }

                }
            }
        }
    }
}

struct FoodStoreListView_Previews: PreviewProvider {
    static var previews: some View {
        FoodStoreListView()
    }
}
