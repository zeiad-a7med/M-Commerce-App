//
//  PaymentView.swift
//  M-Commerce-App
//
//  Created by Andrew Emad on 19/02/2025.
//

import SwiftUI

struct PaymentView: View {
    @StateObject var paymentViewModel = PaymentViewModel()
    @State var numberofProducts: Int = 3
    @State var paymentDisplay: String = "Cash on delivery"
    @State var showCheckOut: Bool = false
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                HStack {
                    Text("Address")

                        .bold()
                        .font(.title2)
                    Spacer()
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
                }.padding()

                PaymentAddress()
                Text("Products(\(numberofProducts))")
                    .bold()
                    .font(.title2)
                    .padding()
                ScrollView {
                    ForEach((1...10), id: \.self) { _ in
                        productRow()
                    }
                }.frame(height: 300)
                Text("PaymentMethod")
                    .bold()
                    .font(.title2)
                    .padding()

                HStack {
                    Text("Total amount")
                        .padding()
                    Spacer()
                    Text("100")
                        .bold()
                    Text("$")
                        .padding(.trailing, 20)
                        .bold()
                }
                Spacer()
                CustomRoundedButtonView(
                    text: "Checkout Now", width: 80,
                    onTap: {
                        showCheckOut.toggle()
                    }, isButtonEnabled: .constant(true)
                )
                .padding(.leading, 45).sheet(
                    isPresented: $showCheckOut,
                    content: {
                        PaymentMethodComponent().presentationDetents([.medium])
                    })
            }
        }
    }
}

#Preview {
    PaymentView()
}
