//
//  DetailsView.swift
//  M-Commerce-App
//
//  Created by Usef on 19/02/2025.
//

import SwiftUI

struct DetailsView: View {
    @StateObject var detailsViewModel = DetailsViewModel()
    var orderId: String
    var body: some View {
        ScrollView {
            VStack {
                if !detailsViewModel.isLoading {
                    if let dvm = detailsViewModel.detailsModel.customer {
                        ForEach(
                            dvm.orders?.nodes?.first?.lineItems?.nodes ?? [],
                            id: \.quantity
                        ) { order in
                            var separatedText: [String] {
                                order.variant?.title?.split(separator: "/").map
                                { $0.trimmingCharacters(in: .whitespaces) }
                                    ?? []
                            }
                            OrderCard(
                                imgUrl: order.variant?.image?.url ?? "",
                                prodTitle: order.title ?? "",
                                vendor: order.product?.vendor ?? "",
                                prodVarient: order.variant?.title ?? "",
                                prodPrice:"\(CurrencyManager.currentCurrencyRate.code ?? "0") \(String(format: "%.2f",(Double( order.price?.amount ?? "0") ?? 0) * (CurrencyManager.currentCurrencyRate.value ?? 1.0)))",

                                prodQty: order.currentQuantity ?? 0,
                                isMyOrder: true,
                                detailsDest: AnyView(
                                    ProductInfoView(
                                        productId: order.variant?.product?.id
                                            ?? "")))
                        }
                    }
                } else {
                    CustomProgressView()
                }
                Spacer()
            }.navigationTitle(Text("Ordered Products"))
                .toolbar(.hidden,for: .tabBar)
                .onAppear {
                    detailsViewModel.fetchProductsOfOrder(orderId: orderId)
                    var p = ""
                    var q = 1
                    var str : String = "\(CurrencyManager.currentCurrencyRate.code ?? "0") \((Double( p ?? "0") ?? 0) * (Double(q) ?? 0) * (CurrencyManager.currentCurrencyRate.value ?? 1.0))"
                    
                }
        }
    }
}

#Preview {
    //    NavigationView {
    //        DetailsView( numberOfOrder: 0)
    //    }
}
