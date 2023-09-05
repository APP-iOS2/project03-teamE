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
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    private let layout: [GridItem] = Array(repeating: .init(.flexible()), count: 5)
    
    var body: some View {
        NavigationStack{
            ScrollView {
                VStack(alignment: .leading) {
                    HStack{
                        Label("위치를 정해주세요", systemImage: "location.circle") //여기에 위치 값이 들어가야함.
                        NavigationLink {
                            MapHomeView()
                        } label: {
                            Image(systemName:"chevron.down")
                        }
                        Spacer()
                        Image(systemName: "bell")
                    }
                    .padding(20)
                    
                    NavigationLink {
                        HomeSearchDetailView(restaurantViewModel: restaurantViewModel)
                    } label: {
                        HomeSearchView(restaurantViewModel: restaurantViewModel) //검색뷰
                            .padding(.bottom, 20)
                    }
                    LazyVGrid(columns: layout, alignment: .center) { //각각을 네비게이션 링크로 만들어야함..
                        ForEach(FoodType.allCases, id: \.self) { content in
                            NavigationLink {
                                //content ==> 푸드 타입이 들어감 
                            } label: {
                                VStack{
                                    Spacer()
                                    Image("\(content)")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 50, height: 30)
                                        .padding(.bottom,10)
                                        .offset(y:3)
                                    Spacer()
                                    Text(content.rawValue)
                                        .font(.footnote)
                                        .foregroundColor(.black)
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
                    
                    Text("이츠 추천 맛집")
                        .padding(.leading,20)
                        .bold()
                    
                    ScrollView(.horizontal) {
                        LazyHStack(spacing: 20) {
                            ForEach(0..<5, id: \.self) { content in
                                NavigationLink {
                                    RestaurantView(restaurant: .constant(.sampleData))
                                } label: {
                                    RecommendRestaurantView()
                                }
                            }
                        }
                    }
                    .padding(.leading,20)
                }
            }
        }
    }
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
