//
//  ShoppingView.swift
//  ShoppingCart
//
//  Created by Andrew Emad on 11/02/2025.
//

import SwiftUI

struct ShoppingView: View {
    var body: some View {
        ScrollView {
            ForEach(0..<10){_ in
                RowCard()
            }
        }
        Button("Procced to Checkout") {
            
        }.foregroundStyle(.white)
            .frame(width: 300)
            .padding()
            .background(Color(#colorLiteral(red: 0.3154394925, green: 0.305562377, blue: 0.7188369632, alpha: 1)).clipShape(RoundedRectangle(cornerRadius: 25)))
            
          
            
        
    }
}

#Preview {
    ShoppingView()
}
