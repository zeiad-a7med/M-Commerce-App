//
//  defaultAddresCard.swift
//  M-Commerce-App
//
//  Created by Andrew Emad on 17/02/2025.
//

import SwiftUI

struct defaultAddresCard: View {
    @ObservedObject var addressModel = AddressComponentViewModel(id: "03c27d8e9f3f22fddb10010462ef36d3")
    var body: some View {
        if let first=addressModel.addressPackage.defaultAddress{
            HStack {
                Image("Black")
                    .resizable()
                    .frame(width:25,height: 25)
                Text(first.address1 ?? "")
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
}

#Preview {
    defaultAddresCard()
}
