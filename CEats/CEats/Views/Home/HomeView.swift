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
    @StateObject var restaurantViewModel = RestaurantViewModel()
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
        .environmentObject(restaurantViewModel)
    }
}

struct HeaderView: View {
    @Binding var isOpenMapSheet: Bool
    
    var body: some View {
        HStack {
            Button(action: {
                isOpenMapSheet = true
            }) {
                HStack {
                    Label("위치를 정해주세요", systemImage: "location.circle")
                        .foregroundColor(.black)
                    Image(systemName: "chevron.down")
                }
            }
            Spacer()
        }
        .padding(20)
    }
}

struct HomeSearchBarView: View {
    @Binding var searchText: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: .screenWidth * 0.9, height: .screenHeight * 0.05)
                .foregroundColor(.white)
                .cornerRadius(30)
                .shadow(radius: 2)
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.black)
                TextField("ooo님, 서브웨이 어때요?", text: $searchText)
                    .frame(width: .screenWidth * 0.43)
                Spacer()
            }
            .padding(.leading,40)
        }
        .padding(.bottom,4)
    }
}

struct FoodTypeGridView: View {
    var body: some View {
        LazyVGrid(columns: layout, alignment: .center) {
            ForEach(FoodType.allCases, id: \.self) { content in
                NavigationLink(destination: FoodStoreListView(selectedFoodType: content)) {
                    VStack {
                        Spacer()
                        Image("\(content)")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60, height: 40)
                            .padding(.bottom, 3)
                            .offset(y: 3)
                        Spacer()
                        Text(content.rawValue)
                            .font(.footnote)
                            .foregroundColor(.black)
                            .padding(.bottom, 10)
                    }
                }
            }
        }
        .padding([.trailing, .leading], 20)
    }
    
    private let layout: [GridItem] = Array(repeating: .init(.flexible()), count: 5)
}

struct RecommendedRestaurantsView: View {
    @EnvironmentObject var restaurantViewModel: RestaurantViewModel
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 20) {
                ForEach(restaurantViewModel.restaurants) { restaurant in
                    NavigationLink {
                        RTRView(restaurant: restaurant)
                    } label: {
                        RecommendRestaurantView(restaurant: restaurant)
                    }
                }
            }
        }
        .scrollIndicators(.hidden)
        .padding(.leading, 20)
        .padding(.bottom, 20)
    }
}


struct HomeCartView: View {
    @Binding var order: Order
    
    var body: some View {
        VStack(spacing:0){
            NavigationLink {
                // 바인딩 어케 사용하죠?
                CartView()
            } label: {
                VStack(spacing:0) {
                    HStack{
                        ZStack{
                            Circle()
                                .frame(width: 30)
                            Text("\(order.orderedMenu.count)")
                                .foregroundColor(.blue)
                        }
                        Text("카트보기")
                        Spacer()
                        ZStack{
                            Rectangle()
                                .frame(width: 80, height: 1)
                            Text("10,700원")
                        }
                        .foregroundColor(.lightgray)
                        
                        Text("\(order.orderedMenu[0].price)원")
                            .font(.system(size: 18, weight: .bold))
                        
                    }
                }
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(.blue)
            }
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(RestaurantViewModel())
            .environmentObject(UserViewModel())
    }
}
