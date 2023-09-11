//
//  WorkingView.swift
//  CEatSeller
//
//  Created by 박범수 on 2023/09/06.
//

import SwiftUI

struct WorkingView: View {
    var body: some View {
        NavigationStack {
            List {
                ForEach(0..<5) { _ in
                    WorkingViewDetail()
                }
            }
        }
        .listStyle(.plain)
        
        .navigationTitle("진행 중 주문")
    }
}

extension CGFloat {
    static let screenWidth = UIScreen.main.bounds.width
    static let screenHeight = UIScreen.main.bounds.height
}

struct WorkingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            WorkingView()
        }
    }
}
