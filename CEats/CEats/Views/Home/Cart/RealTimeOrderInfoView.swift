//
//  RealTimeOrderInfoView.swift
//  CEats
//
//  Created by 박범수 on 2023/09/07.
//

import SwiftUI
import MapKit

struct CartAnnotation: Identifiable {
    var id = UUID()
    let coordinate: CLLocationCoordinate2D
}

struct RealTimeOrderInfoView: View {
    @EnvironmentObject private var userViewModel: UserViewModel
    @Environment(\.dismiss) private var dismiss
    @Binding var isOpenOrderedSheet: Bool
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.5718, longitude: 126.9769), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    let completion: () -> ()
    let markers: [CartAnnotation] = [
        CartAnnotation(coordinate: CLLocationCoordinate2D(latitude: 37.5698, longitude: 126.9757)),
        CartAnnotation(coordinate: CLLocationCoordinate2D(latitude: 37.5738, longitude: 126.9789))
    ]
    
    var body: some View {
        VStack {
            Button {
                isOpenOrderedSheet = false
                completion()
            } label: {
                Text("확인")
            }
            Map(coordinateRegion: $region, userTrackingMode: .constant(.follow), annotationItems: markers) { location in
                MapAnnotation(coordinate: location.coordinate) {
                    if (location.coordinate.latitude == markers[0].coordinate.latitude && location.coordinate.longitude == markers[0].coordinate.longitude) {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.black)
                    } else {
                        Image(systemName: "fork.knife.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.black)
                    }
                }
            }
            .frame(height: 450)
            
            HStack {
                Text(userViewModel.statusMessage)
                    .foregroundColor(.blue)
                    .padding(.top, 20)
                    .padding(.leading, 30)
                Spacer()
            }
            
            Button {
                print("주문 취소")
            } label: {
                Text("주문 취소")
                    .foregroundColor(.lightgray)
                    .frame(width: 100, height: 40)
                    .border(Color.lightgray)
                    .padding(.horizontal, 10)
            }
            .padding(.top, 20)
            
            Text("매장이 조리를 시작하면 취소할 수 없습니다.")
                .padding(.top, 10)
                .padding(.bottom, 20)
            
            Divider()
            
            HStack {
                VStack(alignment: .leading) {
                    Text("배달 주소")
                        .font(.title2)
                        .bold()
                        .padding(.bottom, 10)
                    Text("\(userViewModel.user.userAddress)")
                }
                Spacer()
            }
            .padding(.leading, 30)
            
            
            Spacer()
        }
        .navigationTitle("주문 확인중")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem {
                NavigationLink {
                    ContentView()
                } label: {
                    Text("확인")
                }
            }
        }
        .onAppear{
            print(" \(userViewModel.user.cEatsMoney - (userViewModel.cartFee))")
        }
    }
}

struct RealTimeOrderInfoView_Previews: PreviewProvider {
    static var previews: some View {
        RealTimeOrderInfoView(isOpenOrderedSheet: .constant(false), completion: {})
            .environmentObject(UserViewModel())
    }
}
