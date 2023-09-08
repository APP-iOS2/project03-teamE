//
//  MyView.swift
//  CEats
//
//  Created by 박범수 on 2023/09/04.
//

import SwiftUI

struct MyInfoCategoryDetailView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @Binding var selected: MyInfoCategory
    private let grids: [GridItem] = [
        .init(),
        .init(),
        .init(),
    ]
    
    var body: some View {
        switch selected {
        case .review:
            LazyVGrid(columns: grids) {
                ForEach(userViewModel.user.reviews) { review in
                    Image(systemName: review.image ?? "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
        case .order:
            LazyVGrid(columns: grids) {
                ForEach(userViewModel.user.orderHistory) { order in
                    ForEach(order.orderedMenu, id: \.name) { menu in
                        Image(systemName: menu.image ?? "photo")
                    }
                }
            }
        case .favorite:
            VStack {
                ForEach(userViewModel.user.favoriteRestaurant) { restaurant in
                    //RestaurantCardView 컴포넌트
                }
            }
        }
        
    }
}
enum MyInfoCategory: CaseIterable {
    case review, order, favorite
    
    var toString: String {
        switch self {
        case .review:
            return "리뷰"
        case .order:
            return "주문내역"
        case .favorite:
            return "즐겨찾기"
        }
    }
}
struct MyInfoCategoryView: View {
    let categories: [MyInfoCategory]
    @Binding var selected: MyInfoCategory
    
    var body: some View {
        HStack {
            ForEach(categories, id: \.self) { category in
                VStack {
                    Button {
                        selected = category
                    } label: {
                        Text(category.toString)
                            .frame(minWidth: .screenWidth / 3)
                    }
                    .padding(.top)
                    .font(.system(size: 17, weight: category == selected ? .bold : .thin))
                    .foregroundColor(.primary)
                    if selected == category {
                        Capsule()
                            .foregroundColor(.black)
                            .frame(height: 3)
                        
                    } else {
                        Capsule()
                            .foregroundColor(.clear)
                            .frame(height:3)
                    }
                }
            }
        }
    }
}
struct MyInfoView: View {
    @EnvironmentObject private var userViewModel: UserViewModel
    private let categories: [MyInfoCategory] = MyInfoCategory.allCases
    @State private var selected: MyInfoCategory = .review
    
    var body: some View {
        ScrollView {
            VStack {
                Text("\(userViewModel.user.username)")// 내 이름
                    .font(.largeTitle)
                    .padding(5)
                Text("\(userViewModel.user.phoneNumber)")// 내 전화번호
                
                HStack(alignment: .center ,spacing: 10) {
                    VStack {
                        Text("0")
                            .font(.largeTitle)
                            .bold()
                        Text("내가 남긴리뷰")
                            .font(.footnote)
                    }
                    .padding()
                    VStack(alignment: .center) {
                        Text("0")
                            .font(.largeTitle)
                            .bold()
                        Text("도움이 됐어요")
                            .font(.footnote)
                    }
                    .padding()
                    VStack {
                        Text("\(userViewModel.user.favoriteRestaurant.count)")
                            .font(.largeTitle)
                            .bold()
                        Text("즐겨찾기")
                            .font(.footnote)
                    }
                    .padding()
                }
                Spacer()
                .frame(maxWidth: .infinity, minHeight: 5)
                .background(Color.veryLightGray)
                MyInfoCategoryView(categories: categories, selected: $selected)
                MyInfoCategoryDetailView(selected: $selected)
            }
        }
    }
}

struct MyView: View {
    @Binding var tabIndex: Int
    @EnvironmentObject private var userViewModel: UserViewModel
    
    var body: some View {
        NavigationStack {
            Text("\(userViewModel.user.username)")// 내 이름
                .font(.largeTitle)
                .padding(5)
            Text("\(userViewModel.user.phoneNumber)")// 내 전화번호
            
            HStack(alignment: .center ,spacing: 10) {
                VStack {
                    Text("0")
                        .font(.largeTitle)
                        .bold()
                    Text("내가 남긴리뷰")
                        .font(.footnote)
                }
                .padding()
                VStack(alignment: .center) {
                    Text("0")
                        .font(.largeTitle)
                        .bold()
                    Text("도움이 됐어요")
                        .font(.footnote)
                }
                .padding()
                VStack {
                    Text("\(userViewModel.user.favoriteRestaurant.count)")
                        .font(.largeTitle)
                        .bold()
                    Text("즐겨찾기")
                        .font(.footnote)
                }
                .padding()
            }
            // 자세히보기 버튼
            NavigationLink {
                MyInfoView()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 320, height: 50)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.blue, lineWidth: 1)
                        )
                        .foregroundColor(.white)
                        .padding(2)
                    Text("자세히 보기")
                        .bold()
                }
            }
            Image("advertisement")
                .resizable()
                .aspectRatio(contentMode: .fit)
            VStack {
                NavigationLink {
                    MapHomeView(isOpenMapSheet: .constant(true))
                } label: {
                    HStack {
                        Image(systemName: "list.bullet.rectangle.portrait")
                            .imageScale(.large)
                            .padding()
                        Text("주소 관리")
                            .frame(height: 60)
                        Spacer()
                    }
                }
                NavigationLink {
                    FavoriteView(tabIndex: $tabIndex)
                } label: {
                    HStack {
                        Image(systemName: "heart")
                            .imageScale(.large)
                            .padding()
                        Text("즐겨찾기")
                            .frame(height: 60)
                        Spacer()
                    }
                }
                NavigationLink {
                    CouponView(coupons: userViewModel.user.coupons)
                } label: {
                    HStack {
                        Image(systemName: "tag")
                            .imageScale(.large)
                            .padding()
                        Text("할인 쿠폰")
                            .frame(height: 60)
                        if userViewModel.user.coupons.count > 0 {
                            Image(systemName: "\(userViewModel.user.coupons.count).circle.fill")
                                .foregroundColor(.blue)
                        }
                        Spacer()
                    }
                }
            }
            .foregroundColor(.primary)
            .listStyle(.plain)
        }
    }
}

struct CouponView: View {
    let coupons: [Coupon]
    @State private var couponTFString: String = ""
    var body: some View {
        ScrollView {
            HStack {
                Image(systemName: "tag")
                    .padding()
                TextField("", text: $couponTFString, prompt: Text("쿠폰 번호를 입력하세요 (8, 16자리)"))
                    .bold()
            }
            .background(
                RoundedRectangle(cornerRadius: 3)
                    .stroke(.quaternary, lineWidth: 1)
            )
            .padding()
            ForEach(coupons) { coupon in
                CouponCardView(coupon: coupon)
            }
            .padding()
        }
        .navigationTitle("할인쿠폰")
    }
}

struct CouponCardView: View {
    let coupon: Coupon
    
    var dateStr: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY/MM/dd"
        return formatter.string(from: coupon.endDate)
    }
    
    var body: some View {
        HStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 10) {
                Text("\(coupon.discount)원 할인")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundColor(.accentColor)
                Text("배달")
                    .padding(.vertical, 3)
                    .padding(.horizontal, 10)
                    .background(.quaternary)
                    .cornerRadius(5)
                    .padding(.bottom)
                Text("\(coupon.restaurant.name) 금액 할인 쿠폰")
                    .bold()
                Text("\(coupon.priceCondition) 이상 주문시")
                Text("\(dateStr)까지 사용가능")
            }
            .padding(.vertical, 20)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.background)
            .cornerRadius(10)
            NavigationLink {
                RTRView(restaurant: coupon.restaurant)
            } label: {
                VStack {
                    Image(systemName: "arrow.right")
                    Text("적용가능\n매장보기")
                        .bold()
                }
            }
            .foregroundColor(.primary)
            .padding()
            .frame(maxHeight: .infinity)
            .background(.background)
            .cornerRadius(10)
        }
        .clipped()
        .shadow(color: .lightgray, radius: 10)
        .frame(maxWidth: .infinity)
    }
}

struct MyView_Previews: PreviewProvider {
    @State private static var tabIndex: Int = 4
    static var previews: some View {
        MyView(tabIndex: $tabIndex)
            .environmentObject(UserViewModel())
    }
}
