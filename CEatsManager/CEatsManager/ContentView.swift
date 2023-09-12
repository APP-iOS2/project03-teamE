//
//  ContentView.swift
//  CEatsManager
//
//  Created by 박범수 on 2023/09/12.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationSplitView {
            ReviewHome()
        } detail: {
            ReviewDetail()
        }
        .navigationSplitViewStyle(.balanced)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
