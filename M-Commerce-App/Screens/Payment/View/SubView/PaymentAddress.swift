//
//  PaymentAddress.swift
//  M-Commerce-App
//
//  Created by Andrew Emad on 20/02/2025.
//

import SwiftUI

struct PaymentAddress: View {
 
    var body: some View {
        HStack(){
            ZStack {
                Image("mapBackground")
                    .resizable()
                    .frame(width:140,height:90)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Image(ColoredPins.generateRandomColoredPin())
                    .resizable()
                    .frame(width: 50,height: 50)
                
                
            }.padding(.leading)
            VStack(alignment:.leading){
                Text("Location")
                HStack {
                    Text("your custom address goes here and it should be long like this")
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(.secondary).padding(.trailing,20)
                    Spacer()
                }
                
            }
        }
    }
}

#Preview {
    PaymentAddress()
}
