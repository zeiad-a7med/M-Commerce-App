//
//  PaymentAddress.swift
//  M-Commerce-App
//
//  Created by Andrew Emad on 20/02/2025.
//

import SwiftUI

struct PaymentAddress: View {
 
    var body: some View {
        if AuthManager.shared.applicationUser?.defaultAddress != nil {
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
                    Text(AuthManager.shared.applicationUser?.defaultAddress?.city ?? "")
                    HStack {
                        Text(AuthManager.shared.applicationUser?.defaultAddress?.address1 ?? "")
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                            .foregroundStyle(.secondary).padding(.trailing,20)
                        Spacer()
                    }
                    Text(AuthManager.shared.applicationUser?.defaultAddress?.phone ?? "").font(.subheadline)
                        .foregroundStyle(.secondary).padding(.trailing,20)
                    
                }
            }
        }else{
            VStack {
                Text("*Please add an address to proceed to payment")
                    .font(.subheadline)
                    .foregroundStyle(.red)
                ZStack{
                    RoundedRectangle(cornerRadius: 25.0)
                        .foregroundStyle(.quinary)
                        .frame(width:300,height:100)
                        .overlay{
                            VStack{
                                NavigationLink {
                                    AddressesDisplayView()
                                } label: {
                                    Image(systemName: "plus")
                                        .resizable()
                                        .frame(width: 50 , height: 50)
                                        .foregroundStyle(.black)
                                        .padding()
                                }
                                
                            }
                        }
                 
                    
                 

                }
            } .padding(.leading , 35)
        }
    }
}

#Preview {
    PaymentAddress()
}
