//
//  SearchView.swift
//  CEats
//
//  Created by 박범수 on 2023/09/04.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searchTerm = ""
    var columns = Array(repeating: GridItem(.flexible(), spacing: 20), count: 3)
    let imageSize: CGFloat = 88

    var body: some View {
        VStack {
            HStack {
                SearchBarView(text: $searchTerm)
                    .padding(.horizontal)
                    .cornerRadius(30)
                    .shadow(radius: 5)
                Image(systemName: "magnifyingglass")
            }
            Spacer()
            ScrollView {
                LazyVGrid(columns: columns, spacing: 30) {
                    ForEach(food_Data){food in
                        VStack(alignment: .leading, spacing: 15) {
//                            NavigationLink(destination: DetailView(food: food)) { 이미지를 누르면 뷰로 이동 부분
                            AsyncImage(url: URL(string: food.image)) { image in image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(Circle())
                            }placeholder: {
                                Circle()
                                    .foregroundColor(.secondary)
                            }
                            .frame(width: imageSize, height: imageSize)
                            Text(food.title)
                        }
                    }
                }
                .padding(.top)
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

struct foodlist: Identifiable { // 임시데이터
    var id: Int
    var title : String
    var image : String
}

var food_Data = [
    foodlist(id: 0, title: "한식", image: "https://th.bing.com/th/id/OIP.MMkeTJBOmYbih-YQOUWe8QHaE8?pid=ImgDet&rs=1"),
    foodlist(id: 1, title: "치킨", image: "https://i.pinimg.com/564x/08/e5/8a/08e58ae73d00d466360e84cda6cd868e.jpg"),
    foodlist(id: 2, title: "분식", image: "https://i.pinimg.com/564x/c5/7e/a3/c57ea38ddd52d8d4c115d04d6bb965ae.jpg"),
    foodlist(id: 3, title: "족발/보쌈", image: "https://i.pinimg.com/564x/05/e9/3e/05e93e646df7356c3d5ce948416488ae.jpg"),
    foodlist(id: 4, title: "찜/탕", image: "https://recipe1.ezmember.co.kr/cache/recipe/2019/02/28/5400685acbce4b5c9ccebce245df5ae81.jpg"),
    foodlist(id: 5, title: "피자", image: "https://i.pinimg.com/474x/9f/08/c1/9f08c1375157edbead237fbac9ed5f7c.jpg"),
    foodlist(id: 6, title: "중식", image: "https://i.pinimg.com/564x/98/8e/b7/988eb734dd17a5107ed8bfc7900e3a3e.jpg"),
    foodlist(id: 7, title: "일식", image: "https://i.pinimg.com/564x/01/8b/43/018b434d6696b99595f116003775b4eb.jpg"),
    foodlist(id: 8, title: "회/해물", image: "https://th.bing.com/th/id/OIP.gOjwAbYxWih6JVNL_MAsuAHaFj?pid=ImgDet&rs=1"),
    foodlist(id: 9, title: "양식", image: "https://tour.paju.go.kr/upload/tour/2017/4/18/91b1d6ab-8e46-41c1-9a52-96fd8e880c07.jpg"),
    foodlist(id: 10, title: "커피/차", image: "https://www.k-health.com/news/photo/202211/62228_66742_245.jpg"),
    foodlist(id: 11, title: "디저트", image: "https://i.pinimg.com/564x/29/80/44/298044b73bacb4cab2a811468649596c.jpg"),
    foodlist(id: 12, title: "햄버거", image: "https://i.pinimg.com/564x/e3/e5/b0/e3e5b0ed2b932874e435ce1e06413969.jpg")
]

