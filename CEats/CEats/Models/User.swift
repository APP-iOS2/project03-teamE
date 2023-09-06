//
//  User.swift
//  CEats
//
//  Created by 박범수 on 2023/09/04.
//

import Foundation

struct User: Identifiable {
    var id: String
    var username: String
    var email: String
    var phoneNumber: String
//    var homeAddress: location이랑 똑같은 타입일거같음
    var favoriteRestaurant: [Restaurant]
    var orderHistory : [Order] //
    var foodCart: [Food] //장바구니
}


