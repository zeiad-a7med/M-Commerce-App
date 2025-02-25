//
//  CheckingOutComponent.swift
//  M-Commerce-App
//
//  Created by Andrew Emad on 13/02/2025.
//

import Combine
import SwiftUI

class PromoCodeViewModel: ObservableObject {
    var totalPrice: Double = 0
    var discountAmount: Double = 0
    @Published var promoCode: String = ""
    @Published var coupon: Coupon?
    private var cancellables = Set<AnyCancellable>()

    func setUp(totalPrice: Double) {
        self.totalPrice = totalPrice
    }
    init() {
        $promoCode
            .debounce(for: .seconds(0.8), scheduler: RunLoop.main)
            .sink { newValue in
                if !newValue.isEmpty {
                    var coupon: Coupon?
                    for item in Constants.coupons {
                        if item.code == newValue {
                            coupon = item
                            break
                        }
                    }
                    self.coupon = coupon
                    self.calculateDiscount()
                }
            }
            .store(in: &cancellables)
    }
    func calculateDiscount() {

        if coupon == nil {
            discountAmount = 0
        } else {
            if coupon?.type == .percentage {
                discountAmount = totalPrice * ((coupon?.value ?? 0) / 100)
            } else {
                discountAmount = totalPrice - (coupon?.value ?? 0)
            }
            var user = AuthManager.shared.applicationUser
            user?.cart?.discount = discountAmount
            AuthManager.shared.updateUser(updatedUser: user!)
        }

    }
}
struct CheckOutComponent: View {
    @State var cartCost: Cost?
    var onClick: ((Bool) -> Void)?
    @StateObject private var viewModel = PromoCodeViewModel()
    @State var discount: Double = 0
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
                            "Enter your promo code here",
                            text: $viewModel.promoCode)
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
                        "\(cartCost?.subtotalAmount?.formattedCurrecyCode ?? "EGP") \(cartCost?.subtotalAmount?.formattedPrice ?? "0.0")"
                    )
                }.padding(.horizontal)
                    .padding(.bottom, 10)

                HStack {
                    Text("Checkout Charge Amount:")
                        .foregroundStyle(.tertiary)
                    Spacer()
                    Text(
                        "\(cartCost?.checkoutChargeAmount?.formattedCurrecyCode ?? "EGP") \(cartCost?.checkoutChargeAmount?.formattedPrice ?? "0.0")"
                    )
                }.padding(.horizontal)
                    .padding(.bottom, 10)

                HStack {
                    Text("Discount:")
                        .foregroundStyle(.tertiary)
                    Spacer()
                    Text(
                        "\(cartCost?.checkoutChargeAmount?.formattedCurrecyCode ?? "EGP") \(String(format: "%.2f", viewModel.discountAmount))"
                    )
                }.padding(.horizontal)
                    .padding(.bottom, 10)

                HStack {
                    Text("Total Amount:")
                        .foregroundStyle(.tertiary)
                    Spacer()
                    Text(
                        "\(cartCost?.totalAmount?.formattedCurrecyCode ?? "EGP") \(String(format: "%.2f", ((Double(cartCost?.totalAmount?.formattedPrice ?? "0.0") ?? 0.0) - viewModel.discountAmount)))"
                    )
                }
                .padding(.horizontal)
                .padding(.bottom, 30)

                CustomRoundedButtonView(
                    text: "Proceed to payment",
                    width: 60,
                    onTap: {
                        if(viewModel.coupon != nil){
                            var user = AuthManager.shared.applicationUser
                            user?.couponCode = viewModel.coupon?.code
                            AuthManager.shared.updateUser(updatedUser: user!)
                        }
                        onClick?(true)
                    }, isButtonEnabled: .constant(true)
                )
            }

            Spacer()

        }
        .onAppear {
            var user = AuthManager.shared.applicationUser
            user?.couponCode = nil
            AuthManager.shared.updateUser(updatedUser: user!)
            viewModel.setUp(
                totalPrice: Double(
                    cartCost?.totalAmount?.formattedPrice ?? "0.0") ?? 0.0)
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
