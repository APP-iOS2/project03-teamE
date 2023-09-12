//
//  ReviewDetail.swift
//  CEatsManager
//
//  Created by 박범수 on 2023/09/12.
//

import SwiftUI
import CoreLocation
import MapKit


struct ReviewDetail: View {
    // MARK: - Properties
    @EnvironmentObject var restaurantViewModel: RestaurantViewModel
    @EnvironmentObject var userViewModel: UserViewModel
    var restaurant: Restaurant
    
    // MARK: - Views
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    HStack {
                        Text("가게 위치 : ")
                            .bold()
                        // 위도 경도 받아와서 가게 주소
                    }
                    Text("가게 전화번호 : \(restaurant.restaurantInfo.phoneNumberString)")
                        .bold()
                }
                .font(.system(size: 30))
                .padding(.bottom, 50)
                
                ForEach(restaurant.reviews) { review in
                    ReviewInfo(review: review)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 1)
                        )
                        .padding(.bottom, 30)
                }
            }
            .padding(20)
            .navigationTitle("\(restaurant.name)")
        }
    }
}

struct ReviewDetail_Previews: PreviewProvider {
    static var previews: some View {
        ReviewDetail(restaurant: Restaurant.sampleArray[0])
            .environmentObject(RestaurantViewModel())
            .environmentObject(UserViewModel())
    }
}
