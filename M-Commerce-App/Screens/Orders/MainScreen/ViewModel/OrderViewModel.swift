//
//  OrderViewModel.swift
//  M-Commerce-App
//
//  Created by Usef on 19/02/2025.
//

import Foundation
import ShopifyAPIKit
import SwiftUI

final class OrderViewModel: ObservableObject {
    @Published var orderModel: OrderModel = OrderModel()
    @Published var isLoading: Bool = true
    
    init(customerAccessTaken: String) {
        fetchOrders(customerAccessTaken: customerAccessTaken)
    }
    
    func fetchOrders(customerAccessTaken: String) {
        self.isLoading = true
        ApolloNetwokService.shared.apollo.fetch(
            query: GetOrdersFromCustomerATQuery(customerAT: customerAccessTaken)
        ) { [weak self] res in
            switch res {
            case .success(let result):
                if let customer = result.data?.customer {
                    
                    var orders: [Order] = []
                    
                    for orderNode in customer.orders.nodes {
                        
                        
                        let order = Order(
                            id: orderNode.id,
                            name: orderNode.name,
                            email: orderNode.email,
                            financialStatus: orderNode.financialStatus?.rawValue,
                            fulfillmentStatus: orderNode.fulfillmentStatus.rawValue,
                            orderNumber: orderNode.orderNumber,
                            processedAt: orderNode.processedAt,
                            currentSubtotalPrice: Price(amount: orderNode.currentSubtotalPrice.amount, currencyCode: orderNode.currentSubtotalPrice.currencyCode.rawValue),
                            currentTotalPrice: Price(amount: orderNode.currentTotalPrice.amount, currencyCode: orderNode.currentTotalPrice.currencyCode.rawValue)
                        )

                        orders.append(order)
                    }
                    
                    var addresses: [Address] = []
                    for addressNode in customer.addresses.nodes {
                        let address = Address(
                            id: addressNode.id,
                            address1: addressNode.address1,
                            name: addressNode.name,
                            phone: addressNode.phone,
                            city: addressNode.city,
                            country: addressNode.country,
                            countryCode: addressNode.countryCode,
                            firstName: addressNode.firstName,
                            lastName: addressNode.lastName,
                            latitude: addressNode.latitude,
                            longitude: addressNode.longitude
                        )
                        addresses.append(address)
                    }
                    
                    self?.orderModel.customer = Customer(
                        id: customer.id,
                        phone: customer.phone,
                        email: customer.email,
                        orders: OrderList(nodes: orders)
                        , displayName: customer.displayName,
                        addresses: addresses
                    )
                    
//                    print("Parsed Customer: \(self?.orderModel.customer ?? Customer())")
                }
                self?.isLoading = false
            case .failure(let error):
                print("Failure! Error: \(error.localizedDescription)")
                self?.isLoading = false
            }
        }
    }
}
