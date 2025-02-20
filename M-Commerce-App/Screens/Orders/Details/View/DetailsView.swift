//
//  DetailsView.swift
//  M-Commerce-App
//
//  Created by Usef on 19/02/2025.
//

import SwiftUI

struct DetailsView: View {
    @StateObject var detailsViewModel = DetailsViewModel(customerAccessTaken: "e43f5e2e26fe3059f5b4ca16e53b588f")
    var body: some View {
        ScrollView {
            VStack {
//                if !detailsViewModel.isLoading {
//                    if let dvm = detailsViewModel.detailsModel.customer {
//                        ForEach(dvm.orders?.nodes?.first?.lineItems?.nodes ?? [], id: \.quantity) { order in
//                            var separatedText: [String] {
//                                order.variant?.title?.split(separator: "/").map { $0.trimmingCharacters(in: .whitespaces) } ?? []
//                                }
//                            OrderCard(imgUrl: order.variant?.img?.url ?? "",
//                            prodTitle: order.title ?? "",
//                            prodClr: "Black",
//                                      prodPrice: separatedText[1],
//                                      prodQty: Int(separatedText[0]) ?? 0,
//                            isMyOrder: true,
//                            detailsDest: AnyView(Text("first detail")))
//                        }
//                    }
//                }else{
//                    CustomProgressView()
//                }
                Spacer()
            }.navigationTitle(Text("Order Details"))
        }
    }
}

#Preview {
    NavigationView {
        DetailsView()
    }
}

