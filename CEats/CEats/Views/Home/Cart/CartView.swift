//
//  CartView.swift
//  CEats
//
//  Created by 박범수 on 2023/09/07.
//

import SwiftUI

struct CartView: View {
    // MARK: - Properties
    @EnvironmentObject var userViewModel: UserViewModel
    @Binding var isOpenMapSheet: Bool
    @State var fee: Int
    
    init(userViewModel: UserViewModel, isOpenMapSheet: Binding<Bool>) {
        self._isOpenMapSheet = isOpenMapSheet
        self.fee = userViewModel.user.foodCart?.restaurant.deliveryFee ?? 0
    }
    
    // MARK: - View
    var body: some View {
        NavigationStack{
            ScrollView {
                CartDeliveryView(isOpenMapSheet: $isOpenMapSheet, fee: $fee)
                CartMenuView()
                CartPayView(fee: $fee)
                CartPayButtonView()
            }
            
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {

        CartView(userViewModel: UserViewModel(), isOpenMapSheet: .constant(false))
            .environmentObject(UserViewModel())
            .environmentObject(RestaurantViewModel())

    }
}
