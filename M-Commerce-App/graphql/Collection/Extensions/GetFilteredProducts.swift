//
//  GetFilteredProducts.swift
//  M-Commerce-App
//
//  Created by Usef on 14/02/2025.
//

import Foundation
import ShopifyAPIKit
import SwiftUI

extension GetFilteredProductsQuery {
    
    static func parseFilteredProducts(from prod: GetFilteredProductsQuery.Data.Products) -> CategoriesResponse {
        var categories: CategoriesResponse = CategoriesResponse()
        var productsArray = [Product]()
        
        
        prod.nodes.forEach({ prod in
            var imgArray = [ImgModel]()
            imgArray.removeAll()
            prod.images.nodes.forEach { image in
                print("title: ",prod.title)
                print("vendor: ",prod.vendor)
                let imgM = ImgModel(altText: image.altText, height: image.height, originalSrc: image.originalSrc, url: image.url, width: image.width, id: image.id)
                imgArray.append(imgM)
            }
            
            let price1 = Price(amount: prod.priceRange.maxVariantPrice.amount, currencyCode: nil)
            let price2 = Price(amount: prod.priceRange.minVariantPrice.amount, currencyCode: nil)
            let pr = PriceRange(minVariantPrice: price1, maxVariantPrice: price2)
            var prodTemp = Product(desc: "", handle: prod.handle, id: prod.id, isGiftCard: prod.isGiftCard, productType: prod.productType, tags: prod.tags, title: prod.title, totalInventory: prod.totalInventory, updatedAt: "", vendor: prod.vendor, category: "", priceRange: pr, images: imgArray)
            prodTemp.handle = prod.handle
            productsArray.append(prodTemp)
        })
        print("count of res: \(productsArray.count)")
        let updatedPageInfo = PageInfo(
            startCursor : prod.pageInfo.startCursor ?? "",
            endCursor : prod.pageInfo.endCursor ?? "",
            hasNextPage : prod.pageInfo.hasNextPage,
            hasPreviousPage : prod.pageInfo.hasPreviousPage
        )
        categories.categoryProducts = productsArray
        categories.pageInfo = updatedPageInfo
        print("count of res again:",categories.categoryProducts?.count ?? 999)
        return categories
    }
        
}
    
    
    
    


