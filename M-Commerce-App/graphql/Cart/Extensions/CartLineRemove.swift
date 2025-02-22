//
//  GetCart.swift
//  M-Commerce-App
//
//  Created by Zeiad on 20/02/2025.
//

import Foundation
import ShopifyAPIKit

extension CartLinesRemoveMutation {
    static func parse(from cartDTO: CartLinesRemoveMutation.Data.CartLinesRemove.Cart)
        -> Cart
    {
        let cart = Cart(
            id: cartDTO.id,
            checkoutUrl: cartDTO.checkoutUrl,
            note: cartDTO.note,
            totalQuantity: cartDTO.totalQuantity,
            lines: cartDTO.lines.nodes.map { line in
                Line(
                    id: line.id,
                    variant:
                        ProductVariant(
                            id: line.merchandise.asProductVariant?.id,
                            title: line.merchandise.asProductVariant?.title,
                            image: ImgModel(
                                altText: line.merchandise.asProductVariant?.image?.altText,
                                height: line.merchandise.asProductVariant?.image?.height,
                                url: line.merchandise.asProductVariant?.image?.url,
                                width: line.merchandise.asProductVariant?.image?.width,
                                id: line.merchandise.asProductVariant?.image?.id
                            ),
                            barcode: line.merchandise.asProductVariant?.barcode,
                            availableForSale: line.merchandise.asProductVariant?.availableForSale,
                            currentlyNotInStock: line.merchandise.asProductVariant?.currentlyNotInStock,
                            quantityAvailable: line.merchandise.asProductVariant?.quantityAvailable,
                            requiresComponents: line.merchandise.asProductVariant?.requiresComponents,
                            requiresShipping: line.merchandise.asProductVariant?.requiresShipping,
                            sku: line.merchandise.asProductVariant?.sku,
                            taxable: line.merchandise.asProductVariant?.taxable,
                            weight: line.merchandise.asProductVariant?.weight,
                            weightUnit: line.merchandise.asProductVariant?.weightUnit.rawValue,
                            price: Price(
                                amount: line.merchandise.asProductVariant?.price.amount,
                                currencyCode: line.merchandise.asProductVariant?.price.currencyCode
                                    .rawValue),
                            quantityRule: QuantityRule(
                                increment: line.merchandise.asProductVariant?.quantityRule.increment,
                                maximum: line.merchandise.asProductVariant?.quantityRule.maximum,
                                minimum: line.merchandise.asProductVariant?.quantityRule.minimum
                            ),
                            productId: line.merchandise.asProductVariant?.product.id,
                            productTitle: line.merchandise.asProductVariant?.product.title,
                            productVendor: line.merchandise.asProductVariant?.product.vendor
                        ),
                    quantity: line.quantity,
                    lineCost: LineCost(
                        totalAmount: Price(
                            amount: line.cost.totalAmount.amount,
                            currencyCode: line.cost.totalAmount.currencyCode
                                .rawValue
                        ),
                        subtotalAmount: Price(
                            amount: line.cost.subtotalAmount.amount,
                            currencyCode: line.cost.subtotalAmount.currencyCode
                                .rawValue
                        ),
                        amountPerQuantity: Price(
                            amount: line.cost.amountPerQuantity.amount,
                            currencyCode: line.cost.amountPerQuantity
                                .currencyCode.rawValue
                        )
                    )
                )
            },
            cost: Cost(
                subtotalAmountEstimated: cartDTO.cost.subtotalAmountEstimated,
                totalAmountEstimated: cartDTO.cost.totalAmountEstimated,
                checkoutChargeAmount: Price(
                    amount: cartDTO.cost.checkoutChargeAmount.amount,
                    currencyCode: cartDTO.cost.checkoutChargeAmount.currencyCode
                        .rawValue
                ),
                totalAmount: Price(
                    amount: cartDTO.cost.totalAmount.amount,
                    currencyCode: cartDTO.cost.totalAmount.currencyCode.rawValue
                ),
                subtotalAmount: Price(
                    amount: cartDTO.cost.subtotalAmount.amount,
                    currencyCode: cartDTO.cost.subtotalAmount.currencyCode
                        .rawValue
                )
            ),
            createdAt: cartDTO.createdAt,
            updatedAt: cartDTO.updatedAt
        )
        return cart
    }
}
