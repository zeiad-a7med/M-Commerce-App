//
//  ImageView.swift
//  M-Commerce-App
//
//  Created by Andrew Emad on 19/02/2025.
//

import SwiftUI

struct ImageView: View {
    @State var url : String
    var body: some View {
        AsyncImage(url: URL(string: url)) { phase in
                switch phase {
                case .empty:
                    ShimmerView(width: 70, height: 70)
                        .frame(width: 70 , height: 70)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                     
                        
                case .success(let image):
                
                        image
                           .resizable()
                           .frame(width: 70 , height: 70)
                           .clipShape(RoundedRectangle(cornerRadius: 15))
                          
               
                case .failure:
                    ZStack{
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 70 , height: 70)
                            .foregroundStyle(.gray)
                        
                        Text("Failed to load image")
                            .foregroundStyle(.white)
                    }
                @unknown default:
                    EmptyView()
                }
            }
    }
}








