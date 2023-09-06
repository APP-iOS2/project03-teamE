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
    var array: [String] {
        restaurantViewModel.collectAllFoodNames()
    }
     //요거는 이제 레스토랑 안에 있는 배열이 되어야겠지,,
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
            }
        }
    }
}

struct HomeSearchDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HomeSearchDetailView(restaurantViewModel: RestaurantViewModel())
    }
}
