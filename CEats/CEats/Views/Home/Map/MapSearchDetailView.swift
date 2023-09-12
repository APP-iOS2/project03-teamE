//
//  MapSearchDetailView.swift
//  CEats
//
//  Created by 변상우 on 2023/09/12.
//

import SwiftUI

struct MapSearchDetailView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @Binding var isOpenMapSheet: Bool
    
    /// SearchView에서 MapDetailView로 이동했을 때,
    /// @Binding 값으로 되어 있어서 앱이 자꾸 멈추는 오류 발생
    /// 해결책 - 검색 이후에 넘어가는 DetailView를 따로 만들어서
    /// @State 값으로 변경하여 넘기는 값만 가지고 보여주도록 변경
    ///
    /// 예상 문제 원인 - 기존에는 MapDetailView를 검색을 하거나 맵을 통해서
    /// 위치 설정을 했을 때 같은 화면으로 이동하도록 해서 @Binding 값을 사용함
    @State var selectedPlace: String
    @State var selectedPlaceLat: Double
    @State var selectedPlaceLong: Double
    
    @State private var detailAddress = ""
    @State private var moreInformation = ""
    
    @State private var isOKSheet: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "location.north")
                Text("\(selectedPlace)")
                    .font(.title3)
                    .bold()
                    .padding(.leading, 10)
                
                Spacer()
            }
            .padding(.top, 30)
            .padding(.horizontal, 30)
            
            
            VStack {
                Divider()
                
                TextField("상세주소 (아파트/동/호)", text: $detailAddress)
                    .font(.headline)
                    .padding(.vertical, 10)
                    .padding(.leading, 10)
                
                Divider()
                
                TextField("길 안내 (예: 1층에 올리브영이 있는 오피스텔)", text: $moreInformation)
                    .font(.headline)
                    .padding(.vertical, 10)
                    .padding(.leading, 10)
                
                NavigationLink {
                    DetailToMapView(isOpenMapSheet: $isOpenMapSheet ,isSelectedPlace: $selectedPlace, selectedPlaceLat: $selectedPlaceLat, selectedPlaceLong: $selectedPlaceLong)
                } label: {
                    Label("지도에서 위치 확인하기", systemImage: "location.north")
                        .frame(width: .screenWidth * 0.8, height: 60)
                        .background(.clear)
                        .foregroundColor(.black)
                        .border(Color.gray, width: 1.5)
                        .cornerRadius(3)
                }
                .padding(.top, 10)
            }
            .padding(.horizontal, 20)
            
            Spacer()
            
            Button {
                if detailAddress != "" {
                    isOpenMapSheet = false
                } else {
                    isOKSheet = true
                }
            } label: {
                Text("완료")
                    .font(.title3)
                    .bold()
                    .foregroundColor(.white)
                    .frame(width: .screenWidth * 0.8, height: 50)
                    .background(Color.blue)
            }
            .padding(.bottom)

        }
        .navigationTitle("주소 상세 정보")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
        
        .onAppear {
            print("\(selectedPlace)")
            print("\(selectedPlaceLat)")
            print("\(selectedPlaceLong)")
        }
        
        .sheet(isPresented: $isOKSheet) {
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("상세 주소를 입력하세요")
                            .font(.title)
                            .bold()
                            .foregroundColor(.black)
                            .padding(.bottom, 10)
                        Text("아파트명/동/호 등의 정보를 입력하시면 더 정확하게\n배달할 수 있습니다.")
                            .font(.footnote)
                            .foregroundColor(.lightgray)
                            .padding(.bottom, 10)
                    }
                    Spacer()
                }
                
                Button {
                    isOKSheet = false
                } label: {
                    Text("상세 주소 입력")
                        .bold()
                        .foregroundColor(.white)
                        .frame(width: .screenWidth * 0.8, height: 50)
                        .background(Color.blue)
                }
                
                Button {
                    isOKSheet = false
                    isOpenMapSheet = false
                } label: {
                    Text("무시하기")
                        .bold()
                        .foregroundColor(.blue)
                        .frame(width: .screenWidth * 0.8, height: 50)
                        .background(Color.clear)
                        .border(Color.blue, width: 1)
                }
            }
            .padding(.horizontal, 20)
            .presentationDetents([.height(260)])
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

struct MapSearchDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MapSearchDetailView(isOpenMapSheet: .constant(true), selectedPlace: "5호선 광화문역", selectedPlaceLat: 0.0, selectedPlaceLong: 0.0)
        }
    }
}
