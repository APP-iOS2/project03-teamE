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
    
    // MARK: - View
    var body: some View {
        NavigationStack{
            ScrollView {
                CartDeliveryView(isOpenMapSheet: $isOpenMapSheet)
                CartMenuView()
                CartPayView()
                CartPayButtonView()
            }
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        
        CartView(isOpenMapSheet: .constant(false))
            .environmentObject(UserViewModel())
            .environmentObject(RestaurantViewModel())
        
    }
}
