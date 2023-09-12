//
//  ReviewInfoView.swift
//  CEats
//
//  Created by 변상우 on 2023/09/04.
//

import SwiftUI

struct ReviewInfoView: View {
    @State var restaurant: Restaurant
    
    var scrollID: String?
    @Environment(\.dismiss) private var dismiss
    
    @State private var showSortSheet: Bool = false
    @State private var currentSortOption: SortOption = .latest
    
    var navigationBackButton: some View {
        Button {
            dismiss()
        } label: {
            Image(systemName: "arrow.left")
        }
        .foregroundColor(.primary)
        .bold()
    }
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                VStack {
                    HStack {
                        Text(restaurant.scoreMessage)
                            .font(.largeTitle)
                            .bold()
                            .padding(.trailing, 20)
                        VStack(alignment: .leading) {
                            if let score = restaurant.score {
                                score.doubleToStarView
                                    .padding(.leading, 1)
                            }
                            Text("리뷰 \(restaurant.reviews.count)개")
                                .bold()
                                .padding(.top, 3)
                        }
                        Spacer()
                    }
                    .padding(.top, 30)
                    HStack {
                        Spacer()
                        
                        Button {
                            showSortSheet = true
                        } label: {
                            HStack {
                                Text("\(currentSortOption.rawValue)")
                                Image(systemName: "chevron.down")
                            }
                            .foregroundColor(.black)
                        }
                    }
                    .padding(.top, 10)
                    ForEach(restaurant.reviews) { review in
                        ReviewCardView(review: review)
                            .id(review.id)
                    }
                }
                .padding(.horizontal, 25)
            }
            .navigationTitle("\(restaurant.name) 리뷰")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
            .navigationBarItems(leading: navigationBackButton)
            .sheet(isPresented: $showSortSheet) {
                NavigationStack {
                    ForEach(SortOption.allCases) { option in
                        Divider()
                        Button {
                            currentSortOption = option
                            currentSortOption.sort(reviewList: &restaurant.reviews)
                            showSortSheet = false
                            // 선택한 정렬 옵션에 따라 데이터를 정렬하는 로직을 추가하세요.
                            // 예: 최신순, 도움순, 별점 높은 순, 별점 낮은 순 등
                        } label: {
                            Text(option.rawValue)
                                .foregroundColor(.black)
                                .padding(10)
                        }
                    }
                    .listStyle(.plain)
                    .listRowSeparator(.hidden)
                    
                    .navigationBarTitle("리뷰 정렬")
                    .navigationBarTitleDisplayMode(.inline)
                    
                    .navigationBarItems(trailing: Button(action: {
                        showSortSheet = false
                    }) {
                        Text("닫기")
                    })
                }
                .presentationDetents([.height(270)])
            }
            .onAppear {
                withAnimation {
                    if let scrollID {
                        proxy.scrollTo(scrollID, anchor: .top)
                    }
                }
            }
        }
    }
    
    enum SortOption: String, Identifiable, CaseIterable {
        case latest = "최신순"
        case helpful = "리뷰 도움순"
        case highRating = "별점 높은 순"
        case lowRating = "별점 낮은 순"
        
        var id: String { self.rawValue }
        
        func sort(reviewList: inout [Review]) {
            reviewList.sort {
                switch self {
                case .latest:
                    return $0.createdAt > $1.createdAt
                case .helpful:
                    return true
                case .highRating:
                    return $0.score > $1.score
                case .lowRating:
                    return $0.score < $1.score
                }
            }
        }
    }
}

struct ReviewCardView: View {
    let review: Review
    
    var body: some View {
        VStack {
            HStack(alignment: .bottom) {
                VStack(alignment: .leading) {
                    Text(review.writer)
                        .padding(.bottom, 2)
                    review.score.doubleToStarView
                }
                Spacer()
                
                Button {
                    print("신고하기")
                } label: {
                    Text("신고")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
            }
            .padding(.top, 30)
            Image(review.image ?? "kimchiSoup")
                .resizable()
                .scaledToFit()
                .frame(height: 300)
            
            HStack {
                Text(review.contents)
                Spacer()
            }
            .padding(.bottom, 10)
            
            HStack {
                ForEach(review.menus, id: \.name) { menu in
                    Text(menu.name)
                        .font(.footnote)
                        .foregroundColor(.white)
                        .padding(10)
                        .background(Color.cyan)
                        .cornerRadius(25)
                }
                Spacer()
            }
            .padding(.bottom, 10)
            HStack {
                Text("리뷰가 도움이 되었나요?")
                    .font(.footnote)
                Spacer()
            }
            HStack {
                Group {
                    Button {
                        
                    } label: {
                        Text("도움이 돼요")
                            .font(.footnote)
                            .foregroundColor(.gray)
                            .padding(10)
                            .frame(width: 170, height: 40)
                            .border(Color.gray, width: 1)
                    }
                    
                    Button {
                        
                    } label: {
                        Text("도움이 안돼요")
                            .font(.footnote)
                            .foregroundColor(.gray)
                            .padding(10)
                            .frame(width: 170, height: 40)
                            .border(Color.gray, width: 1)
                    }
                }
            }
            
        }
    }
}

struct ReviewInfoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ReviewInfoView(restaurant: .sampleData)
        }
    }
}
