//
//  HomeView.swift
//  CEatSeller
//
//  Created by 박범수 on 2023/09/06.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var sellerviewModel: SellerViewModel
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 10) {
                    Text("스토어 아이디(\(sellerviewModel.seller.id))")
                    Text("\(sellerviewModel.seller.name)")
                        .font(.system(size: 28, weight: .medium))
                    NavigationLink {
//                        RTRDetailInfoView(restaurant: sellerviewModel.seller.restaurant)
                    } label: {
                        HStack {
                            Text("매장정보 확인")
                            Image(systemName: "chevron.forward")
                        }
                        .padding(5)
                        .padding(.horizontal, 10)
                        .foregroundColor(.green)
                        .background(.background)
                        .cornerRadius(25)
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(.quaternary)
                Text("최근 100건 기준")
                    .padding()
                HStack(alignment: .center) {
                    VStack {
                        Text("고객 별점")
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.red)
                            .padding(.top)
                        Text(sellerviewModel.seller.scoreToString)
                            .font(.system(size: 30, weight: .semibold))
                    }
                    .padding()
                    Divider()
                    VStack {
                        Text("주문 수락율")
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.yellow)
                            .padding(.top)
                        Text("\(sellerviewModel.seller.rateToString)%")
                            .font(.system(size: 30, weight: .semibold))
                    }
                    .padding()
                    Divider()
                    VStack {
                        Text("주문 수락율")
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.green)
                            .padding(.top)
                        Text("\(sellerviewModel.seller.timeToString)초")
                            .font(.system(size: 30, weight: .semibold))
                    }
                    .padding()
                }
                Text("이번주 놓친 주문이 없어요 :)")
                    .padding()
                    .padding(.horizontal, 40)
                    .background(RoundedRectangle(cornerRadius: 2)
                        .stroke(Color.secondary)
                    )
                Divider()
                    .padding()
                VStack(alignment: .leading) {
                    ///기능 구현 일단 중단.
//                    NavigationLink {
//                        ManagingMenu()
//                    } label: {
//                        HStack {
//                            Image(systemName: "list.clipboard.fill")
//                                .padding(.horizontal)
//                            Text("메뉴 관리")
//                        }
//                        .padding()
//                        .foregroundColor(.primary)
//                        Spacer()
//                    }
                    
                    NavigationLink {
                        RTRView(restaurant: sellerviewModel.seller.restaurant)
                    } label: {
                        HStack {
                            Image(systemName: "eye")
                                .padding(.horizontal)
                            Text("고객화면 미리보기")
                        }
                        .padding()
                        .foregroundColor(.primary)
                        Spacer()
                    }
                    NavigationLink {
                        BusinessHourView()
                    } label: {
                        HStack {
                            Image(systemName: "calendar")
                                .padding(.horizontal)
                            Text("영업시간 ・ 휴무 관리")
                        }
                        .padding()
                        .foregroundColor(.primary)
                        Spacer()
                    }
                    
                    Image("advertisement2")
                        .resizable()
                        .scaledToFit()
                        .padding(.top,30)
                    
                    ///기능 구현 일단 중단.
//                    NavigationLink {
//                        ReviewInfoView(restaurant: sellerviewModel.seller.restaurant)
//                    } label: {
//                        HStack {
//                            Image(systemName: "list.clipboard")
//                                .padding(.horizontal)
//                            Text("리뷰 관리")
//                        }
//                        .padding()
//                        .foregroundColor(.primary)
//                        Spacer()
//                    }
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Toggle("", isOn: $sellerviewModel.isOpen)
                            .toggleStyle(.switch)
                    }
                }
                .navigationTitle(sellerviewModel.titleMessage)
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
            HomeView()
            .environmentObject(SellerViewModel())
    }
}
