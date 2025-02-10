//
//  BrandsView.swift
//  M-Commerce
//
//  Created by Usef on 09/02/2025.
//

import SwiftUI

struct BrandsView: View {
    var imageUrlArray:[String]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(alignment: .center, spacing: 0){
                ForEach(Array(stride(from: 0, to: imageUrlArray.count, by: 2)), id: \.self) { index in
                    LazyVStack(spacing: 0){
                        BrandCard(title: "adidas", imageUrl: imageUrlArray[index])
                        if index + 1 < imageUrlArray.count{
                            BrandCard(title: "adidas", imageUrl: imageUrlArray[index + 1])
                        }else{
                            BrandCard(title: "adidas", imageUrl: imageUrlArray[index]).hidden()
                        }
                    }
                }
            }.padding(.leading, 21)
                .padding(.trailing, 20)
                .padding(.top, 0)
        }
    }
}

#Preview {
    BrandsView(imageUrlArray: ["","",""])
}
