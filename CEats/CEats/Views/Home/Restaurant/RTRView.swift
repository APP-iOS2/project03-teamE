//
//  RTRView.swift
//  CEats
//
//  Created by gnksbm on 2023/09/04.
//

import SwiftUI

extension UINavigationController: ObservableObject, UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}

struct RTRView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.colorScheme) private var colorScheme
    @EnvironmentObject private var userViewModel: UserViewModel
    
    @State private var selectedIndex = 0
    @State private var isOpenCartSheet: Bool = false
    @State private var selected = ""

    let restaurant: Restaurant
    
    private var totalCount: Int {
        return restaurant.mainImage.count
    }
    
    var body: some View {
        VStack{
            ScrollViewReader { proxy in
                ScrollView(showsIndicators: false) {
                    GeometryReader { geo in
                        let offset = geo.frame(in: .global).minY
                        let btnColor = geo.frame(in: .global).origin.y > 0 ? 1 : (95 + geo.frame(in: .global).minY) / 100
                        let colorY = colorScheme == .dark ? -btnColor : btnColor
                        NavigationLink(destination: FullScreenImageView(imageName: restaurant.mainImage)) {
                            RTRTitleImageView(imageNamss: restaurant.mainImage, selectedIndex: $selectedIndex)
                                .frame(width: .screenWidth, height: (.screenHeight / 4) + (offset > 0 ? offset : 0))
                                .offset(y: offset > 0 ? -offset : 0)
                        }
                        .toolbar {
                            ToolbarItem(placement: .navigationBarLeading) {
                                navigationBackBtn
                                .foregroundColor(Color(red: colorY, green: colorY, blue: colorY))
                                .shadow(color: colorScheme == .dark ? .gray : .clear, radius: 1)
                            }
                            ToolbarItem(placement: .navigationBarTrailing) {
                                HStack {
                                    ShareLink(item: "") {
                                        Image(systemName: "square.and.arrow.up")
                                            .shadow(color: colorScheme == .dark ? .gray : .clear, radius: 1)
                                    }
                                    .padding(.trailing, 10)
                                    Button {
                                        userViewModel.likeButtonTapped(restaurant: restaurant)
                                        userViewModel.updateFavoriteRTR(user: userViewModel.user)
                                    } label: {
                                        Image(systemName: userViewModel.user.favoriteRestaurant.contains(where: { $0.id == restaurant.id }) ? "heart.fill" : "heart")
                                            .shadow(color: colorScheme == .dark ? .gray : .clear, radius: 1)
                                    }
                                }
                            }
                        }
                        .toolbarBackground(
                            geo.frame(in: .global).minY > -.screenHeight / 4 ? .hidden : .automatic,
                            for: .navigationBar
                        )
                        .foregroundColor(Color(red: colorY, green: colorY, blue: colorY))
                        .bold()
                    }
                    .frame(width: .screenWidth, height: .screenHeight / 4)
                    
                    HStack {
                        Text("\(selectedIndex + 1) / \(totalCount)")
                            .padding(.vertical, 5)
                            .padding(.horizontal)
                            .font(.caption)
                            .foregroundColor(.white)
                            .background(Color.secondary)
                            .cornerRadius(.greatestFiniteMagnitude)

                        Spacer()
                    }
                    .clipped()
                    .frame(width: .screenWidth * 0.85)
                    .padding(.top, -.screenHeight / 9)
                    
                    RTRTitleInfoView(restaurant: restaurant)
                        .frame(width: .screenWidth * 0.85, height: .screenHeight / 9)
                        .background(.background)
                        .cornerRadius(3)
                        .clipped()
                        .shadow(color: .secondary, radius: 2)
                        .padding(.top, -.screenHeight / 12)
                    RTRSubInfoView(restaurant: restaurant)
                        .padding(.top, 30)
                        .padding(.horizontal)
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack {
                            ForEach(restaurant.reviews, id: \.id) { review in
                                NavigationLink {
                                    ReviewInfoView(restaurant: restaurant, scrollID: review.id)
                                } label: {
                                    ReviewMinimalView(review: review)
                                        .padding()
                                        .background(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color.lightgray)
                                        )
                                        .frame(height: .screenHeight / 10)
                                        .padding(.trailing, 10)
                                }
                                .foregroundColor(.primary)
                            }
                        }
                        .padding()
                    }
                    RTRFoodCategoryView(categories: restaurant.foodCategory, selected: $selected)
                        .frame(width: .screenWidth)
                    RTRFoodListView(restaurant: restaurant)
                    
                }
                .onChange(of: selected) { newValue in
                    print("onchangh: \(newValue)")
                    guard newValue != "" else { return }
                    withAnimation {
                        proxy.scrollTo(selected, anchor: .top)
                    }
                }
            }

            if userViewModel.user.foodCart?.cart.count ?? 0 > 0 {
                HomeCartView(isOpenMapSheet: $isOpenCartSheet)
                    .padding(.top, -10)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    var navigationBackBtn: some View {
        Button {
            dismiss()
        } label: {
            Image(systemName: "arrow.left")
                .bold()
        }
    }
}

struct RTRView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            RTRView(restaurant: Restaurant.sampleDummys[0])
        }
        .environmentObject(UserViewModel())
    }
}
