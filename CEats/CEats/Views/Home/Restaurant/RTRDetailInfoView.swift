//
//  RTRDetailInfoView.swift
//  CEats
//
//  Created by gnksbm on 2023/09/05.
//

import SwiftUI
import MapKit

struct RTRDetailInfoView: View {
    let restaurant: Restaurant
    
    @Environment(\.dismiss) private var dismiss
    @State private var pasteboard = UIPasteboard.general
    @State private var place: String = ""
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
                            .font(.system(size: 23, weight: .bold))
                        Text(place)
                            .font(.system(size: 18))
                    }
                    Spacer()
                    Button("주소복사") {
                        pasteboard.string = place
                    }
                    .font(.system(size: 15, weight: .bold))
                }
                .padding(.bottom)
                HStack {
                    Text("전화번호:")
                        .font(.system(size: 18, weight: .bold))
                    RTRDetailInfoMenuView(phoneNumber: restaurant.restaurantInfo.phoneNumber)
                        .foregroundColor(.cEatsBlue)
                }
                Text("상호명: \(restaurant.restaurantInfo.name)")
                    .padding(.bottom)
                Text("영업시간")
                    .font(.system(size: 18, weight: .bold))
                Text(restaurant.restaurantInfo.timeTable)
                    .padding(.bottom)
                Text("매장소개")
                    .font(.system(size: 18, weight: .bold))
                Text(restaurant.restaurantInfo.introduce)
                    .padding(.bottom)
                
            }
            .padding(30)
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                CEatsNavigationBackButton {
                    dismiss()
                }
            }
        }
        .foregroundColor(.primary)
        .bold()
        .navigationTitle("매장정보")
        .onAppear {
            convertLocationToAddress(location: CLLocation(latitude: region.center.latitude, longitude: region.center.longitude))
        }
    }
    
    func convertLocationToAddress(location: CLLocation) {
        
        let geocoder = CLGeocoder()
        
        geocoder.reverseGeocodeLocation(location) { placemarks, error in
            
            guard let placemark = placemarks?.first else { return }
            
            place = "\(placemark.locality ?? "") \(placemark.name ?? "")"
        }
        
    }
}


struct RTRDetailInfoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            RTRDetailInfoView(restaurant: .sampleData)
        }
    }
}
