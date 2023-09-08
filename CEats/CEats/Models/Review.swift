//
//  Review.swift
//  CEats
//
//  Created by 박범수 on 2023/09/04.
//

import Foundation

struct Review: Identifiable {
    var id = UUID().uuidString
    var writer: String //여기에 유저 정보가 들어가야함. 유저 이메일이나 유저 네임
    var score: Double //평점
    var image: String? //리뷰이미지
    var contents: String // 리뷰 내용
    var createdAt: Double = Date().timeIntervalSince1970
    var createdDate: String {
        let dateCreatedAt: Date = Date(timeIntervalSince1970: createdAt)
        
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_kr")
        dateFormatter.timeZone = TimeZone(abbreviation: "KST")
        dateFormatter.dateFormat = "MM월dd일 HH:mm"
        return dateFormatter.string(from: dateCreatedAt)
    }
}

#if DEBUG
extension Review {
    static let sampleData: Self = .init(writer: "김멋사", score: 4.5, image: "photo", contents: "맛있네요")
}
#endif
