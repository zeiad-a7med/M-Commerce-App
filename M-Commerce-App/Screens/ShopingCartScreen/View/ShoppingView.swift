//
//  ShoppingView.swift
//  ShoppingCart
//
//  Created by Andrew Emad on 11/02/2025.
//

import SwiftUI

struct ShoppingView: View {
    @State var deleteAlertVisible: Bool = false
    @State var totalPrice: Double = 0.0
    @State var showCheckOut: Bool = false
    @State var isLoggedIn: Bool = false
    @State var currentDeletion: Line?
    @State var navigateToPayment: Bool = false
    @StateObject var viewModel = ShoppingCartViewModel()
    var body: some View {
        VStack {
            if isLoggedIn {
                if viewModel.cartResult?.cart?.lines?.isEmpty == false {
                    List {
                        if let tempViewModel = viewModel.cartResult?.cart?.lines
                        {
                            ForEach(tempViewModel, id: \.id) { line in
                                NavigationLink(destination: ProductInfoView(productId: line.variant?.productId ?? "")) {
                                    RowCard(
                                        line: line,
                                        changeNumberOfItemInRow: { count in
                                            viewModel.updateLineQuantity(
                                                line: line, quantity: count)
                                        },
                                        onDelete: { _ in
                                            currentDeletion = line
                                            deleteAlertVisible = true
                                        },
                                        minimumNumberOfItems: 1,
                                        numberOfItems: line.quantity ?? 0
                                    )
                                }
                            }
                            
                            .onDelete(perform: deleteLineWithOffset)
                        }
                    }.buttonStyle(.borderless)
                    CustomRoundedButtonView(
                        text: "Proceed to checkout",
                        width: 60,
                        onTap: {
                            viewModel.updateCart { success in
                                if success {
                                    showCheckOut.toggle()
                                }
                            }
                        }, isButtonEnabled: .constant(true)
                    )
                    .sheet(
                        isPresented: $showCheckOut,
                        content: {
                            CheckOutComponent(
                                cartCost: viewModel.cartResult?.cart?.cost,
                                onClick: { isClicked in
                                    showCheckOut = false
                                    navigateToPayment = isClicked
                                }
                            )
                            .presentationDetents([.medium])

                        }
                    )
                    NavigationLink(
                        destination: PaymentView(), isActive: $navigateToPayment
                    ) {
                        EmptyView()
                    }
                    .alert(
                        "Do you really wish to remove your item from the cart?",
                        isPresented: $deleteAlertVisible
                    ) {
                        Button("Delete", role: .destructive) {
                            viewModel.deleteFromCart(
                                deletedLine: currentDeletion!)
                            currentDeletion = nil
                        }
                        Button("Cancel", role: .cancel) {
                            deleteAlertVisible = false
                            currentDeletion = nil
                        }
                    }
                } else {
                    VStack {
                        ContentUnavailableView(
                            "The cart is empty",
                            systemImage: ThemeManager.cartImg,
                            description: Text(
                                "Discover our products and add them to your cart"
                            )
                        ).frame(height: 300)
                    }
                }
            } else {
                RequireLoginView()
            }

        }.onAppear {
            isLoggedIn = AuthManager.shared.isLoggedIn()
        }
        .onDisappear {
            viewModel.updateCart { success in
            }
        }
        .navigationTitle("Shopping Cart")
        .toolbar(.hidden,for: .tabBar)
    }
    func deleteLineWithOffset(at offsets: IndexSet) {
        offsets.forEach { index in
            currentDeletion = viewModel.cartResult?.cart?.lines?[index]
            deleteAlertVisible = true
        }
    }

}

#Preview {
    ShoppingView()
}
