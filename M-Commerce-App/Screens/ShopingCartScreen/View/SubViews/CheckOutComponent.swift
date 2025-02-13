//
//  CheckingOutComponent.swift
//  M-Commerce-App
//
//  Created by Andrew Emad on 13/02/2025.
//

import SwiftUI

struct CheckOutComponent: View {
    @State var promoCode : String = ""
    @State  var Total : String  = "0.0"
    var body: some View {
        VStack{
            Spacer()
            ZStack {
                RoundedRectangle(cornerRadius: 40.0)
                    .frame(height: UIScreen.main.bounds.height/3+300)
                    .ignoresSafeArea()
                    .foregroundStyle(Color(#colorLiteral(red: 0.9560378194, green: 0.9560378194, blue: 0.9560378194, alpha: 1)))
                    .overlay{
                        RoundedRectangle(cornerRadius: 15.0)
                            .frame(width:320 ,height:50)
                            .foregroundStyle(.quinary)
                            .overlay{
                                HStack{
                                    Image(systemName: "gift")
                                        .foregroundStyle(.quaternary)
                                        .padding(.leading,10)
                                    TextField("Enter your promo code here", text: $promoCode)
                                }
                            }
                            .offset(y:-160)
                        VStack {
                            HStack {
                                Text("ShipMent:")
                                    .foregroundStyle(.tertiary)
                                Spacer()
                                Text("6.00")
                            }.padding()
                           
                            HStack {
                                Text("TotalAmount:")
                                    .foregroundStyle(.tertiary)
                                Spacer()
                                Text(Total)
                            }.padding()
                            Button(action: {
                              
                            }
                            , label: {
                                Text("Proceed to checkout")
                            }).foregroundStyle(.white)
                                .frame(width: 300)
                                .padding()
                                .background(Color(#colorLiteral(red: 0.3154394925, green: 0.305562377, blue: 0.7188369632, alpha: 1)).clipShape(RoundedRectangle(cornerRadius: 25)))
                                .offset(y:25)
                        }.offset(y:50)
                    }
               
             
                  
                
            }.offset(y:50)
                
        }
       
    }
}

#Preview {
    CheckOutComponent()
}
