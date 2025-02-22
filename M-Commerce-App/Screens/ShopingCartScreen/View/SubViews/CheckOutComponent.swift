//
//  CheckingOutComponent.swift
//  M-Commerce-App
//
//  Created by Andrew Emad on 13/02/2025.
//

import SwiftUI

struct CheckOutComponent: View {
    @State var cartCost: Cost?
    var onClick: ((Bool) -> Void)?
    @State var promoCode: String = ""
    var body: some View {

        VStack {
            RoundedRectangle(cornerRadius: 15.0)
                .frame(width: 100, height: 5)
                .foregroundStyle(.quinary)
                .padding(.top, 10)

            RoundedRectangle(cornerRadius: 15.0)
                .frame(width: 320, height: 50)
                .foregroundStyle(.quinary)
                .overlay {
                    HStack {
                        Image(systemName: "gift")
                            .foregroundStyle(.quaternary)
                            .padding(.leading, 10)
                        TextField(
                            "Enter your promo code here", text: $promoCode)
                    }
                }
                .padding(.top, 10)
                .padding(.bottom, 20)

            VStack {
                HStack {
                    Text("SubTotal:")
                        .foregroundStyle(.tertiary)
                    Spacer()
                    Text(
                        "\(cartCost?.subtotalAmount?.currencyCode ?? "") \(cartCost?.subtotalAmount?.amount ?? "0")"
                    )
                }.padding(.horizontal)
                    .padding(.bottom, 10)

                HStack {
                    Text("Checkout Charge Amount:")
                        .foregroundStyle(.tertiary)
                    Spacer()
                    Text(
                        "\(cartCost?.checkoutChargeAmount?.currencyCode ?? "") \(cartCost?.checkoutChargeAmount?.amount ?? "0")"
                    )
                }.padding(.horizontal)
                    .padding(.bottom, 10)

                HStack {
                    Text("Discount:")
                        .foregroundStyle(.tertiary)
                    Spacer()
                    Text(
                        "\(cartCost?.checkoutChargeAmount?.currencyCode ?? "") \("0")"
                    )
                }.padding(.horizontal)
                    .padding(.bottom, 10)

                HStack {
                    Text("Total Amount:")
                        .foregroundStyle(.tertiary)
                    Spacer()
                    Text(
                        "\(cartCost?.totalAmount?.currencyCode ?? "") \(cartCost?.totalAmount?.amount ?? "0")"
                    )
                }
                .padding(.horizontal)
                .padding(.bottom, 30)

                CustomRoundedButtonView(
                    text: "Proceed to payment",
                    width: 60,
                    onTap: {
                        onClick?(true)
                    }, isButtonEnabled: .constant(true)
                )
            }

            Spacer()

        }

    }
    func printMyVar() {
        //        print(totalPrice)
    }
}

#Preview {
    CheckOutComponent(
        cartCost: Cost(
            checkoutChargeAmount: Price(
                amount: "109.9", currencyCode: "EGP"
            ),
            totalAmount: Price(
                amount: "109.9", currencyCode: "EGP"
            ),
            subtotalAmount: Price(
                amount: "109.9", currencyCode: "EGP"
            )
        ))
}
