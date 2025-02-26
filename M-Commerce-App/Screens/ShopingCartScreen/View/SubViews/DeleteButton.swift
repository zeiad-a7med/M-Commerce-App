//
//  deleteButton.swift
//  ShoppingCart
//
//  Created by Andrew Emad on 11/02/2025.
//

import SwiftUI

struct DeleteButton: View {

    var body: some View {
        Circle()
            .frame(width: 25,height: 25)
            .foregroundStyle(Color(#colorLiteral(red: 0.9997449517, green: 0.8575152755, blue: 0.8603120446, alpha: 1)))
            .overlay{
                Button("", systemImage: "xmark.bin") {
                    
                }.frame(width: 3,height: 3)
                    .foregroundStyle(.red)
                    .offset(x:3.7,y:0)
                    .controlSize(.small)
                    
            }
    }
}

#Preview {
    DeleteButton()
}
