//
//  RestaurantInfo.swift
//  CEatSeller
//
//  Created by 박범수 on 2023/09/12.
//

import Foundation

//전화번호, 상호명(레스토랑 이름), 영업시간, 매장소개,
struct RestaurantInfo: Codable {
    var phoneNumber: Int = 0103920313
    var name: String = "멋쟁이 xxxx"
    var timeTable: String = "12:00 ~ 23:00"
    var introduce: String = "대한민국 최고의 xxx 집입니다"
    
}
