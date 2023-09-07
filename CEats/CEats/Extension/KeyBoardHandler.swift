//
//  KeyBoardHandler.swift
//  CEats
//
//  Created by 박범수 on 2023/09/07.
//

import Combine
import SwiftUI
// 키보드가 올라갈때 뷰도 같이올라가 가리지 않는 함수

//@StateObject private var keyboardHandler = KeyboardHandler() //struct view 내 변수로 선언
//
//ScrollView(.vertical){
//}
//.padding(.bottom, keyboardHandler.keyboardHeight)
final class KeyboardHandler: ObservableObject {
    @Published private(set) var keyboardHeight: CGFloat = 0
    
    private var cancellable: AnyCancellable?
    
    private let keyboardWillShow = NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)
        .compactMap { ($0.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)?.height }
    
    private let keyboardWillHide = NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
        .map { _ in CGFloat.zero }
    
    init() {
        cancellable = Publishers.Merge(keyboardWillShow, keyboardWillHide).subscribe(on: DispatchQueue.main)
            .assign(to: \.self.keyboardHeight, on: self)
    }
        
}
