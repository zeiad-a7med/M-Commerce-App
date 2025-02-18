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
    @State var selectedVariant: ProductVariant?
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 5),
        GridItem(.flexible(), spacing: 5),
        GridItem(.flexible(), spacing: 5),
        GridItem(.flexible(), spacing: 5),
    ]
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
                                if selectedVariant != nil {
                                    CustomNetworkImageView(
                                        url: URL(
                                            string: selectedVariant?.image?.url
                                                ?? ""

                                        )!
                                    )
                                    .frame(
                                        width: UIScreen.main.bounds.width,
                                        height: UIScreen.main.bounds.width
                                            + 70
                                    )
                                } else {
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
                                                    string: viewModel
                                                        .productRes?
                                                        .product?.images?[
                                                            index
                                                        ].url ?? ""

                                                )!
                                            )
                                            .frame(
                                                width: UIScreen.main.bounds
                                                    .width,
                                                height: UIScreen.main.bounds
                                                    .width
                                                    + 70
                                            )

                                        }
                                    }
                                }

                            }

                        }
                        .frame(
                            width: UIScreen.main.bounds.width,
                            height: UIScreen.main.bounds.width
                        )
                        .ignoresSafeArea(.all)
                        .scrollTargetLayout()
                        .scrollTargetBehavior(.paging)
                        Spacer()
                    }
                    VStack {
                        Spacer()
                        VStack(alignment: .leading) {

                            ScrollView {
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
                                        width: UIScreen.main.bounds.width * 2
                                            / 3,
                                        alignment: .leading)
                                    Spacer()
                                    FavoriteButtonView(
                                        product: viewModel.productRes!.product!,
                                        size: 30
                                    ).padding(.trailing, 5)
                                }.padding(.bottom, 20)
                                if viewModel.productRes?.product?.variants?
                                    .isEmpty == false
                                {
                                    ScrollView(
                                        .horizontal, showsIndicators: false
                                    ) {
                                        HStack {
                                            ForEach(
                                                0..<(viewModel.productRes?
                                                    .product?
                                                    .variants ?? []).count
                                            ) { index in
                                                CustomChip(
                                                    isSelected: selectedVariant
                                                        == viewModel
                                                        .productRes?
                                                        .product?
                                                        .variants?[index],
                                                    text: viewModel.productRes?
                                                        .product?
                                                        .variants?[index]
                                                        .title ?? "",
                                                    onSelected: {
                                                        if selectedVariant
                                                            == viewModel
                                                            .productRes?
                                                            .product?
                                                            .variants?[index]
                                                        {

                                                            selectedVariant =
                                                                nil
                                                        } else {
                                                            selectedVariant =
                                                                viewModel
                                                                .productRes?
                                                                .product?
                                                                .variants?[
                                                                    index]
                                                        }
                                                    }
                                                )
                                            }.padding([.leading, .trailing],5)
                                                .padding([.top, .bottom],10)
                                        }
                                    }
                                    .padding(.bottom, 15)
                                }

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
                                    (selectedVariant?.price?.amount
                                        ?? viewModel.productRes?.product?
                                        .formattedPrice) ?? ""
                                )
                                .font(.title)
                                Spacer()
                                CustomRoundedButtonView(
                                    text: "Add to Cart",
                                    systemIconName: "handbag",
                                    onTap: {
                                        print("Tapped")
                                    },
                                    isButtonEnabled: .constant(
                                        selectedVariant != nil)
                                )

                            }
                        }
                        .padding(30)
                        .frame(
                            width: UIScreen.main.bounds.width,
                            height: UIScreen.main.bounds.height / 2 + 60
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
