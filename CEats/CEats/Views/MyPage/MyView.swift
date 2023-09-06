//
//  MyView.swift
//  CEats
//
//  Created by 박범수 on 2023/09/04.
//

import SwiftUI

struct MyView: View {
    var body: some View {
        VStack {
            Text("홍길동")// 내 이름
                .font(.largeTitle)
                .padding(5)
            Text("010-xxxx-xxxx")// 내 전화번호
            
            HStack(alignment: .center ,spacing: 10) {
                VStack {
                    Text("0")
                        .font(.largeTitle)
                        .bold()
                    Text("내가 남긴리뷰")
                        .font(.footnote)
                } .padding()
                
                VStack(alignment: .center) {
                    Text("0")
                        .font(.largeTitle)
                        .bold()
                    Text("도움이 됐어요")
                        .font(.footnote)
                } .padding()

                VStack {
                    Text("0")
                        .font(.largeTitle)
                        .bold()
                    Text("즐겨찾기")
                        .font(.footnote)
                } .padding()
            } .padding(.trailing, 25)
            
            
            // 자세히보기 버튼
            Button {
                
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 320, height: 50)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.blue, lineWidth: 1)
                        )
                        .foregroundColor(.white)
                        .padding(2)
                    Text("자세히 보기")
                }
            }
            List {
                Button {
                    // 주소 관리 뷰로 이동
                } label: {
                    HStack {
                        Image(systemName: "list.bullet.rectangle.portrait")
                            .foregroundColor(.black)
                            .imageScale(.large)
                        Text("주소 관리")
                            .frame(height: 60)
                            .foregroundColor(.black)
                    }
                }
                Button {
                    // 즐겨찾기 뷰로 이동
                } label: {
                    HStack {
                        Image(systemName: "heart")
                            .foregroundColor(.black)
                            .imageScale(.large)
                        Text("즐겨찾기")
                            .frame(height: 60)
                            .foregroundColor(.black)
                    }
                }
                Button {
                    // 할인 쿠폰 뷰로 이동
                } label: {
                    HStack {
                        Image(systemName: "tag")
                            .foregroundColor(.black)
                            .imageScale(.large)
                        Text("할인 쿠폰")
                            .frame(height: 60)
                            .foregroundColor(.black)
                    }
                }
            }
            .listStyle(.grouped)
        }
    }
}

struct MyView_Previews: PreviewProvider {
    static var previews: some View {
        MyView()
    }
}
