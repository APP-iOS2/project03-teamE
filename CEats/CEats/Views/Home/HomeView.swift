//
//  HomeView.swift
//  CEats
//
//  Created by 박범수 on 2023/09/04.
//

import SwiftUI
//frame 하나하나 지정해주면 아이패드에서 다 다르게 나올게 뻔하기 때문에,, 수정해줘야함 뷰한테 맞게
//.
struct HomeView: View {
    @State private var isOpenMapSheet: Bool = false
    @State var searchText: String = ""
    @State var order: Order = Order.sampleData
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView{
                    HeaderView(isOpenMapSheet: $isOpenMapSheet)
                    //헤더뷰, 위치 정해주는 뷰
                    NavigationLink {
                        HomeSearchDetailView()
                    } label: {
                        HomeSearchBarView(searchText: $searchText)
                    }
                    //서치뷰
                    FoodTypeGridView()
                    //푸드 타입 정하는 뷰
                    AdvertisementView()
                        .padding(18)
                    //광고
                    RecommendedRestaurantsView()
                    //추천맛집뷰
                }
                .scrollIndicators(.hidden)

                if order.orderedMenu.count > 0 {
                    HomeCartView(order: $order)
                }
            }
        }
        .fullScreenCover(isPresented: $isOpenMapSheet, content: {
            MapHomeView(isOpenMapSheet: $isOpenMapSheet)
        })
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(RestaurantViewModel())
    }
}
