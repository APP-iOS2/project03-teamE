//
//  CartMenuView.swift
//  CEats
//
//  Created by 박범수 on 2023/09/07.
//

import SwiftUI

// 장바구니: 사용자1 -> 가게1(음식1, 음식2)
struct CartMenuView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @EnvironmentObject var cartStore: RestaurantViewModel
    @State private var count = 1
    var colorSet: UIColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("홍콩반점 서울시청점")
                    .font(.title3)
                    .bold()
                ForEach(userViewModel.user.foodCart?.foodCart ?? [], id: \.name) { cart in
                    VStack {
                        Divider()
                        HStack {
                            VStack(alignment: .leading) {
                                Text(cart.name)
                                Text(cart.description)
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                
                                Text("\(cart.price)원")
                                    .bold()
                            }
                            Spacer()
                            ZStack {
                                Capsule()
                                    .fill(Color(colorSet))
                                    .frame(width: 100, height: 30)
                                HStack {
                                    Button {
                                        count -= 1
                                    } label: {
                                        if count == 1 {
                                            Image(systemName: "trash")
                                                .font(.caption)
                                            
                                        } else {
                                            Image(systemName: "minus")
                                                .font(.caption)
                                        }
                                    }
                                    .padding()
                                    Text("\(count)")
                                    
                                    Button {
                                        count += 1
                                    } label: {
                                        Image(systemName: "plus")
                                            .font(.caption)
                                    }
                                    .padding()
                                }
                                .foregroundColor(.white)
                            }
                        }
                    }
                }
                Divider()
            }
            .padding()
            NavigationLink {
                
            } label: {
                Text("+ 메뉴 추가")
            }
            .font(.caption)
            VStack {
                HStack {
                    Text("함께 주문하면 좋을 메뉴")
                        .bold()
                        .padding()
                    Spacer()
                }
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(userViewModel.user.foodCart?.foodCart ?? [], id: \.name) { cart in
                            
                            Button {
                                
                            } label: {
                                HStack {
                                    VStack {
                                        Text(cart.name)
                                            .foregroundColor(.black)
                                        Text("\(cart.price)")
                                    }
                                    Button {
                                        
                                    } label: {
                                        Image(systemName: "plus.circle")
                                            .font(.title)
                                    }
                                }
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.gray, lineWidth: 1)
                                    )
                            }
                        }
                    }
                }
                .padding()
            }
        }
    }
}

struct CartMenuView_Previews: PreviewProvider {
    static var previews: some View {
        CartMenuView()
            .environmentObject(RestaurantViewModel())
            .environmentObject(UserViewModel())
    }
}
