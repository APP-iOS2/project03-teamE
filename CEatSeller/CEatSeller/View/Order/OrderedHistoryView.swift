//
//  OrderListed.swift
//  CEatSeller
//
//  Created by 박범수 on 2023/09/06.
//

import SwiftUI

struct OrderedHistoryView: View {
    var body: some View {
        NavigationStack {
            List {
                ForEach(0..<5) { _ in
                    WorkingViewDetail()
                }
            }
        }
        .listStyle(.plain)
        
        .navigationTitle("주문 내역")
    }
}

struct OrderListed_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            OrderedHistoryView()
        }
    }
}
