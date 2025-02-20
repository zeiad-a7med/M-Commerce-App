//
//  DetailsView.swift
//  M-Commerce-App
//
//  Created by Usef on 19/02/2025.
//

import SwiftUI

struct DetailsView: View {
    @StateObject var detailsViewModel = DetailsViewModel(customerAccessTaken: "e43f5e2e26fe3059f5b4ca16e53b588f")
    var numberOfOrder:Int
    var body: some View {
        ScrollView {
            VStack {
                if !detailsViewModel.isLoading {
                    if let dvm = detailsViewModel.detailsModel.customer {
                        ForEach(dvm.orders?.nodes?[numberOfOrder].lineItems?.nodes ?? [], id: \.quantity) { order in
                            var separatedText: [String] {
                                order.variant?.title?.split(separator: "/").map { $0.trimmingCharacters(in: .whitespaces) } ?? []
                                }
                            OrderCard(imgUrl: order.variant?.image?.url ?? "",
                            prodTitle: order.title ?? "",
                                      vendor: order.product?.vendor ?? "",
                                      prodVarient: order.variant?.title ?? "",
                                      prodPrice: "\(order.price?.amount ?? "0") EGP" ,
                                      prodQty: order.currentQuantity ?? 0,
                            isMyOrder: true,
                                      detailsDest: AnyView(ProductInfoView(productId: order.variant?.product?.id ?? "")))
                        }
                    }
                }else{
                    CustomProgressView()
                }
                Spacer()
            }.navigationTitle(Text("Ordered Products"))
        }
    }
}

#Preview {
    NavigationView {
        DetailsView( numberOfOrder: 0)
    }
}

