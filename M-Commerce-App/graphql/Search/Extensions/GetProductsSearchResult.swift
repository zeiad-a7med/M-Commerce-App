//
//  GetProductsSearchResult.swift
//  M-Commerce-App
//
//  Created by Usef on 24/02/2025.
//

import Foundation
import ShopifyAPIKit

extension SearchProductQuery {

    static func parse(searchResponse: SearchProductQuery.Data.Search) -> SearchModel {
        var products = [SearchData]()
        searchResponse.nodes.forEach { prod in
            let parsedProduct = SearchData(
                id: prod.asProduct?.id ?? "",
                title: prod.asProduct?.title ?? "",
                productType: prod.asProduct?.productType ?? "",
                vendor: prod.asProduct?.vendor ?? "",
                totalInventory: prod.asProduct?.totalInventory ?? 0,
                description: prod.asProduct?.description ?? "",
                imgUrl: prod.asProduct?.featuredImage?.url ?? ""
                ,priceRange: PriceRange(minVariantPrice: Price(amount: prod.asProduct?.priceRange.minVariantPrice.amount,
                                                               currencyCode: prod.asProduct?.priceRange.minVariantPrice.currencyCode.rawValue),
                    maxVariantPrice: Price(amount: prod.asProduct?.priceRange.maxVariantPrice.amount
                                           , currencyCode: prod.asProduct?.priceRange.maxVariantPrice.currencyCode.rawValue)))
                products.append(parsedProduct)
        }
        let searchResp = SearchModel(products: products)
        return searchResp
    }
}
