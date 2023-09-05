//
//  HomeSearchDetailView.swift
//  CEats
//
//  Created by 유하은 on 2023/09/05.
//

import SwiftUI

struct HomeSearchDetailView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var restaurantViewModel: RestaurantViewModel
    @State var searchText: String = ""
    @State var isSubmit: Bool = false
    private let array = [
            "불고기",
            "비빔밥",
            "김치찌개",
            "삼겹살",
            "떡볶이",
            "갈비",
            "부대찌개",
            "해물파전",
            "냉면",
            "순두부찌개",
            "된장찌개",
            "짜장면",
            "볶음밥",
            "불닭볶음면",
            "김밥",
            "잡채",
            "곰탕",
            "닭갈비",
            "전복죽",
            "육회"
    ] //요거는 이제 레스토랑 안에 있는 배열이 되어야겠지,,
    var body: some View {
        NavigationStack{
            VStack{
                /*
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.backward")
                        .bold()
                        .offset(x: -(.screenWidth/2.2))
                }
                 */

                ZStack{
                    Rectangle()
                        .frame(width: 350,height: 45) //뷰 바운드로 수정
                        .foregroundColor(.white)
                        .cornerRadius(30)
                        .shadow(radius: 3)
                    ZStack{
                        HStack{
                            Image(systemName: "magnifyingglass")
                            TextField("ooo님, 서브웨이 어때요?", text: $searchText)
                            
                            if !searchText.isEmpty {
                                Button(action: {
                                    self.searchText = ""
                                }) {
                                    Image(systemName: "xmark.circle.fill")
                                }
                            } else {
                                EmptyView()
                            }
                        }
                        .padding(.leading,40)
                    }
                }
                
                //            PopularSearchView()
                //                .padding(.leading,30)
                //                .padding(.top,30)
                //            Rectangle()
                //                .foregroundColor(.veryLightGray)
                //                .frame(width: .screenWidth, height: 10)
                //            RecentSearchView()
                //                .padding(20)
                Spacer()
                List {
                    ForEach(array.filter{$0.hasPrefix(searchText) || searchText == ""}, id:\.self) {
                        searchText in Text(searchText)
                    }
                }
                .onSubmit{
                    isSubmit.toggle() //문제가 될 수도 있음.
                }
                .listStyle(PlainListStyle())
                //            .onTapGesture {
                //                hideKeyboard()
                //            }
            }
        }
    }
    /*
    func searchRestaurant(_ restaurants : [Restaurant], _ searchString: String, _ pickSearch: String) -> [Restaurant] {
            guard searchString.isEmpty else {
                return restaurants.filter { restaurant in
                    if pickSearch == "이름" {
                        return restaurant.name.contains(searchString) ?? false
                    } else {
                        return restaurant.name.contains(searchString)
                    }
                }
            }
            return restaurants
    }
     */
}

struct HomeSearchDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HomeSearchDetailView(restaurantViewModel: RestaurantViewModel())
    }
}
