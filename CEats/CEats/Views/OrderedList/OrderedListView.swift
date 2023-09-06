//
//  OrderedListView.swift
//  CEats
//
//  Created by 박범수 on 2023/09/04.
//

import SwiftUI

struct OrderedListView: View {
    
    @State var search: String = ""
    
    var body: some View {
        VStack {
            Text("과거 주문 내역")
                .font(.title3)
            NavigationView {
                List {
                    ZStack(alignment: .leading) {
                        VStack {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 350, height: 250)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.gray, lineWidth: 1)
                                )
                                .foregroundColor(.white)
                                .padding(2)
                            
                        }
                        VStack(alignment: .leading) {
                            HStack {
                                VStack(alignment: .leading) {
                                    
                                    Text("멋쟁이 김치찌개")
                                        .font(.title2)
                                        .bold()
                                    Text("2023-xx-xx 오전 xx:xx")
                                        .foregroundColor(.gray)
                                    Text("배달 완료")
                                        .padding(.top, 5)
                                }
                                .padding(.trailing, 25)
                                Image("kimchiSoup")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                            }
                            Text("1     김치찌개")
                                .padding(.top, 10)
                            Text("합계: 15,000원")
                                .padding(.top, 10)
                        }
                        .padding(.leading, 30)
                        
                    }
                    ZStack(alignment: .leading) {
                        VStack {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 350, height: 250)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.gray, lineWidth: 1)
                                )
                                .foregroundColor(.white)
                                .padding(2)
                            
                        }
                        VStack(alignment: .leading) {
                            HStack {
                                VStack(alignment: .leading) {
                                    
                                    Text("멋쟁이 피자")
                                        .font(.title2)
                                        .bold()
                                    Text("2023-xx-xx 오전 xx:xx")
                                        .foregroundColor(.gray)
                                    Text("배달 중")
                                        .padding(.top, 5)
                                }
                                .padding(.trailing, 25)
                                Image("pizza")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                            }
                            Text("3     페퍼로니 피자")
                                .padding(.top, 10)
                            Text("합계: 23,000원")
                                .padding(.top, 10)
                        }
                        .padding(.leading, 30)
                        
                    }
                }
                .listStyle(.plain)
            }
        }
    }
}

struct OrderedListView_Previews: PreviewProvider {
    static var previews: some View {
        OrderedListView()
    }
}
