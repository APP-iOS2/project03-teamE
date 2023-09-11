//
//  WorkingView.swift
//  CEatSeller
//
//  Created by 박범수 on 2023/09/06.
//

import SwiftUI

struct WorkingView: View {
    
    @State private var orderNumber = "B9103A"
    @State private var customerName = "홍길동"
    @State private var orderTime = "오후 12:25"
    @State private var menuCount: Int = 2
    @State private var menuPrice = "31,000원"
    @State private var menuDetail = "하와이안 피자(올리브 토핑 추가, 치즈 토핑 추가)"
    
    var body: some View {
        NavigationStack {
            List {
                VStack {
                    HStack(alignment: .top) {
                        VStack(alignment: .leading) {
                            Text("\(orderNumber)")
                                .font(.title3)
                                .bold()
                                .padding(.bottom, 1)
                            Text("\(customerName)")
                        }
                        Spacer()
                        
                        Text("\(orderTime)")
                            .foregroundColor(.gray)
                            .font(.footnote)
                    }
                    .padding(.top, 10)
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("[메뉴 \(menuCount)개] \(menuPrice)")
                                .bold()
                                .font(.headline)
                                .padding(.bottom, 0.5)
                            
                            Text("\(menuDetail)")
                                .lineLimit(1)
                        }
                        .padding(.horizontal, 5)
                        .padding(.bottom, 10)
                        
                        Spacer()
                    }
                    .padding(.top, 10)
                    .background(Color.gray)
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("남은 준비시간")
                                .font(.footnote)
                                .foregroundColor(.gray)
                            
                            HStack(alignment: .bottom) {
                                Text("13")
                                    .font(.largeTitle)
                                    .bold()
                                Text("분")
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                                    .padding(.bottom, 5)
                            }
                        }
                        .frame(width: .screenWidth * 0.2)
                        
                        VStack(alignment: .leading) {
                            Text("김쿠팡(배달원)")
                                .font(.footnote)
                                .foregroundColor(.gray)
                            HStack(alignment: .bottom) {
                                Text("11")
                                    .font(.largeTitle)
                                    .bold()
                                Text("분")
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                                    .padding(.bottom, 5)
                            }
                        }
                        .frame(width: .screenWidth * 0.3)
                        
                        Spacer()
                        
                        Button {
                            print("준비 완료")
                        } label: {
                            Text("준비 완료")
                                .font(.footnote)
                                .foregroundColor(.green)
                                .bold()
                                .frame(width: 80, height: 40)
                                .border(Color.green, width: 1)
                        }
                    }
                    .padding(.top, 10)
                }
                
                VStack {
                    HStack(alignment: .top) {
                        VStack(alignment: .leading) {
                            Text("\(orderNumber)")
                                .font(.title3)
                                .bold()
                                .padding(.bottom, 1)
                            Text("\(customerName)")
                        }
                        Spacer()
                        
                        Text("\(orderTime)")
                            .foregroundColor(.gray)
                            .font(.footnote)
                    }
                    .padding(.top, 10)
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("[메뉴 \(menuCount)개] \(menuPrice)")
                                .bold()
                                .font(.headline)
                                .padding(.bottom, 0.5)
                            
                            Text("\(menuDetail)")
                                .lineLimit(1)
                        }
                        .padding(.horizontal, 5)
                        .padding(.bottom, 10)
                        
                        Spacer()
                    }
                    .padding(.top, 10)
                    .background(Color.gray)
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("남은 준비시간")
                                .font(.footnote)
                                .foregroundColor(.gray)
                            
                            HStack(alignment: .bottom) {
                                Text("13")
                                    .font(.largeTitle)
                                    .bold()
                                Text("분")
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                                    .padding(.bottom, 5)
                            }
                        }
                        .frame(width: .screenWidth * 0.2)
                        
                        VStack(alignment: .leading) {
                            Text("김쿠팡(배달원)")
                                .font(.footnote)
                                .foregroundColor(.gray)
                            HStack(alignment: .bottom) {
                                Text("11")
                                    .font(.largeTitle)
                                    .bold()
                                Text("분")
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                                    .padding(.bottom, 5)
                            }
                        }
                        .frame(width: .screenWidth * 0.3)
                        
                        Spacer()
                        
                        Button {
                            print("준비 완료")
                        } label: {
                            Text("준비 완료")
                                .font(.footnote)
                                .foregroundColor(.green)
                                .bold()
                                .frame(width: 80, height: 40)
                                .border(Color.green, width: 1)
                        }
                    }
                    .padding(.top, 10)
                }
            }
        }
        .listStyle(.plain)
        
        .navigationTitle("진행 중 주문")
    }
}

extension CGFloat {
    static let screenWidth = UIScreen.main.bounds.width
    static let screenHeight = UIScreen.main.bounds.height
}

struct WorkingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            WorkingView()
        }
    }
}
