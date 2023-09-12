//
//  MapSearchView.swift
//  CEats
//
//  Created by 유하은 on 2023/09/05.
//

import SwiftUI
import MapKit
import CoreLocation

struct MapSearchView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @Binding var isOpenMapSheet: Bool
    
    @State var searchText: String = ""
    @State private var searchResults: [MKMapItem] = []
//    @State private var selectedMapItem: MKMapItem?
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.black)
                    .padding(.trailing, 10)
                TextField("도로명, 건물명 또는 지번으로 검색", text: $searchText, onCommit: {
                    performSearch()
                })
                    .foregroundColor(.black)
                Spacer()
            }
            .padding(.top, 30)
            .padding(.leading, 30)
            .padding(.bottom, 10)
            
            Rectangle()
                .foregroundColor(.veryLightGray)
                .frame(height: 5)
            
            List(searchResults, id: \.self) { mapItem in
                NavigationLink {
                    MapSearchDetailView(isOpenMapSheet: $isOpenMapSheet, selectedPlace: mapItem.placemark.title ?? "Unknown Place", selectedPlaceLat: mapItem.placemark.coordinate.latitude, selectedPlaceLong: mapItem.placemark.coordinate.longitude)
                } label: {
                    Text(mapItem.placemark.title ?? "Unknown Place")
                }
            }
            .listStyle(.plain)
            
            Spacer()
        }
        .navigationTitle("주소 설정")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
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
    
    func performSearch() {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchText
        
        let span = MKCoordinateSpan(latitudeDelta: 5.0, longitudeDelta: 5.0)
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.5, longitude: 127.0), span: span)
        request.region = region
        
        let search = MKLocalSearch(request: request)
        
        search.start { response, error in
            if let response = response {
                searchResults = response.mapItems
                print("\(searchResults)")
            }
        }
    }
}

struct MapSearchVIEW_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MapSearchView(isOpenMapSheet: .constant(true))
        }
    }
}
