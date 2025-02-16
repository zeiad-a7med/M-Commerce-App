//
//  LocationPopup.swift
//  M-Commerce-App
//
//  Created by Andrew Emad on 16/02/2025.
//

import SwiftUI

struct LocationPopup: View {
    var body: some View {
        VStack {
            Text("Your order will be deliverd here")
                .padding()
                .foregroundStyle(.white)
                .background(ThemeManager.darkPuble)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            Triangle()
                .frame(width: 25,height: 25)
                .foregroundStyle(ThemeManager.darkPuble)
                .padding(.top,-10)
           
         }
    }
}

#Preview {
    LocationPopup()
}
