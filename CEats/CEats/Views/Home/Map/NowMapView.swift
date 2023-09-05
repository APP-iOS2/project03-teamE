//
//  NowMapView.swift
//  S_nowManCustomer
//
//  Created by 변상우 on 2023/08/23.
//

import SwiftUI
import MapKit

struct Annotation: Identifiable {
    var id = UUID()
    let coordinate: CLLocationCoordinate2D
}

struct NowMapView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    //    @ObservedObject var locationManager: LocationManager = LocationManager()
    
    @Binding var isOpenMapSheet: Bool
    
    @Binding var isSelectedPlace: String
    @Binding var selectedPlaceLat: Double
    @Binding var selectedPlaceLong: Double
    
    @State var isChangingPlace: Bool = false
    @State private var showMessage = true
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.5718, longitude: 126.9769), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    
    @State private var place: String = ""
    
    var lat: Double {
        region.center.latitude
    }
    
    var long: Double {
        region.center.longitude
    }
    
    var body: some View {
        VStack {
            ZStack{
                Map(coordinateRegion: $region, userTrackingMode: .constant(.follow), annotationItems: [Annotation(coordinate: CLLocationCoordinate2D(latitude: 37.5718, longitude: 126.9769))]) { locaiton in
                    MapMarker(coordinate: CLLocationCoordinate2D(latitude: region.center.latitude, longitude: region.center.longitude))
                }
                if showMessage {
                    MapGuide()
                        .offset(y:-(.screenHeight/3.5))
                }
            }
            //MapViewCoordinator(locationManager: locationManager)
            Text("\(place)")
                .padding()
            
            NavigationLink {
                MapDetailView(isOpenMapSheet: $isOpenMapSheet, selectedPlace: $place, selectedPlaceLat: $region.center.latitude, selectedPlaceLong: $region.center.longitude)
            } label: {
                Text("설정하기")
                    .foregroundColor(.white)
                    .padding(.horizontal, 100)
                    .padding(.vertical, 10)
                    .frame(width: .screenWidth * 0.8, height: 50)
                    .background(Color.blue)
            }
            .padding(.bottom)

            
//            Button {
//                // 위도 경도 값 저장
//                isSelectedPlace = place
//                selectedPlaceLat = lat
//                selectedPlaceLong = long
//            } label: {
//                Text("설정하기")
//                    .padding(.horizontal, 100)
//                    .padding(.vertical, 10)
//            }
//            .buttonStyle(.borderedProminent)
        }
        .navigationTitle("주소 설정")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
        
        .onChange(of: region) { newValue in
            if !isChangingPlace {
                isChangingPlace = true
                convertLocationToAddress(location: CLLocation(latitude: region.center.latitude, longitude: region.center.longitude))
            } else {
                print("LOCK!")
            }
        }
        .onTapGesture(perform: {
            showMessage = false //사용자가 터치하는 순간 바꾸고 싶음..
        })
        .task {
            showMessage = true
        }
    }
    
    // CLLocation의 위도, 경도 값을 주소값으로 변경해주는 함수
    // 함수 호출 과정 중, MapKit의 애플 서버 연동 과정 중 에러가 발생할 경우가 있음
    // 조금 기다리면 다시 정상 작동하지만, 빠르게 위도와 경도값이 바뀌는 경우 조금 시간이 걸림
    func convertLocationToAddress(location: CLLocation) {
        
        let geocoder = CLGeocoder()
        
        geocoder.reverseGeocodeLocation(location) { placemarks, error in
            if error != nil {
                self.isChangingPlace = false
                print("ERROR!!")
                return
            }
            
            guard let placemark = placemarks?.first else { return }
            
            place = "\(placemark.locality ?? "") \(placemark.name ?? "")"
            
            print("위도:\(lat) 경도:\(long) 장소:\(place)")
            self.isChangingPlace = false
        }
        
    }
    
    var backButton: some View {
        Button {
            dismiss()
        } label: {
            Image(systemName: "arrow.left")
                .aspectRatio(contentMode: .fit)
                .foregroundColor(Color.black)
        }
    }
    
}

extension MKCoordinateRegion: Equatable {
    public static func == (lhs: MKCoordinateRegion, rhs: MKCoordinateRegion) -> Bool {
        return lhs.center.latitude == rhs.center.latitude &&
        lhs.center.longitude == rhs.center.longitude &&
        lhs.span.latitudeDelta == rhs.span.latitudeDelta &&
        lhs.span.longitudeDelta == rhs.span.longitudeDelta
    }
}

//struct MapViewCoordinator: UIViewRepresentable {
//
//    @ObservedObject var locationManager: LocationManager
//
//    func makeUIView(context: Context) -> some UIView {
//        return locationManager.mapView
//    }
//
//    func updateUIView(_ uiView: UIViewType, context: Context) {
//
//    }
//
//}



struct NowMapView_previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            NowMapView(isOpenMapSheet: .constant(true), isSelectedPlace: .constant(""), selectedPlaceLat: .constant(0), selectedPlaceLong: .constant(0))
        }
    }
}
