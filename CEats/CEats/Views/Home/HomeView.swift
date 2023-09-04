//
//  HomeView.swift
//  CEats
//
//  Created by 박범수 on 2023/09/04.
//

import SwiftUI
//frame 하나하나 지정해주면 아이패드에서 다 다르게 나올게 뻔하기 때문에,, 수정해줘야함 뷰한테 맞게
struct HomeView: View {
    @State var onLocationSheet: Bool = false
    
    private let layout: [GridItem] = Array(repeating: .init(.flexible()), count: 5)
    
    private let foodType: [String: String] = [
        "korean": "한식",
        "salad": "샐러드",
        "western": "양식",
        "chicken": "치킨",
        "분식": "분식",
        "jokbal": "족발/보쌈",
        "찜탕": "찜/탕",
        "pizza": "피자",
        "짜장면": "중식",
        "해물": "해물",
        "sushi": "일식",
        "coffeeAndTee": "커피/차",
        "dessert": "디저트",
        "fastFood": "패스트푸드"
    ]
    
    var body: some View {
        NavigationStack{
            ScrollView {
                VStack(alignment: .leading) {
                    HStack{
                        Label("위치를 정해주세요", systemImage: "location.circle")
                        Button {
                            onLocationSheet.toggle()
                        } label: {
                            Image(systemName:"chevron.down")
                        }
                        Spacer()
                        Image(systemName: "bell")
                    }
                    .padding(20)
                    HomeSearchView() //검색뷰
                        .padding(.bottom,20)
                    LazyVGrid(columns: layout, alignment: .center) { //각각을 네비게이션 링크로 만들어야함..; 그리고 순서가 계속 바뀜 ㅎㅎ배열로 해놔서
                        ForEach(Array(foodType.keys), id: \.self) { key in
                            let value = foodType[key]!
                            VStack{
                                Spacer()
                                Image(key)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 50, height: 30)
                                    .padding(.bottom,10)
                                    .offset(y:3)
                                Spacer()
                                Text(value)
                                    .font(.footnote)
                                //.offset(y:-2)
                            }
                        }
                    }
                    .padding([.trailing,.leading],20)
                    
                    AdvertisementView()
                        .padding(20)
                    
                    Text("이츠 추천 맛집")
                        .padding(.leading,20)
                        .bold()
                    
                    ScrollView(.horizontal) {
                        LazyHStack(spacing: 20) {
                            ForEach(0..<5, id: \.self) { content in
                                RecommendRestaurantView()
                            }
                        }
                    }
                    .padding(.leading,20)
                }
                .sheet(isPresented: $onLocationSheet) {
                    Text("위치 정하는 곳")
                    //sheet의 위치가 정확히 어디에 있어야 하는지?
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
