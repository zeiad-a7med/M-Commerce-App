//
//  ProductInfoView.swift
//  M-Commerce-App
//
//  Created by Zeiad on 12/02/2025.
//

import SwiftUI

struct ProductInfoView: View {
    var productId: String
    @StateObject var viewModel: ProductViewModel
    @ObservedObject private var favoritesManager = FavoritesManager.shared  // Singleton instance
    init(productId: String) {
        self.productId = productId
        _viewModel = StateObject(
            wrappedValue: ProductViewModel(productId: productId))
    }

    @State var val: Int = 0
    var body: some View {
        if viewModel.isLoading {
            ProgressView()
        } else {
            if viewModel.productRes?.success == false {
                ContentUnavailableView(
                    "No Product Found", systemImage: "square.3.layers.3d.slash",
                    description: Text("cant find this product"))
            } else {
                ZStack {
                    Color(.white)
                        .ignoresSafeArea(.all)
                    VStack {
                        ScrollView(.horizontal, showsIndicators: false) {
                            VStack {
                                LazyHStack {
                                    ForEach(
                                        Array(
                                            (viewModel.productRes?.product?
                                                .images ?? [])
                                                .enumerated()), id: \.offset
                                    ) {
                                        index, discount in
                                        CustomNetworkImageView(
                                            url: URL(
                                                string: viewModel.productRes?
                                                    .product?.images?[
                                                        index
                                                    ].url ?? ""

                                            )!
                                        )
                                        .frame(
                                            width: UIScreen.main.bounds.width,
                                            height: UIScreen.main.bounds.width
                                                + 70
                                        )

                                    }
                                }

                            }

                        }
                        .frame(
                            width: UIScreen.main.bounds.width,
                            height: UIScreen.main.bounds.width + 70
                        )
                        .ignoresSafeArea(.all)
                        .scrollTargetLayout()
                        .scrollTargetBehavior(.paging)
                        Spacer()
                    }
                    VStack {
                        Spacer()
                        VStack(alignment: .leading) {

                            HStack {
                                VStack(alignment: .leading) {
                                    Text(
                                        viewModel.productRes?.product?.title
                                            ?? ""
                                    )
                                    .font(.title2)
                                    .multilineTextAlignment(.leading)
                                    .bold(true)
                                    .padding(.bottom, 10)
                                    StarRatingView(
                                        rating: Double.random(in: 2...5))
                                }.frame(
                                    width: UIScreen.main.bounds.width * 2 / 3,
                                    alignment: .leading)
                                Spacer()
                                FavoriteButtonView(
                                    product: viewModel.productRes!.product!,
                                    size: 30
                                )
                            }.padding(.bottom, 20)

                            ScrollView {
                                ReadMoreTextView(
                                    text: viewModel.productRes?.product?.desc
                                        ?? "",
                                    lineLimit: 3
                                )
                                .font(.system(size: 19))
                                .foregroundColor(.primary)
                                .padding(.bottom, 10)

                                HStack {
                                    Text("Choose amount:")
                                        .bold(true)
                                    Spacer()
                                    CustomStepper(numberOfItem: 1) { count in
                                        print(count)
                                    }
                                }
                            }
                            Spacer()
                            HStack {
                                Text(
                                    viewModel.productRes?.product?.currency
                                        ?? ""
                                )
                                .foregroundStyle(ThemeManager.darkPuble)
                                .font(.title)
                                Text(
                                    viewModel.productRes?.product?
                                        .formattedPrice ?? ""
                                )
                                .font(.title)
                                Spacer()
                                CustomRoundedButtonView(
                                    text: "Add to Cart",
                                    systemIconName: "handbag",
                                    onTap: {
                                        print("Tapped")
                                    }
                                )

                            }

                        }
                        .padding(30)
                        .frame(
                            width: UIScreen.main.bounds.width,
                            height: UIScreen.main.bounds.height / 2
                        )
                        .background(.thickMaterial)
                        .clipShape(
                            RoundedCornerShape(
                                corners: [.topRight, .topLeft], radius: 40)
                        )
                    }
                    .ignoresSafeArea(.all)
                }
            }

        }

    }
}

#Preview {
    ProductInfoView(productId: "gid://shopify/Product/15046227394931")
}
