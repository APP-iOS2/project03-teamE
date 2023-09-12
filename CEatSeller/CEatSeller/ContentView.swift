//
//  ContentView.swift
//  CEatSeller
//
//  Created by 박범수 on 2023/09/06.
//


import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var sellerviewModel: SellerViewModel
    @State var tabIndex: Int = 0
    
    @State private var isOrderComing: Bool = false
    
    var body: some View {
        TabView(selection: $tabIndex) {
            
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("홈")
                }
                .tag(1)
            
            WorkingView()
                .tabItem {
                    Image(systemName: "frying.pan")
                    Text("진행중")
                }
                .tag(2)
            
            OrderedHistoryView()
                .tabItem {
                    Image(systemName: "list.bullet.rectangle.portrait")
                    Text("주문내역")
                }
                .tag(3)
        }
        .sheet(isPresented: $isOrderComing) {
            ScrollView {
                VStack {
                    HStack {
                        Button {
                            isOrderComing = false
                        } label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15)
                                .foregroundColor(.black)
                        }
                        
                        Spacer()
                    }
                    
                    HStack(alignment: .top) {
                        VStack(alignment: .leading) {
                            Text("B9103A")
                                .font(.title2)
                                .bold()
                            
                            Text("홍길동")
                                .padding(.top, 1)
                        }
                        Spacer()
                        Text("오후 12:00")
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                    .padding(.top, 30)
                    
                    HStack(alignment: .center) {
                        Text("새우 뺴주세요!")
                            .padding(15)
                        Spacer()
                    }
                    .background(Color.pink)
                    
                    VStack {
                        Divider()
                            .frame(height: 2)
                            .overlay(Color.black)
                            .padding(.top, 10)
                        
                        HStack(alignment: .center) {
                            Spacer()
                            Text("메뉴")
                            Spacer()
                            Spacer()
                            Spacer()
                            Text("수량")
                            Spacer()
                            Spacer()
                            Text("금액")
                            Spacer()
                        }
                        .padding(.vertical, 5)
                        
                        Divider()
                            .frame(height: 1)
                            .overlay(Color.black)
                        
                        HStack(alignment: .top) {
                            VStack(alignment: .leading, spacing: 20) {
                                Text("하와이안 피자")
                                Text("오렌지 주스")
                            }
                            .frame(width: .screenWidth * 0.28)
                            
                            Spacer()
                            
                            VStack(alignment: .leading, spacing: 20) {
                                Text("1")
                                Text("1")
                            }
                            .bold()
                            
                            Spacer()
                            VStack(alignment: .trailing, spacing: 20) {
                                Text("28,000원")
                                Text("3,000원")
                            }
                            .bold()
                        }
                        .padding(.top, 20)
                        
                        Divider()
                            .frame(height: 3)
                            .overlay(Color.black)
                            .padding(.vertical, 20)
                        
                        HStack {
                            Text("주문금액")
                            Spacer()
                            Text("31,000원")
                        }
                        .bold()
                        .font(.title2)
                    }
                    
                    Spacer()
                }
                .padding()
                
                HStack(spacing: 0) {
                    Button {
                        print("거절")
                    } label: {
                        Text("거절")
                            .foregroundColor(.white)
                            .bold()
                            .frame(width: .screenWidth * 0.4, height: 60)
                            .background(Color.cyan)
                    }

                    Button {
                        print("수락")
                    } label: {
                        Text("수락")
                            .foregroundColor(.white)
                            .bold()
                            .frame(width: .screenWidth * 0.6, height: 60)
                            .background(Color.green)
                    }
                }
            }
        }
    }
}   

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(SellerViewModel())
    }
}
