//
//  HomeView.swift
//  CEats
//
//  Created by 박범수 on 2023/09/04.
//

import SwiftUI

struct HomeView: View {
    // MARK: - Properties
    @EnvironmentObject var restaurantViewModel: RestaurantViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var searchText: String = ""
    @State private var isOpenMapSheet: Bool = false
    @State private var isOpenCartSheet: Bool = false
    var order: Order = .sampleData
    
    private let layout: [GridItem] = Array(repeating: .init(.flexible()), count: 5)
    
    // MARK: - View
    var body: some View {
        NavigationStack{
                ScrollView {
                    VStack(alignment: .leading) {
                        HStack {
                            Button {
                                isOpenMapSheet = true
                            } label: {
                                HStack {
                                    Label("위치를 정해주세요", systemImage: "location.circle") //여기에 위치 값이 들어가야함.
                                        .foregroundColor(.black)
                                    
                                    Image(systemName:"chevron.down")
                                }
                            }
                            Spacer()
                        }
                    }
                    .padding(20)
                    
                    NavigationLink {
                        HomeSearchDetailView()
                    } label: {
                        ZStack{
                            Rectangle()
                                .frame(width: 350,height: 45) //뷰 바운드로 수정
                                .foregroundColor(.white)
                                .cornerRadius(30)
                                .shadow(radius: 5)
                            HStack{
                                Image(systemName: "magnifyingglass")
                                    .padding(.leading,40)
                                    .foregroundColor(.black)
                                TextField("ooo님, 서브웨이 어때요?", text: $searchText)
                                    .offset(x: -30)
                            }
                        }
                        .padding(.bottom, 20)
                    }
                    LazyVGrid(columns: layout, alignment: .center) {
                        ForEach(FoodType.allCases, id: \.self) { content in
                            NavigationLink {
                                FoodStoreListView(selectedFoodType: content)
                            } label: {
                                VStack{
                                    Spacer()
                                    Image("\(content)")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 60, height: 40)
                                        .padding(.bottom,3)
                                        .offset(y:3)
                                    Spacer()
                                    Text(content.rawValue)
                                        .font(.footnote)
                                        .foregroundColor(.black)
                                        .padding(.bottom,10)
                                }
                            }
                        }
                    }
                    .padding([.trailing,.leading],20)
                    NavigationLink {
                        AdvertisementContentsView()
                    } label: {
                        AdvertisementView()
                    }
                    .padding(20)
                    
                    VStack(alignment: .leading) {
                        HStack{
                            Text("이츠 추천 맛집")
                                .padding(.leading,20)
                                .bold()
                            Spacer()
                        }
                    }
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
                    .padding(.leading,20)
                }
                .padding(.bottom, -10)
                .scrollIndicators(.hidden)
            
            if order.orderedMenu.count > 0 {
                Button {
                    isOpenCartSheet.toggle()
                } label: {
                    VStack {
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
        .fullScreenCover(isPresented: $isOpenMapSheet, content: {
            MapHomeView(isOpenMapSheet: $isOpenMapSheet)
        })
        .fullScreenCover(isPresented: $isOpenCartSheet, content: {
            CartView(isOpenMapSheet: $isOpenMapSheet)
        })
        
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(RestaurantViewModel())
    }
}
