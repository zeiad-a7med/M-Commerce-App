//
//  DetailsViewModel.swift
//  M-Commerce-App
//
//  Created by Usef on 20/02/2025.
//

import Foundation
import ShopifyAPIKit
import SwiftUI

final class DetailsViewModel: ObservableObject {
    @Published var detailsModel: DetailsModel = DetailsModel()
    @Published var isLoading: Bool = true
    
    init(customerAccessTaken: String) {
        fetchProductsOfOrder(customerAccessTaken: customerAccessTaken)
    }
    
    func fetchProductsOfOrder(customerAccessTaken: String) {
        self.isLoading = true
        ApolloNetwokService.shared.apollo.fetch(
            query: GetProductsOfOrderByIDQuery(customerAT: customerAccessTaken)
        ) { [weak self] res in
            switch res {
            case .success(let result):
                if let customer = result.data?.customer {
                    print("Customer Data: \(customer)")
                    
                    var orders: [Order] = []
                    
                    for orderNode in customer.orders.nodes {
                        print("Order Node: \(orderNode)")
                        
                        var lineItems: [LineItem] = []
                        
                        for item in orderNode.lineItems.nodes {
                            print("Line Item: \(item)")
                            
                            let variant = OrderProductVariant(
                                id: item.variant?.id,
                                title: item.variant?.title,
                                currentlyNotInStock: item.variant?.currentlyNotInStock,
                                image: ImgModel(
                                    url: item.variant?.image?.url,
                                    id: item.variant?.image?.id
                                ),
                                product: OrderedProduct(id: item.variant?.product.id, productType: item.variant?.product.productType,
                                    title: item.variant?.product.title,
                                    totalInventory: item.variant?.product.totalInventory,
                                    vendor: item.variant?.product.vendor)
                            )
                            let lineItem = LineItem(
                                title: item.title,
                                quantity: item.quantity,
                                currentQuantity: item.currentQuantity,
                                variant: variant,
                                price: Price(amount: item.variant?.price.amount, currencyCode: item.variant?.price.currencyCode.rawValue),
                                product: OrderedProduct(id: item.variant?.product.id,
                                productType: item.variant?.product.productType,
                                title: item.variant?.product.title,
                                totalInventory: item.variant?.product.totalInventory,
                                vendor: item.variant?.product.vendor)
                            )
                            lineItems.append(lineItem)
                        }
                        
                        let order = Order(
                            lineItems: LineItemList(nodes: lineItems),
                            currentSubtotalPrice: Price(
                                amount: orderNode.currentSubtotalPrice.amount,
                                currencyCode: orderNode.currentSubtotalPrice.currencyCode.rawValue
                            ),
                            currentTotalPrice: Price(
                                amount: orderNode.currentTotalPrice.amount,
                                currencyCode: orderNode.currentTotalPrice.currencyCode.rawValue
                            )
                        )
                        orders.append(order)
                    }
                    
                    self?.detailsModel.customer = Customer(
                        id: customer.id, 
                        orders: OrderList(nodes: orders),
                        displayName: customer.displayName,
                        numberOfOrders: customer.numberOfOrders
                    )
                    
                }
                self?.isLoading = false
            case .failure(let error):
                print("Failure! Error: \(error.localizedDescription)")
                self?.isLoading = false
            }
        }
    }
}
