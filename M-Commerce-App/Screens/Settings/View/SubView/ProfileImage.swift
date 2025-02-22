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
        Image(.profile)
               .resizable()
               .frame(width:150,height: 150)
               .clipShape(Circle())
               .overlay{
                   Circle().stroke(.white,lineWidth: 4)
               }
           .shadow(radius: 7)
    }
}

#Preview {
    ProfileImage()
}
