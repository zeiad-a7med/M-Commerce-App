//
//  MyOrdersView.swift
//  M-Commerce-App
//
//  Created by Usef on 18/02/2025.
//

import SwiftUI

struct MyOrdersView: View {
    @StateObject var orderViewModel = OrderViewModel(
        customerAccessTaken: AuthManager.shared.applicationUser?.accessToken ?? "")
    @State var isMyOrdersSelected: Bool = true
    var body: some View {
        NavigationView {
            VStack {
                if !AuthManager.shared.isLoggedIn() {
                    VStack {
                        ContentUnavailableView(
                            "You are not logged in",
                            systemImage: "person.slash",
                            description: Text(
                                "to view your favorites please sign in")
                        ).frame(height: 300)
                        NavigationLink(destination: LoginView()) {
                            CustomRoundedButtonView(
                                text: "Sign In",
                                width: 100,
                                onTap: {},
                                isButtonEnabled: .constant(true)
                            )
                            .allowsHitTesting(false)
                        }
                    }
                } else {
                    SwitchScreensBar(isMyOrdersSelected: $isMyOrdersSelected)
                    ScrollView {
                        if !orderViewModel.isLoading {
                            if isMyOrdersSelected {
                                if let cust = orderViewModel.orderModel.customer
                                {
                                    ForEach(cust.orders?.nodes ?? [], id: \.id)
                                    { ord in
                                        OrderedProductCard(
                                            name: cust.displayName ?? "",
                                            phone:
                                                "\(ord.phone ?? cust.phone ?? "")",
                                            email: ord.email ?? "",
                                            address: cust.addresses?.first?
                                                .address1 ?? "",
                                            orderNo: "\(ord.orderNumber ?? 0)",
                                            orderPrice:
                                                "\(ord.currentTotalPrice?.amount ?? "") \(ord.currentTotalPrice?.currencyCode ?? "")",
                                            date: ord.processedAt ?? "",
                                            noOfProducts: 2,
                                            isMyOrder: isMyOrdersSelected,
                                            detailsDest: AnyView(
                                                DetailsView(numberOfOrder: 0)),
                                            secondDest: AnyView(
                                                Text("Coming Soon")))
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
                if(AuthManager.shared.isLoggedIn()){
                    if orderViewModel.orderModel.customer?.orders?.nodes?.count ?? 0
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
        }
    }
}

#Preview {
    NavigationView {
        MyOrdersView()
    }
}
