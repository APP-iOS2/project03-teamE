//
//  MyInfoCategory.swift
//  CEats
//
//  Created by 박범수 on 2023/09/10.
//

import Foundation

enum MyInfoCategory: CaseIterable {
    case review, order, favorite
    
    var toString: String {
        switch self {
        case .review:
            return "리뷰"
        case .order:
            return "주문내역"
        case .favorite:
            return "즐겨찾기"
        }
    }
}
