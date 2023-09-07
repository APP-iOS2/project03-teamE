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
    var userAddress: String
    var favoriteRestaurant: [Restaurant] // 즐겨찾기
    var orderHistory: [Order] //
    var foodCart: [Food] //장바구니
    var cEatsMoney: Int = 100000
    var latitude: Double//위도
    var longitude: Double //경도
    
}

#if DEBUG
extension User {
    static let sampleData: Self = .init(id: UUID().uuidString, username: "Sample", email: "sample@sample.com", phoneNumber: "01010091004", userAddress: "서울특별시 어쩌구 무슨로 1004", favoriteRestaurant: [], orderHistory: [], foodCart: [], latitude: 37.566535, longitude: 126.9779692)
}
#endif
