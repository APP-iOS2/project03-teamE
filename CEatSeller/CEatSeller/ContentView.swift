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
        .onAppear {
            sellerviewModel.login()
//            sellerviewModel.fireManager.create(data: sellerviewModel.seller)
        }
        .sheet(isPresented: $sellerviewModel.hasNewOrder) {
            NewOrderView()
        }
    }
}

struct NewOrderView: View {
    @EnvironmentObject private var sellerviewModel: SellerViewModel
    
    var body: some View {
        ScrollView {
            VStack {
//                HStack {
//                    Button {
//                        sellerviewModel.isOpen = false
//                    } label: {
//                        Image(systemName: "xmark")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 15)
//                            .foregroundColor(.black)
//                    }
//                    Spacer()
//                }
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text(sellerviewModel.newOrder?.id ?? "")
                            .font(.title2)
                            .bold()
                        Text(sellerviewModel.newOrder?.orderer ?? "")
                            .padding(.top, 1)
                    }
                    Spacer()
                    Text(sellerviewModel.newOrder?.orderDate ?? "")
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
                            ForEach(sellerviewModel.newOrder?.orderedMenu ?? []) { food in
                                Text(food.name)
                            }
//                            Text("하와이안 피자")
//                            Text("오렌지 주스")
                        }
                        .frame(width: .screenWidth * 0.28)
                        Spacer()
                        VStack(alignment: .leading, spacing: 20) {
                            ForEach(sellerviewModel.newOrder?.orderedMenu ?? []) { food in
                                Text("\(food.foodCount)")
                            }
//                            Text("1")
//                            Text("1")
                        }
                        .bold()
                        Spacer()
                        VStack(alignment: .trailing, spacing: 20) {
                            ForEach(sellerviewModel.newOrder?.orderedMenu ?? []) { food in
                                Text(food.priceToString)
                            }
//                            Text("28,000원")
//                            Text("3,000원")
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
                        Text("\(sellerviewModel.newOrder?.totalFee ?? 0)원")
                    }
                    .bold()
                    .font(.title2)
                }
                
                Spacer()
            }
            .padding()
            HStack(spacing: 0) {
                Button {
                    sellerviewModel.StatusButtonTapped(kind: .canceled)
                } label: {
                    Text("거절")
                        .foregroundColor(.white)
                        .bold()
                        .frame(width: .screenWidth * 0.4, height: 60)
                        .background(Color.cyan)
                }
                Button {
                    sellerviewModel.StatusButtonTapped(kind: .accepted)
                } label: {
                    Text("수락")
                        .foregroundColor(.white)
                        .bold()
                        .frame(width: .screenWidth * 0.6, height: 60)
                        .background(Color.green)
                }
            }
        }
        .onAppear {
            sellerviewModel.fireManager.create(data: sellerviewModel.seller)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(SellerViewModel())
    }
}
