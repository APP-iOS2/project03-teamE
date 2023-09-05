//
//  AdvertisementView.swift
//  CEats
//
//  Created by 유하은 on 2023/09/04.
//

import SwiftUI

struct AdvertisementView: View {
    var body: some View {
        Image("advertisement")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .cornerRadius(5)
    }
}

struct AdvertisementView_Previews: PreviewProvider {
    static var previews: some View {
        AdvertisementView()
    }
}
