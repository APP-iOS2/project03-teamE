//
//  RestaurantDetailInfoView.swift
//  CEats
//
//  Created by gnksbm on 2023/09/05.
//

import SwiftUI
import MapKit

struct RestaurantDetailInfoView: View {
    @Binding var restaurant: Restaurant
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.5718, longitude: 126.9769), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    
    var body: some View {
        ScrollView {
            VStack {
                Map(coordinateRegion: $region, userTrackingMode: .constant(.follow), annotationItems: [Annotation(coordinate: CLLocationCoordinate2D(latitude: 37.5718, longitude: 126.9769))]) { locaiton in
                    MapMarker(coordinate: CLLocationCoordinate2D(latitude: region.center.latitude, longitude: region.center.longitude))
                }
            }
            .frame(width: .screenWidth, height: .screenHeight / 3)
            VStack(alignment: .leading) {
                HStack {
                    VStack(alignment: .leading) {
                        Text(restaurant.name)
                            .font(.system(size: 26, weight: .bold))
                        Text("서울특별시 어쩌구 몰로 99-9, 프로퍼티 필요함")
                            .font(.system(size: 20))
                    }
                    Spacer()
                    Button("주소복사") {
                        
                    }
                    .font(.system(size: 20, weight: .bold))
                }
                .padding(.bottom)
                Group {
                    HStack {
                        Text("전화번호:")
                        RestaurantDetailInfoMenuView()
                    }
                    Text("대표자명: 프로퍼티 필요함")
                    Text("사업자등록번호: 프로퍼티 필요함")
                    Text("상호명: 프로퍼티 필요함")
                        .padding(.bottom)
                }
                Group {
                    Text("영업시간")
                        .font(.system(size: 26, weight: .bold))
                    Text("월요일 ~ 일요일: 0:00 ~ 24:00 프로퍼티 필요함")
                        .padding(.bottom)
                }
                Group {
                    Text("매장소개")
                        .font(.system(size: 26, weight: .bold))
                    Text("안녕하세요 멋쟁이 김치찌개입니다. 프로퍼티 필요함")
                        .padding(.bottom)
                }
                Group {
                    Text("공지사항")
                        .font(.system(size: 26, weight: .bold))
                    Text("리뷰이벤트없음 프로퍼티 필요함")
                        .padding(.bottom)
                }
                Group {
                    Text("원산지정보")
                        .font(.system(size: 26, weight: .bold))
                    Text("전재료 국내산 프로퍼티 필요함")
                }
            }
            .padding(30)
        }
        .navigationTitle("매장정보")
    }
}


struct RestaurantDetailInfoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            RestaurantDetailInfoView(restaurant: .constant(.sampleData))
        }
    }
}
