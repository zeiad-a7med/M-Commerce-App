//
//  PaymentView.swift
//  M-Commerce-App
//
//  Created by Andrew Emad on 19/02/2025.
//

import SwiftUI

struct PaymentView: View {
    @StateObject var paymentViewModel = PaymentViewModel()
    @State var showCheckOut: Bool = false
    @State var ableToCheckOut: Bool = false
    var body: some View {

        VStack(alignment: .leading) {
            HStack {
                Text("Address")

                    .bold()
                    .font(.title2)
                Spacer()
                if AuthManager.shared.applicationUser?.defaultAddress != nil {
                    NavigationLink {
                        AddressesDisplayView()
                    } label: {
                        Image(systemName: "pencil")
                            .padding(5)
                            .bold()
                            .foregroundStyle(.white)
                            .background(ThemeManager.darkPuble)
                            .clipShape(Circle())
                    }

                }

            }.padding()

            PaymentAddress()

            if let temp = paymentViewModel.cartResult?.cart?.totalQuantity {
                Text("Products(\(temp))")
                    .bold()
                    .font(.title2)
                    .padding()
            } else {
                Text("Products()")
                    .bold()
                    .font(.title2)
                    .padding()
            }

            ScrollView {
                if let temp = paymentViewModel.cartResult?.cart?.lines {
                    ForEach(temp, id: \.id) { line in
                        PaymentProductRow(line: line)
                    }
                }
            }.frame(height: 300)

            HStack {
                Text("Total amount")
                    .padding()
                Spacer()
                Text(
                    String(format: "%.2f", (Double(
                        paymentViewModel.cartResult?.cart?.cost?
                            .checkoutChargeAmount?.amount ?? "0") ?? 0)
                    * (CurrencyManager.currentCurrencyRate.value ?? 1.0))
                    
                )

                .bold()
                Text(
                    CurrencyManager.currentCurrencyRate.code ?? "EGP"
                )
                .padding(.trailing, 20)
                .bold()
            }
            Spacer()
            CustomRoundedButtonView(
                text: "Checkout Now", width: 80,
                onTap: {
                    showCheckOut.toggle()
                }, isButtonEnabled: .constant(ableToCheckOut)
            )
            .padding(.leading, 45).sheet(
                isPresented: $showCheckOut,
                content: {
                    PaymentMethodComponent { result in
                        
                        showCheckOut.toggle()
                        paymentViewModel.createOrder()
                        DispatchQueue.main.asyncAfter(deadline: .now()+1){
                            NavigationManager.shared.push(.orders)
                        }
                    }.presentationDetents([.medium])
                })
            Spacer()
        }
        .onAppear {
            if AuthManager.shared.applicationUser?.defaultAddress != nil {
                ableToCheckOut.toggle()
            }
            paymentViewModel.getCartData()
        }

    }
}

#Preview {
    PaymentView()
}
