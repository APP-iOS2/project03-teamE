//
//  CartView.swift
//  CEats
//
//  Created by 박범수 on 2023/09/07.
//

import SwiftUI

struct CartView: View {
    // MARK: - Properties
    @Binding var isOpenMapSheet: Bool
    @Binding var order: Order
    
    // MARK: - View
    var body: some View {
        NavigationStack{
            ScrollView {
                CartDeliveryView(order: $order, isOpenMapSheet: $isOpenMapSheet)
                CartMenuView()
                CartPayView()
            }
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        
        CartView(isOpenMapSheet: .constant(false), order: .constant(.sampleData))
            .environmentObject(UserViewModel())
            .environmentObject(RestaurantViewModel())
        
    }
}
