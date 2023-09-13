//
//  ReviewDetail.swift
//  CEatsManager
//
//  Created by 박범수 on 2023/09/12.


import SwiftUI
import MapKit


struct ReviewDetail: View {
    // MARK: - Properties
    @EnvironmentObject var restaurantViewModel: RestaurantViewModel
    @EnvironmentObject var userViewModel: UserViewModel
    @State private var place = ""
    var restaurant: Restaurant
    
    // MARK: - Views
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    HStack {
                        Text("가게 위치 : \(place)")
                            .bold()
                        // 위도 경도 받아와서 가게 주소
                        Text("가게 전화번호 : \(restaurant.restaurantInfo.phoneNumberString)")
                            .font(.system(size: 20))
                            .bold()
                    }
                    .padding([.leading, .bottom], 20)
                    Divider()
                    
                    ForEach(restaurant.reviews) { review in
                        ReviewInfo(review: review)
                    }
                }
                .navigationTitle("\(restaurant.name)")
                .onAppear {
                    convertLocationToAddress(location: CLLocation(latitude: restaurant.latitude, longitude: restaurant.longitude))
                }
            }
        }
    }
    // CLLocation의 위도, 경도 값을 주소값으로 변경해주는 함수
    // 함수 호출 과정 중, MapKit의 애플 서버 연동 과정 중 에러가 발생할 경우가 있음
    // 조금 기다리면 다시 정상 작동하지만, 빠르게 위도와 경도값이 바뀌는 경우 조금 시간이 걸림
    func convertLocationToAddress(location: CLLocation) {
        
        let geocoder = CLGeocoder()
        
        geocoder.reverseGeocodeLocation(location) { placemarks, error in
            if error != nil {
                print("ERROR!!")
                return
            }
            
            guard let placemark = placemarks?.first else { return }
            
            place = "\(placemark.locality ?? "") \(placemark.name ?? "")"
            
            print("장소:\(place)")
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
