//
//  WeatherService.swift
//  WeatherCast
//
//  Created by Zeiad on 11/02/2025.
//

import Foundation
import ShopifyAPIKit

protocol ProductServiceProtocol {
    static func getProductFromApi(
        complitionHandler: @escaping (ProductResponse?) -> Void)
}

class ProductService: ProductServiceProtocol {
    static func getProductFromApi(
        complitionHandler: @escaping (ProductResponse?) -> Void
    ) {
        ApolloNetwokService.shared.apollo.fetch(
            query: GetProductQuery(id: "gid://shopify/Product/15046227394931")
        ) { result in
            switch result {
            case .success(let graphQLResult):
                var productDTO = graphQLResult.data?.product
                var images: [ImgModel] = []
                productDTO?.images.nodes.forEach { img in
                    images.append(
                        ImgModel(
                            altText: img.altText, height: img.height,
                            originalSrc: img.originalSrc, url: img.url,
                            width: img.width, id: img.id))

                }
                var product = Product(
                    availableForSale: productDTO?.availableForSale ?? false,
                    description: productDTO?.description ?? "",
                    handle: productDTO?.handle ?? "",
                    id: productDTO?.id ?? "",
                    isGiftCard: productDTO?.isGiftCard ?? false,
                    productType: productDTO?.productType ?? "",
                    tags: productDTO?.tags ?? [],
                    title: productDTO?.title ?? "",
                    totalInventory: productDTO?.totalInventory ?? 0,
                    updatedAt: productDTO?.updatedAt ?? "",
                    vendor: productDTO?.vendor ?? "",
                    category: productDTO?.category?.name ?? "",
                    priceRange: PriceRange(
                        minVariantPrice: Price(
                            amount: productDTO?.priceRange.minVariantPrice
                                .amount ?? "",
                            currencyCode: (productDTO?.priceRange
                                .minVariantPrice.currencyCode.rawValue ?? "")

                        ),
                        maxVariantPrice: Price(
                            amount: productDTO?.priceRange.maxVariantPrice
                                .amount ?? "",
                            currencyCode: (productDTO?.priceRange
                                .maxVariantPrice.currencyCode.rawValue ?? "")
                        )
                    ),
                    featuredImage: ImgModel(
                        altText: productDTO?.featuredImage?.altText ?? "",
                        height: productDTO?.featuredImage?.height ?? 0,
                        originalSrc: productDTO?.featuredImage?.originalSrc
                            ?? "",
                        url: productDTO?.featuredImage?.url ?? "",
                        id: productDTO?.featuredImage?.id ?? ""
                    ),
                    images: images,
                    encodedVariantExistence: productDTO?.encodedVariantExistence
                        ?? "",
                    encodedVariantAvailability: productDTO?
                        .encodedVariantAvailability ?? ""
                )
                complitionHandler(
                    ProductResponse(
                        product: product,
                        success: true
                    ))

            case .failure(let error):
                complitionHandler(
                    ProductResponse(
                        success: false
                    ))
                print("Failure! Error: \(error.localizedDescription)")
            }
        }
    }
}
