//
//  Review.swift
//  CEats
//
//  Created by 박범수 on 2023/09/04.
//

import Foundation

struct Review {
    var writer: String
    var score: Double //평점
    var image: String? //리뷰이미지
    var contents: String // 리뷰 내용
    var createdAt: Date
    //var orderID: Order.ID  필요하지 않을까요?
}
