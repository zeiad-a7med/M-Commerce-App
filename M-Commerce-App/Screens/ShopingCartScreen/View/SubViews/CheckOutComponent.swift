//
//  CheckingOutComponent.swift
//  M-Commerce-App
//
//  Created by Andrew Emad on 13/02/2025.
//

import SwiftUI

struct CheckOutComponent: View {
    @State var promoCode: String = ""
    var onClick: ((Bool) -> Void)?
    @Binding var totalPrice: Double
    var body: some View {
        NavigationView {
            ZStack {
                Color(
                    #colorLiteral(
                        red: 0.8745382428, green: 0.8745382428,
                        blue: 0.8745382428,
                        alpha: 1)
                ).ignoresSafeArea()
                VStack {
                    RoundedRectangle(cornerRadius: 15.0)
                        .frame(width: 320, height: 50)
                        .foregroundStyle(.quinary)
                        .overlay {
                            HStack {
                                Image(systemName: "gift")
                                    .foregroundStyle(.quaternary)
                                    .padding(.leading, 10)
                                TextField(
                                    "Enter your promo code here",
                                    text: $promoCode)
                            }
                        }
                        .offset(y: 140)
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

                            let tempStr = String(totalPrice)

                            Text(tempStr)
                        }.padding()
                        CustomRoundedButtonView(
                            text: "Proceed to payment",
                            width: 60,
                            onTap: {
                                onClick?(true)
                            }, isButtonEnabled: .constant(true)
                        ).offset(y: 25)

                    }.offset(y: 180)

                }.offset(y: -160)

            }
        }

    }
}

#Preview {
    CheckOutComponent(totalPrice: .constant(0.0))
}
