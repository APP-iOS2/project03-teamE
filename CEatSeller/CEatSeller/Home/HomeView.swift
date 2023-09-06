//
//  HomeView.swift
//  CEatSeller
//
//  Created by 박범수 on 2023/09/06.
//

import SwiftUI

struct Seller {
    let id: String
    var name: String
    var score: Double
    var orderAcceptanceRate: Double
    var averageAcceptanceTime: Double
    
    var scoreToString: String {
        String(format: "%.1f", score)
    }
    var rateToString: String {
        String(format: "%.0f", orderAcceptanceRate)
    }
    var timeToString: String {
        String(format: "%.0f", averageAcceptanceTime)
    }
}

extension Seller {
    static let sampleData: Self = .init(id: "Test123", name: "멋쟁이 김치처럼", score: 4.5, orderAcceptanceRate: 99, averageAcceptanceTime: 10)
}

final class HomeViewModel: ObservableObject {
    @Published var isOpen = false
    @Published var seller: Seller
    
    var titleMessage: String {
        isOpen ? "신규 주문 받는중" : "쉬는중"
    }
    
    init(store: Seller) {
        self.seller = store
    }
}

struct HomeView: View {
    @StateObject private var viewModel: HomeViewModel = .init(store: .sampleData)
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 10) {
                    Text("스토어 아이디(\(viewModel.seller.id))")
                    Text("\(viewModel.seller.name)")
                        .font(.system(size: 28, weight: .medium))
                    NavigationLink {
                        
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
                        Text(viewModel.seller.scoreToString)
                            .font(.system(size: 30, weight: .semibold))
                    }
                    .padding()
                    Divider()
                    VStack {
                        Text("주문 수락율")
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.yellow)
                            .padding(.top)
                        Text("\(viewModel.seller.rateToString)%")
                            .font(.system(size: 30, weight: .semibold))
                    }
                    .padding()
                    Divider()
                    VStack {
                        Text("주문 수락율")
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.green)
                            .padding(.top)
                        Text("\(viewModel.seller.timeToString)초")
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
                    NavigationLink {
                        
                    } label: {
                        HStack {
                            Image(systemName: "list.clipboard.fill")
                                .padding(.horizontal)
                            Text("메뉴 관리")
                        }
                        .padding()
                        .foregroundColor(.primary)
                        Spacer()
                    }
                    NavigationLink {
                        
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
                    NavigationLink {
                        
                    } label: {
                        HStack {
                            Image(systemName: "gearshape")
                                .padding(.horizontal)
                            Text("설정")
                        }
                        .padding()
                        .foregroundColor(.primary)
                        Spacer()
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Toggle("", isOn: $viewModel.isOpen)
                            .toggleStyle(.switch)
                    }
                }
                .navigationTitle(viewModel.titleMessage)
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
