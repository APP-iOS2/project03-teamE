//
//  HomeCartView.swift
//  CEats
//
//  Created by 박범수 on 2023/09/10.
//

import SwiftUI

struct HomeCartView: View {
    @Binding var user: User
    @Binding var isOpenMapSheet: Bool
    
    var body: some View {
        VStack {
            NavigationLink {
                CartView(isOpenMapSheet: $isOpenMapSheet)
            } label: {
                VStack(spacing:0) {
                    HStack{
                        ZStack{
                            Circle()
                                .frame(width: 30)
                            Text("\(user.cart?.foodCart.count ?? 0)")
                                .foregroundColor(.blue)
                        }
                        Text("카트보기")
                        Spacer()
                        ZStack{
                            Rectangle()
                                .frame(width: 80, height: 1)
                            Text("\(user.cart?.fee ?? 0) 원")
                        }
                        .foregroundColor(.lightgray)
                        
                        Text("\(user.cart?.fee ?? 0) 원")
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

struct HomeCartView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            HomeCartView(user: .constant(.sampleData), isOpenMapSheet: .constant(false))
                .environmentObject(RestaurantViewModel())
        }
    }
}
