//
//  MyOrdersView.swift
//  M-Commerce-App
//
//  Created by Usef on 18/02/2025.
//

import SwiftUI

struct MyOrdersView: View {
    @StateObject var orderViewModel = OrderViewModel()
    @State var isMyOrdersSelected: Bool = true
    var body: some View {

        VStack {
            if !AuthManager.shared.isLoggedIn() {
                RequireLoginView()
            } else {
                SwitchScreensBar(isMyOrdersSelected: $isMyOrdersSelected)
                ScrollView {
                    if !orderViewModel.isLoading {
                        if isMyOrdersSelected {
                            if let cust = orderViewModel.orderModel.customer {
                                ForEach(cust.orders?.nodes ?? [], id: \.id) {
                                    ord in
                                    Button(
                                        action: {
                                            NavigationManager.shared.push(
                                                .orderDetails(
                                                    orderId: ord.id ?? ""))
                                        },
                                        label: {
                                            OrderedProductCard(
                                                name: cust.displayName
                                                    ?? "",
                                                phone:
                                                    "\(ord.phone ?? cust.phone ?? "")",
                                                email: ord.email ?? "",
                                                address: cust.addresses?
                                                    .first?
                                                    .address1 ?? "",
                                                orderNo:
                                                    "\(ord.orderNumber ?? 0)",
                                                orderPrice:
                                                    "\(CurrencyManager.currentCurrencyRate.code ?? "0") \(String(format: "%.2f",(Double( ord.currentTotalPrice?.amount ?? "0") ?? 0) * (CurrencyManager.currentCurrencyRate.value ?? 1.0)))",

                                                date: ord.processedAt ?? "",
                                                noOfProducts: 2,
                                                isMyOrder:
                                                    isMyOrdersSelected
                                            )
                                        })

                                }
                            }
                        }
                    } else {
                        CustomProgressView()
                    }
                }
                .padding(.top, 5)
                Spacer()
            }
        }.overlay(content: {
            if AuthManager.shared.isLoggedIn() {
                if orderViewModel.orderModel.customer?.orders?.nodes?.count
                    ?? 0
                    == 0 && !orderViewModel.isLoading && isMyOrdersSelected
                {
                    let msg = "No Orders Found"
                    let desc = Text(
                        "You don't have any orders yet. Place your first order now and start shopping!"
                    )
                    let img = "square.3.layers.3d.slash"
                    ContentUnavailableView(
                        msg, systemImage: img, description: desc)
                } else if !isMyOrdersSelected {
                    VStack {
                        let msg = "No History Found"
                        let desc = Text(
                            "Your order history is empty. Place an order now and begin your journey with us!"
                        )
                        let img = "icloud.slash"
                        ContentUnavailableView(
                            msg, systemImage: img, description: desc)
                    }.frame(height: 500)
                }
            }
        })
        .navigationTitle(Text("Orders"))
        .navigationBarBackButtonHidden(true)

        .onAppear {
            orderViewModel.fetchOrders()
        }
    }
}

#Preview {
    NavigationView {
        MyOrdersView()
    }
}
