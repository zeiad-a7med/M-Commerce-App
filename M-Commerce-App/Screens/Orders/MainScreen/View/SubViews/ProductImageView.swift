//
//  ProductImageView.swift
//  M-Commerce-App
//
//  Created by Usef on 19/02/2025.
//

import SwiftUI

struct ProductImageView: View {
    var imgUrlStr:String
    let width:CGFloat = UIScreen.main.bounds.width/3.6
    let height:CGFloat = 110
    var body: some View {
        let url = URL(string: imgUrlStr)
        AsyncImage(url: url) { image in
                    image.resizable()
                .scaledToFill()
                } placeholder: {
                    ShimmerView(width: width, height: height)
                }
                .frame(width: width, height: height)
                .cornerRadius(12)
    }
}

#Preview {
    ProductImageView(imgUrlStr: "https://static.pullandbear.net/assets/public/12bb/b5dd/713a43619f82/8188dceace12/0359450680005-A7M/0359450680005-A7M.jpg?ts=1738055594528&w=882&f=auto")
}
