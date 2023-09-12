//
//  WorkingView.swift
//  CEatSeller
//
//  Created by 박범수 on 2023/09/06.
//

import SwiftUI

struct WorkingView: View {
    @EnvironmentObject var sellerViewModel: SellerViewModel

    var body: some View {
        NavigationStack {
            List {
                ForEach(sellerViewModel.seller.order) { order in
                    WorkingViewDetail(order: order)
                }
            }
        }
        .listStyle(.plain)
        .refreshable {
            sellerViewModel.getMyRestaurantOrder()
        }
        .task {
            sellerViewModel.getMyRestaurantOrder()
        }
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
                .environmentObject(SellerViewModel())
        }
    }
}
