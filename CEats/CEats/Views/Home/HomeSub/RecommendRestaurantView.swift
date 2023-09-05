//
//  RecommendRestaurantView.swift
//  CEats
//
//  Created by 유하은 on 2023/09/04.
//

import SwiftUI

struct RecommendRestaurantView: View {
    var body: some View {
        VStack(alignment: .leading){
            Image("kimchiSoup")
                .resizable()
                .frame(width: 300, height: 180)
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
                
            Text("삼순이 식당")
                .padding(.top,10)
                .padding(.bottom,2)
                .foregroundColor(.black)
            HStack{
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                Text("4.6")
                Text("1.5km")
                Text("-")
                Text("배달비: 2000")
            }
            .font(.footnote)
            .foregroundColor(.secondary)
        }
    }
}

struct RecommendRestaurantView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendRestaurantView()
    }
}
