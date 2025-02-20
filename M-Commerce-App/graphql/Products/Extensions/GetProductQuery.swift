//
//  GetProduct.swift
//  M-Commerce-App
//
//  Created by Zeiad on 13/02/2025.
//
import ShopifyAPIKit

extension GetProductQuery {
    static func parse(from productDTO: GetProductQuery.Data.Product)
        -> Product
    {
        var images: [ImgModel] = []
        productDTO.images.nodes.forEach { img in
            images.append(
                ImgModel(
                    altText: img.altText, height: img.height,
                    originalSrc: img.originalSrc, url: img.url,
                    width: img.width, id: img.id))
        }
        var variants: [ProductVariant] = []
        productDTO.variants.nodes.forEach { variant in
            variants.append(
                ProductVariant(
                    id: variant.id,
                    title: variant.title,
                    image: ImgModel(
                        altText: variant.image?.altText,
                        height: variant.image?.height,
                        originalSrc: variant.image?.originalSrc,
                        url: variant.image?.url,
                        width: variant.image?.width,
                        id: variant.image?.id
                    ),
                    barcode: variant.barcode,
                    availableForSale: variant.availableForSale,
                    currentlyNotInStock: variant.currentlyNotInStock,
                    quantityAvailable: variant.quantityAvailable,
                    requiresComponents: variant.requiresComponents,
                    requiresShipping: variant.requiresShipping,
                    sku: variant.sku,
                    taxable: variant.taxable,
                    weight: variant.weight,
                    weightUnit: variant.weightUnit.rawValue,
                    price: Price(
                        amount: variant.price.amount,
                        currencyCode: variant.price.currencyCode.rawValue),
                    priceV2: Price(
                        amount: variant.priceV2.amount,
                        currencyCode: variant.priceV2.currencyCode.rawValue),
                    quantityRule: QuantityRule(
                        increment: variant.quantityRule.increment,
                        maximum: variant.quantityRule.maximum,
                        minimum: variant.quantityRule.minimum
                    )
                )
            )
        }
        let product = Product(
            availableForSale: productDTO.availableForSale,
            desc: productDTO.description,
            handle: productDTO.handle,
            id: productDTO.id,
            isGiftCard: productDTO.isGiftCard,
            productType: productDTO.productType,
            tags: productDTO.tags,
            title: productDTO.title,
            totalInventory: productDTO.totalInventory ?? 0,
            updatedAt: productDTO.updatedAt,
            vendor: productDTO.vendor,
            category: productDTO.category?.name ?? "",
            priceRange: PriceRange(
                minVariantPrice: Price(
                    amount: productDTO.priceRange.minVariantPrice
                        .amount,
                    currencyCode: (productDTO.priceRange
                        .minVariantPrice.currencyCode.rawValue)

                ),
                maxVariantPrice: Price(
                    amount: productDTO.priceRange.maxVariantPrice
                        .amount,
                    currencyCode: (productDTO.priceRange
                        .maxVariantPrice.currencyCode.rawValue)
                )
            ),
            featuredImage: ImgModel(
                altText: productDTO.featuredImage?.altText ?? "",
                height: productDTO.featuredImage?.height ?? 0,
                originalSrc: productDTO.featuredImage?.originalSrc,
                url: productDTO.featuredImage?.url ?? "",
                width: productDTO.featuredImage?.height ?? 0,
                id: productDTO.featuredImage?.id ?? ""
            ),
            images: images,
            encodedVariantExistence: productDTO.encodedVariantExistence
                ?? "",
            encodedVariantAvailability: productDTO
                .encodedVariantAvailability ?? "",
            variants: variants,
            variantsCount: VariantsCount(
                count: productDTO.variantsCount?.count ?? nil,
                precision: productDTO.variantsCount?.precision.rawValue
            )
        )
        return product
    }
}
