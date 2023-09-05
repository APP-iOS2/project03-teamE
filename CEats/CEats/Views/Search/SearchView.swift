//
//  SearchView.swift
//  CEats
//
//  Created by 박범수 on 2023/09/04.
//

import SwiftUI

struct SearchView: View {
    
    
    @State private var searchTerm = ""
    var columns = Array(repeating: GridItem(.flexible(), spacing: 20), count: 3)
    let imageSize: CGFloat = 88
    
    var body: some View {
        VStack {
            HStack {
                SearchBarView(text: $searchTerm)
                    .padding(.horizontal)
                    .cornerRadius(30)
                    .shadow(radius: 5)
                Image(systemName: "magnifyingglass")
            }
            Spacer()
            ScrollView {
                LazyVGrid(columns: columns, spacing: 30) {
                    ForEach(FoodType.allCases, id: \.self) { food in
                        Button {
                            //                                    NavigationLink(destination: DetailView(food: food)) { 이미지를 누르면 뷰로 이동 부분
                        } label: {
                            VStack(alignment: .leading, spacing: 15) {
                                Image("\(food)")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(Circle())
                                    .frame(width: imageSize, height: imageSize)
                                Text("\(food.rawValue)")
                                    .foregroundColor(.black)
                            }
                        }
                    }
                    .padding(.top)
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

