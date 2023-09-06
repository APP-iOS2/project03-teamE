//
//  ContentView.swift
//  CEatSeller
//
//  Created by 박범수 on 2023/09/06.
//

import SwiftUI

struct ContentView: View {
    
    @State var tabIndex: Int = 0
    
    
    var body: some View {
        TabView(selection: $tabIndex) {
            
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("홈")
                }
                .tag(1)
            
            WorkingView()
                .tabItem {
                    Image(systemName: "frying.pan")
                    Text("진행중")
                }
                .tag(2)
            
            OrderedHistoryView()
                .tabItem {
                    Image(systemName: "list.bullet.rectangle.portrait")
                    Text("주문내역")
                }
                .tag(3)
        }
    }
}   

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
