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
    @State var currentVariantSelectedQuantity: Int = 0
    @State var totalPrice: Double = 0.0
    @State var finalTotalPrice: Double = 0.0

    init(productId: String) {
        self.productId = productId
        _viewModel = StateObject(
            wrappedValue: ProductViewModel(productId: productId))
    }
    @State var val: Int = 0
    var body: some View {
        VStack{
            if viewModel.productRes?.success == false {
                ContentUnavailableView(
                    "No Product Found", systemImage: "square.3.layers.3d.slash",
                    description: Text("cant find this product"))
            } else {
                if(viewModel.productRes?.product != nil){
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

                                ScrollView (showsIndicators: false){
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
                                        }.frame(
                                            width: UIScreen.main.bounds.width * 2
                                                / 3,
                                            alignment: .leading)
                                        Spacer()
                                        FavoriteButtonView(
                                            product: viewModel.productRes!.product!,
                                            size: 30
                                        ).padding(.trailing, 5)
                                    }.padding(.bottom,5)
                                        .padding(.horizontal,5)
                                    AvailabiltyView(title:"Available in stock",amount: viewModel.productRes?.product?.totalInventory ?? 0)
                                    HStack{
                                        StarRatingView(
                                            rating: Double.random(in: 2...5))
                                        Spacer()
                                        Text("View all reviews")
                                            .bold()
                                            .foregroundStyle(.blue)
                                            .onTapGesture {
                                                NavigationManager.shared.push(.reviews)
                                            }
                                    }.padding(.bottom, 10)
                                    
                                    
                                    
                                    if viewModel.variantsForCart
                                        .isEmpty == false
                                    {
                                        ScrollView(
                                            .horizontal, showsIndicators: false
                                        ) {
                                            HStack {
                                                ForEach(
                                                    0..<(viewModel.variantsForCart)
                                                        .count
                                                ) { index in
                                                    CustomChip(
                                                        isSelected: selectedVariant?
                                                            .id
                                                            == viewModel
                                                            .variantsForCart[index]
                                                            .variantId,
                                                        text:
                                                            viewModel
                                                            .variantsForCart[index]
                                                            .title,
                                                        badgeNumber: .constant(
                                                            viewModel
                                                                .variantsForCart[
                                                                    index
                                                                ].quantity),
                                                        onSelected: {
                                                            if selectedVariant
                                                                == viewModel
                                                                .productRes?
                                                                .product?
                                                                .variants?[index]
                                                            {

                                                                selectedVariant =
                                                                    nil
                                                                currentVariantSelectedQuantity =
                                                                    0
                                                            } else {
                                                                selectedVariant =
                                                                    viewModel
                                                                    .productRes?
                                                                    .product?
                                                                    .variants?[
                                                                        index]
                                                                currentVariantSelectedQuantity =
                                                                    viewModel
                                                                    .variantsForCart
                                                                    .first(where: {
                                                                        variant in
                                                                        variant
                                                                            .variantId
                                                                            == selectedVariant?
                                                                            .id
                                                                    })?.quantity
                                                                    ?? 0
                                                            }
                                                        }
                                                    )

                                                }.padding([.leading, .trailing], 5)
                                                    .padding([.top, .bottom], 10)
                                            }
                                        }
                                        .padding(.bottom, 15)
                                    }
                                    if(selectedVariant != nil){
                                        AvailabiltyView(title:"Quantity for (\(selectedVariant?.title ?? ""))",amount: selectedVariant?.quantityAvailable ?? 0)
                                    }
                                    HStack {
                                        Text("Choose amount:")
                                            .bold(true)
                                        Spacer()
                                        NumberOfItems(
                                            numberOfItem:
                                                $currentVariantSelectedQuantity,
                                            max: PurchaseRule.ProductPurchaseLimit(productQuantity: selectedVariant?.quantityAvailable
                                                                                ?? 0)
                                        ) { quantity in
                                            if selectedVariant != nil {
                                                viewModel.updateQuantity(
                                                    variant: selectedVariant!,
                                                    quantity: quantity)
                                                calculateTotalPrice()
                                            }
                                        }
                                    }.padding(.bottom, 10)
                                        
                                    ReadMoreTextView(
                                        text: viewModel.productRes?.product?.desc
                                            ?? "",
                                        lineLimit: 3
                                    )
                                    .font(.system(size: 19))
                                    .foregroundColor(.primary)
                                    .padding(.bottom, 10)
                                }
                                Spacer()
                                HStack {
                                    if(totalPrice != 0){
                                        Text(
                                            viewModel.productRes?.product?.currency
                                                ?? ""
                                        )
                                        .foregroundStyle(ThemeManager.darkPuble)
                                        .font(.title3)
                                        Text(String(format: "%.2f", finalTotalPrice))
                                            .font(.title3)
                                    }
                                    Spacer()
                                    if(viewModel.productAddedToCart){
                                        CustomRoundedButtonView(
                                            text: "View Cart",
                                            systemIconName: "cart",
                                            onTap: {
//                                                if AuthManager.shared.isLoggedIn() {
//                                                    viewModel.updateCart { success in
//                                                        NavigationManager.shared.push(.cart)
//                                                    }
//                                                } else {
//                                                    AlertManager.shared.showLoginAlert()
//                                                }
                                            },
                                            isButtonEnabled: .constant(true)
                                        )
                                    }else{
                                        CustomRoundedButtonView(
                                            text: "Add to Cart",
                                            systemIconName: "cart.badge.plus",
                                            onTap: {
                                                if AuthManager.shared.isLoggedIn() {
                                                    viewModel.addToCart()
                                                } else {
                                                    AlertManager.shared.showLoginAlert()
                                                }
                                            },
                                            isButtonEnabled: .constant(
                                                totalPrice != 0)
                                        )
                                    }

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
                    .onChange(of: totalPrice, {
                        finalTotalPrice = (totalPrice * (CurrencyManager.currentCurrencyRate.value ?? 1.0))
                    })
                }
                
                
            }
        }
        .overlay {
            if viewModel.isLoading {
                VStack {
                    CustomProgressView()
                }.frame(
                    width: UIScreen.main.bounds.width,
                    height: UIScreen.main.bounds.height
                )
                .background(.primary.opacity(0.1))
            }
        }
        .toolbar(.hidden,for: .tabBar)
        .onAppear{
            calculateTotalPrice()
        }
        .alert(
            "Are you sure you want to delete this variant?",
            isPresented: Binding(
                get: { viewModel.deletionAlertVisible },
                set: { viewModel.deletionAlertVisible = $0 }
            )
        ) {

            Button("Remove",role: .destructive) {
                viewModel.deleteFromCart()
            }

            Button("Cancel",role: .cancel) {
                if(viewModel.currentdeletionVariant != nil){
                    viewModel.updateQuantity(variant: viewModel.currentdeletionVariant!, quantity: 1)
                    currentVariantSelectedQuantity = 1
                    calculateTotalPrice()
                }
            }

        } message: {
            Text("Once you delete this variant, it cannot be restored in your cart.")
        }
    }
    func calculateTotalPrice() {
        var total: Double = 0
        viewModel.variantsForCart.forEach { variant in
            total += variant.price * Double(variant.quantity)
        }
        totalPrice = total
    }
}

#Preview {
    ProductInfoView(productId: "gid://shopify/Product/15046227394931")
}
