//
//  SwiftUIView.swift
//  M-Commerce-App
//
//  Created by Andrew Emad on 14/02/2025.
//

import SwiftUI

struct ProfileImage: View {
    @State var profilePic : String = " "
    var body: some View {
        AsyncImage(url: URL(string: profilePic)) { phase in
                switch phase {
                case .empty:
                    ShimmerView(width: 100, height: 100)
                        .clipShape(Circle())
                                    .overlay{
                                        Circle().stroke(.white,lineWidth: 4)
                                    }
                                .shadow(radius: 7)
                        
                case .success(let image):
                
                        image
                           .resizable()
                           .frame(width:150,height: 150)
                           .clipShape(Circle())
                           .overlay{
                               Circle().stroke(.white,lineWidth: 4)
                           }
                       .shadow(radius: 7)
               
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
    ProfileImage()
}
