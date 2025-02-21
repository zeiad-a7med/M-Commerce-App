//
//  defaultAddresCard.swift
//  M-Commerce-App
//
//  Created by Andrew Emad on 17/02/2025.
//

import SwiftUI

struct defaultAddresCard: View {
    var address: Address
    var body: some View {
        HStack {
            Image("Black")
                .resizable()
                .frame(width:25,height: 25)
            Text(address.address1 ?? "")
            Spacer()
            Image("bullseye")
                .resizable()
                .frame(width:25,height: 25)
        }.padding()
            .overlay{
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 2)
                   
                
        }.padding()
        
    }
}

#Preview {
    defaultAddresCard(
        address: Address(
            id: "",
            address1 : "7amada"
        )
    )
}
