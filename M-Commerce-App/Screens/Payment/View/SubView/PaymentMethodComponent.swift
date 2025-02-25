//
//  PaymentMethod.swift
//  M-Commerce-App
//
//  Created by Andrew Emad on 19/02/2025.
//

import PassKit
import SwiftUI

struct PaymentMethodComponent: View {
    @Environment(\.dismiss) var dismiss
    @State private var selectedOption: Int?
    @ObservedObject var paymentViewModel = PaymentViewModel()
    @State var onClick: ((Bool) -> (Void))?

    var body: some View {
        ZStack {
            Color(
                #colorLiteral(
                    red: 0.9590087533, green: 0.9590087533, blue: 0.9590087533,
                    alpha: 1)
            )
            .ignoresSafeArea()
            HStack {

                VStack {
                    VStack(alignment: .leading) {
                        Text("Payment Method")
                            .font(.title2)
                            .bold()
                            .padding(.bottom, 20)

                        VStack(alignment: .leading) {
                            RadioButton(
                                id: 0, label: "cash on delivery",
                                selectedOption: $selectedOption)
                            RadioButton(
                                id: 1, label: "Apple pay",
                                selectedOption: $selectedOption)

                        }
                    }.padding(.trailing, 100)
                    Spacer()
                    if let selectedOption = selectedOption {
                        if selectedOption == 0 {

                            CustomRoundedButtonView(
                                text: "Confirm payment", width: 60,
                                onTap: {
                                    onClick?(true)
                                }, isButtonEnabled: .constant(true)
                            )
                            .padding(.top, 100)
                            .padding(.leading, 40)

                        } else if selectedOption == 1 {
                            ApplePayView(paymentViewModel: paymentViewModel)

                        }

                    } else {
                        CustomRoundedButtonView(
                            text: "Confirm payment", width: 60,
                            onTap: {
                            }, isButtonEnabled: .constant(false)
                        )
                        .padding(.top, 100)
                        .padding(.leading, 40)
                    }

                }
                Spacer()
            }.padding()
        }

        .onChange(of: paymentViewModel.PageDismiss) { oldValue, newValue in
            if paymentViewModel.PageDismiss {
                onClick?(true)
            } else {
                dismiss()
            }
        }

    }
}

#Preview {
    PaymentMethodComponent()
}
