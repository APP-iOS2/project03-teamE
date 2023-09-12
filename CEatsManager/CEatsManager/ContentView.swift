//
//  ContentView.swift
//  CEatsManager
//
//  Created by 박범수 on 2023/09/12.
//

import SwiftUI

struct ContentView: View {
    @State var columnVisibility = NavigationSplitViewVisibility.doubleColumn
    
    var body: some View {
        NavigationSplitView(columnVisibility: $columnVisibility) {
            ReviewHome()
        } detail: {
            ReviewDetail()
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
