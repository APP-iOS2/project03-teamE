//
//  ReviewInfoView.swift
//  CEats
//
//  Created by 변상우 on 2023/09/04.
//

import SwiftUI

struct ReviewInfoView: View {
    
    @State private var restaurantName = "춘리마라탕 산남점"
    @State private var restaurantGrade = "4.9"
    @State private var reviewCount = 4
    
    @State private var showSortSheet: Bool = false
    @State private var currentSortOption: SortOption = .latest
    
    let maxRating: Int = 5
    let currentRating: Int = 5
    
    enum SortOption: String, Identifiable, CaseIterable {
        case latest = "최신순"
        case helpful = "리뷰 도움순"
        case highRating = "별점 높은 순"
        case lowRating = "별점 낮은 순"
        
        var id: String { self.rawValue }
    }
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text("\(restaurantGrade)")
                        .font(.largeTitle)
                        .bold()
                        .padding(.trailing, 20)
                    
                    VStack(alignment: .leading) {
                        HStack(spacing: 0) {
                            ForEach(1...maxRating, id: \.self) { index in
                                Image(systemName: index <= currentRating ? "star.fill" : "star")
                                    .foregroundColor(index <= currentRating ? .yellow : .gray)
                            }
                        }
                        .padding(.leading, 1)
                        
                        Text("리뷰 \(reviewCount)개")
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
                
                HStack(alignment: .bottom) {
                    VStack(alignment: .leading) {
                        Text("임**")
                            .padding(.bottom, 2)
                        HStack(spacing: 0) {
                            ForEach(1...maxRating, id: \.self) { index in
                                Image(systemName: index <= currentRating ? "star.fill" : "star")
                                    .foregroundColor(index <= currentRating ? .yellow : .gray)
                            }
                        }
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
                
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)
                
                HStack {
                    Text("배달이 좀 오래됐어요 근데 맛있어요~~")
                    Spacer()
                }
                .padding(.bottom, 10)
                
                HStack {
                    Text("[맛집랭킹1위]내맘대로 골라 마라탕")
                        .font(.footnote)
                        .foregroundColor(.white)
                        .padding(10)
                        .background(Color.cyan)
                        .cornerRadius(25)
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

                
                Spacer()
            }
            .padding(.horizontal, 25)
            
            .navigationTitle("\(restaurantName) 리뷰")
            .navigationBarTitleDisplayMode(.inline)
        }
        .sheet(isPresented: $showSortSheet) {
            NavigationStack {
                ForEach(SortOption.allCases, id: \.self) { option in
                    Divider()
                    Button(action: {
                        currentSortOption = option
                        showSortSheet = false
                        // 선택한 정렬 옵션에 따라 데이터를 정렬하는 로직을 추가하세요.
                        // 예: 최신순, 도움순, 별점 높은 순, 별점 낮은 순 등
                    }) {
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
    }
}

struct ReviewInfoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ReviewInfoView()
        }
    }
}
