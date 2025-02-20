//
//  MyOrdersView.swift
//  M-Commerce-App
//
//  Created by Usef on 18/02/2025.
//

import SwiftUI

struct MyOrdersView: View {
    @StateObject var orderViewModel = OrderViewModel(customerAccessTaken: "e43f5e2e26fe3059f5b4ca16e53b588f")
    @State var isMyOrdersSelected:Bool = true
    var body: some View {
        VStack {
            SwitchScreensBar(isMyOrdersSelected: $isMyOrdersSelected)
            ScrollView {
                if !orderViewModel.isLoading {
                    if isMyOrdersSelected {
                        if let cust = orderViewModel.orderModel.customer {
                            ForEach(cust.orders?.nodes ?? [],id:\.id ) { ord in
                                OrderedProductCard(name: cust.displayName ?? "",
                                    phone: "\(ord.phone ?? cust.phone ?? "")",
                                    email: ord.email ?? "",
                                    address: cust.addresses?.first?.address1 ?? "",
                                    orderNo: "\(ord.orderNumber ?? 0)"
                                    ,orderPrice: "\(ord.currentTotalPrice?.amount ?? "") \(ord.currentTotalPrice?.currencyCode ?? "")" ,
                                        isMyOrder: isMyOrdersSelected,
                                        detailsDest: AnyView(DetailsView()),
                                                   secondDest: AnyView(Text("Coming Soon")))
                            }
                        }
                    }else {
                        VStack {
                            let msg = "No History Found"
                            let desc = Text("Your order history is empty. Place an order now and begin your journey with us!")
                            let img = "icloud.slash"
                            ContentUnavailableView(msg , systemImage: img, description: desc)
                        }.frame(height: 500)
                    }
                }else{
                    CustomProgressView()
                }
                
            }.overlay(content: {
                if orderViewModel.orderModel.customer?.orders?.nodes?.count ?? 0 == 0 && !orderViewModel.isLoading {
                    let msg = "No History Found"
                    let desc = Text("Your order history is empty. Place an order now and begin your journey with us!")
                    let img = "square.3.layers.3d.slash"
                    ContentUnavailableView(msg , systemImage: img, description: desc)
                        }
                    })
            .padding(.top,5)
            Spacer()
        }.navigationTitle(Text("Orders"))
    }
}

#Preview {
    NavigationView {
        MyOrdersView()
    }
}

