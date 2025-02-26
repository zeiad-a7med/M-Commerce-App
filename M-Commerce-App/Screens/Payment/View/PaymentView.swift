//
//  PaymentView.swift
//  M-Commerce-App
//
//  Created by Andrew Emad on 19/02/2025.
//

import SwiftUI

struct PaymentView: View {
    @StateObject var paymentViewModel = PaymentViewModel()
    @StateObject private var viewModel = PromoCodeViewModel()
    @State var showCheckOut: Bool = false
    @State var ableToCheckOut: Bool = false
    var body: some View {

        VStack{
            
            VStack(alignment: .trailing){
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
                    }.padding(.leading,UIScreen.main.bounds.width - 50)

                }
            }.frame(width: UIScreen.main.bounds.width)
            

            PaymentAddress()

            ScrollView {
                if let temp = paymentViewModel.cartResult?.cart?.lines {
                    ForEach(temp, id: \.id) { line in
                        PaymentProductRow(line: line)
                    }
                }
            }.frame(height: 300)
            VStack{
                Spacer()
                HStack {
                    Text("SubTotal:")
                        .padding()
                    Spacer()
                    Text(
                        String(format: "%.2f", (Double(
                            paymentViewModel.cartResult?.cart?.cost?
                                .subtotalAmount?.amount ?? "0") ?? 0)
                        * (CurrencyManager.currentCurrencyRate.value ?? 1.0))
                        
                    )
                    .bold()
                    Text(
                        CurrencyManager.currentCurrencyRate.code ?? "EGP"
                    )
                    .padding(.trailing, 20)
                    .bold()
                }.frame(height:30)
                HStack {
                    Text("Checkout Charge Amount:")
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
                }.frame(height:30)
                HStack {
                    Text("Discount:")
                        .padding()
                    Spacer()
                    Text(
                        String(format: "%.2f", viewModel.discountAmount)
                    )
                    .bold()
                    Text(
                        CurrencyManager.currentCurrencyRate.code ?? "EGP"
                    )
                    .padding(.trailing, 20)
                    .bold()
                }.frame(height:30)
                HStack {
                    Text("Total Amount:")
                        .padding()
                    Spacer()
                    Text(
                        String(format: "%.2f",((Double(
                            paymentViewModel.cartResult?.cart?.cost?
                                .totalAmount?.amount ?? "0") ?? 0)
                        * (CurrencyManager.currentCurrencyRate.value ?? 1.0) - viewModel.discountAmount))
                        
                    )
                    .bold()
                    Text(
                        CurrencyManager.currentCurrencyRate.code ?? "EGP"
                    )
                    .padding(.trailing, 20)
                    .bold()
                }.frame(height:30)
//                Spacer()
                CustomRoundedButtonView(
                    text: "Checkout Now", width: 80,
                    onTap: {
                        showCheckOut.toggle()
                    }, isButtonEnabled: .constant(ableToCheckOut)
                )
                Spacer()
            }
            .ignoresSafeArea()
            .frame(width:UIScreen.main.bounds.width,height:250)
            
            .background(.thinMaterial)
            
            .clipShape(
                RoundedCornerShape(
                    corners: [.topRight, .topLeft], radius: 40)
            )
            .sheet(
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
        }
        .navigationTitle("Summary")
        
        .onAppear {
            paymentViewModel.getCartData()
            if AuthManager.shared.applicationUser?.defaultAddress != nil {
                ableToCheckOut.toggle()
            }
            viewModel.promoCode = AuthManager.shared.applicationUser?.couponCode ?? ""
            viewModel.setUp(
                totalPrice: Double(
                    AuthManager.shared.applicationUser?.cart?.cost?.totalAmount?.formattedPrice ?? "0.0") ?? 0.0)
        }

    }
}

#Preview {
    PaymentView()
}
