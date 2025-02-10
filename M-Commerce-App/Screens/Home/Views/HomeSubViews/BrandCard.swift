//
//  BrandCard.swift
//  M-Commerce
//
//  Created by Usef on 09/02/2025.
//

import SwiftUI

struct BrandCard: View {
    var title:String
    var imageUrl:String
        
    let smallRectangleWidth:CGFloat  = 150.0
    let smallRectangleHeight:CGFloat = 150.0
    
    let cornerRadius:CGFloat = 30.0
    let shadowRadius:CGFloat = 7.0
    var body: some View {

        VStack(spacing: 4){
                if let url = URL(string: imageUrl) {
                    CustomNetworkImageView(url: url)
                        .scaledToFit()
                        .frame(width: smallRectangleWidth, height: smallRectangleHeight)
                        .background(Color.white)
                        .cornerRadius(cornerRadius)
                        .shadow(radius: shadowRadius)
                }else{
                    Image(systemName: "network.slash")
                        .resizable()
                        .scaledToFit()
                        .frame(width: smallRectangleWidth, height: smallRectangleHeight)
                        .background(Color.white)
                        .cornerRadius(cornerRadius)
                        .shadow(radius: shadowRadius)
                }
                Text(title.capitalized)
                    .foregroundStyle(.black)
                    .bold()
            
            }.padding()
    }
}

#Preview {
    BrandCard(title: "Alph Aura", imageUrl: "https://mbluxury1.amazonaws.com/2022/02/25172616/chanel-1.jpg")
}
