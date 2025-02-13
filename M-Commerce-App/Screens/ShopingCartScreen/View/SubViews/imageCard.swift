//
//  SwiftUIView.swift
//  ShoppingCart
//
//  Created by Andrew Emad on 10/02/2025.
//

import SwiftUI

struct imageCard: View {
    @State var img : String
    var body: some View {
        AsyncImage(url: URL(string: img)) { phase in
                switch phase {
                case .empty:
                    ShimmerView(width: 325, height: 100)
                        .frame(width: 325 , height: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .containerRelativeFrame(.horizontal, alignment: .center)
                        
                case .success(let image):
                
                        image
                           .resizable()
                           .frame(width: 350 , height: 120)
                           .clipShape(RoundedRectangle(cornerRadius: 15))
                           .containerRelativeFrame(.horizontal, alignment: .center)
                           .aspectRatio(contentMode: .fit)
               
                case .failure:
                    ZStack{
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 330 , height: 100)
                            .foregroundStyle(.gray)
                            .containerRelativeFrame(.horizontal, alignment: .center)
                        Text("Failed to load image")
                            .foregroundStyle(.white)
                    }
                @unknown default:
                    EmptyView()
                }
            }
    }
}

#Preview {
    imageCard(img: "https://burst.shopifycdn.com/photos/black-sneakers-with-white-sole.jpg?width=4460&height=4460&exif=0&iptc=0"
    )
}
