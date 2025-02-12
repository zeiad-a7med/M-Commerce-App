//
//  ProductsSubView.swift
//  M-Commerce-App
//
//  Created by Usef on 10/02/2025.
//

import SwiftUI

struct ProductsSubView: View {
    let dummyArray = [1,2,3,4,5,6,7,8,9]
    var body: some View {
        LazyVStack{
            ForEach(Array(stride(from: 0, to: dummyArray.count, by: 2)), id: \.self) { index in
                LazyHStack{
                    ProductCardView()
                    if index + 1 < dummyArray.count {
                        ProductCardView()
                    }else{
                        ProductCardView().hidden()
                    }
                }
            }
        }
        .padding(5)
    }
}

#Preview {
    ProductsSubView()
}
