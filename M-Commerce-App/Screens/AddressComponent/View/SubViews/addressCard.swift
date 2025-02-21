//
//  addressCard.swift
//  M-Commerce-App
//
//  Created by Andrew Emad on 17/02/2025.
//

import SwiftUI

struct addressCard: View {
    @State var address : Address
    @State var defaultAddress:Address
    @State var isSelected :Bool = false
    @State var cardColor = ColoredPins.generateRandomColoredPin()
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(address.city ?? "Cairo" )
                    .font(.headline)
                    .padding(.bottom,5)
                Text(address.address1 ?? "Egypt")
                    .font(.subheadline)
                    .multilineTextAlignment(.leading)
                    .foregroundStyle(.secondary)
             
            }
            Spacer()
            Image(cardColor)
                .resizable()
                .frame(width:40,height: 40)
                .foregroundStyle(ThemeManager.darkPuble)
                .padding()
                .overlay{
                    Circle()
                        .stroke(lineWidth: 5)
                        .foregroundStyle(isSelected ? ThemeManager.darkPuble : Color(#colorLiteral(red: 0.9071035385, green: 0.9071035385, blue: 0.9071035385, alpha: 1)))
                }
            
        }.padding()
            .overlay{
                RoundedRectangle(cornerRadius: 15)
                    .stroke(lineWidth: 2)
                    .foregroundStyle(isSelected ? ThemeManager.darkPuble : Color(#colorLiteral(red: 0.9071035385, green: 0.9071035385, blue: 0.9071035385, alpha: 1)))
                
            }.padding()
            .onAppear(){
                if address.id == defaultAddress.id{
                    isSelected = true
                }else{
                    isSelected = false
                }
            }
            
    }
}

//#Preview {
//    addressCard()
//}
