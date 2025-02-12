import Foundation
import ShopifyAPIKit
//
//  ViewModelTest.swift
//  M-Commerce-App
//
//  Created by Zeiad on 11/02/2025.
//
import SwiftUI

final class ViewModelTest: ObservableObject {
    @Published var items: [String] = []
    @Published var isLoading: Bool = true
    init() {
        fetch()
    }
    func fetch() {

        ApolloNetwokService.shared.apollo.fetch(
            query: GetAllProductsQuery(first: 20)
        ) { result in
            switch result {
            case .success(let graphQLResult):
                graphQLResult.data?.products.edges.forEach { edge in
                    print("title: \(edge.node.title)")
                    self.items.append(edge.node.title)
                }
                self.isLoading = false
            case .failure(let error):
                print("Failure! Error: \(error.localizedDescription)")
            }
        }
    }

}
