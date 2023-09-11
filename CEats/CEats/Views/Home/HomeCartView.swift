//
//  HomeCartView.swift
//  CEats
//
//  Created by 박범수 on 2023/09/10.
//

import SwiftUI

struct HomeCartView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @Binding var user: User
    @Binding var isOpenMapSheet: Bool
    
    var body: some View {
        VStack {
            NavigationLink {
                CartView(userViewModel: UserViewModel(), isOpenMapSheet: $isOpenMapSheet)
            } label: {
                VStack {
                    HStack{
                        ZStack{
                            Circle()
                                .frame(width: 30)
                            Text("\(user.foodCart?.cart.count ?? 0)")
                                .foregroundColor(.blue)
                        }
                        Text("카트보기")
                        Spacer()
                        ZStack{
                            Rectangle()
                                .frame(width: 80, height: 1)
                            Text("\(user.foodCart?.fee ?? 0) 원")
                        }
                        .foregroundColor(.lightgray)
                        
                        Text("\(user.foodCart?.fee ?? 0) 원")
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
                .environmentObject(UserViewModel())
        }
    }
}
