//
//  RTRDetailInfoMenuView.swift
//  CEats
//
//  Created by gnksbm on 2023/09/05.
//

import SwiftUI

struct RTRDetailInfoMenuView: View {
    let phoneNumber: Int
    
    private var numberToString: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .none
        return formatter.string(from: phoneNumber as NSNumber) ?? ""
    }
    
    var body: some View {
        Menu(numberToString) {
            Section(numberToString) {
                Button {
                } label: {
                    Label("iPhone으로 전화걸기", systemImage: "phone")
                }
                Button {
                } label: {
                    Label("메세지 보내기", systemImage: "message")
                }
                Button {
                } label: {
                    Label("FaceTime", systemImage: "video")
                }
                Button {
                } label: {
                    Label("FaceTime 음성 통화", systemImage: "phone")
                }
                Button {
                } label: {
                    Label("연락처에 추가", systemImage: "person.crop.circle.badge.plus")
                }
                Button {
                } label: {
                    Label("전화번호 복사", systemImage: "doc.on.doc")
                }
            }
        }
    }
}

struct RTRDetailInfoMenuView_Previews: PreviewProvider {
    static var previews: some View {
        RTRDetailInfoMenuView(phoneNumber: 00000000000)
    }
}
