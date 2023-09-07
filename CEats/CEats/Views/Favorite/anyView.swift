//
//  anyView.swift
//  CEats
//
//  Created by 박범수 on 2023/09/07.
//

import SwiftUI

struct AnyView: View {
    @State private var progress: CGFloat = 0.0
    @State private var isAnimating = false
    
    var body: some View {
         VStack {
             Button(action: {
                 withAnimation(.easeOut(duration: 0.1)) {
                     self.isAnimating.toggle()
                     self.progress = self.isAnimating ? 1 : 0
                 }
                 DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                     // 버튼 누른 이벤트 발생
                 }
             }) {
                 ZStack(alignment: .leading) {
                     RoundedRectangle(cornerRadius: 10)
                         .stroke(Color.gray, lineWidth: 2)
                         .frame(width: 180, height: 50)
                     RoundedRectangle(cornerRadius: 10)
                         .fill(Color.gray)
                         .frame(width: 180 * progress, height: 50)
                         .animation(.linear(duration: 0.3), value: isAnimating)
                     Text("쿠팡이츠 맛집 구경가기")
                         .foregroundColor(.black)
                         .frame(width: 180, height: 50)
                 }
             }
         }
     }
 }

struct anyView_Previews: PreviewProvider {
    static var previews: some View {
        AnyView()
    }
}
