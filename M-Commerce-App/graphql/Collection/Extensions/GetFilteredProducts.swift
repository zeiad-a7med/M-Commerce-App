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
    
    static func parseFilteredProductsForCat(from prod: GetFilteredProductsQuery.Data.Products) -> CategoriesResponse {
        var categories: CategoriesResponse = CategoriesResponse()
        var productsArray = [Product]()
        
        
        prod.nodes.forEach({ prod in
            
            let image = prod.featuredImage
            var imgM = ImgModel()
            if(image != nil){
                imgM = ImgModel(altText: image?.altText, height: image?.height, originalSrc: image?.originalSrc, url: image?.url, width: image?.width, id: image?.id)
            }
            
            
            let price1 = Price(amount: prod.priceRange.maxVariantPrice.amount, currencyCode: prod.priceRange.maxVariantPrice.currencyCode.rawValue)
            let price2 = Price(amount: prod.priceRange.minVariantPrice.amount, currencyCode: prod.priceRange.minVariantPrice.currencyCode.rawValue)
            let pr = PriceRange(minVariantPrice: price1, maxVariantPrice: price2)
            let prodTemp = Product(desc: "", handle: prod.handle, id: prod.id, isGiftCard: prod.isGiftCard, productType: prod.productType, tags: prod.tags, title: prod.title, totalInventory: prod.totalInventory, updatedAt: "", vendor: prod.vendor, category: "", priceRange: pr, featuredImage: imgM)
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
    static func parseFilteredProducts(from prod: GetFilteredProductsQuery.Data.Products) -> BrandResponse {
        let brandProducts: BrandResponse = BrandResponse()
        var productsArray = [Product]()
        prod.nodes.forEach({ prod in
            let image = prod.featuredImage
            var imgM = ImgModel()
            if(image != nil){
                imgM = ImgModel(altText: image?.altText, height: image?.height, originalSrc: image?.originalSrc, url: image?.url, width: image?.width, id: image?.id)
            }
            
            let price1 = Price(amount: prod.priceRange.maxVariantPrice.amount, currencyCode: prod.priceRange.maxVariantPrice.currencyCode.rawValue)
            let price2 = Price(amount: prod.priceRange.minVariantPrice.amount, currencyCode: prod.priceRange.minVariantPrice.currencyCode.rawValue)
            let pr = PriceRange(minVariantPrice: price1, maxVariantPrice: price2)
            let prodTemp = Product(desc: "", handle: prod.handle, id: prod.id, isGiftCard: prod.isGiftCard, productType: prod.productType, tags: prod.tags, title: prod.title, totalInventory: prod.totalInventory, updatedAt: "", vendor: prod.vendor, category: "", priceRange: pr, featuredImage: imgM)
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
        brandProducts.BrandProducts = productsArray
        brandProducts.pageInfo = updatedPageInfo
        print("count of res again:",brandProducts.BrandProducts?.count ?? 999)
        return brandProducts
    }
        
}
    
    
    
    


