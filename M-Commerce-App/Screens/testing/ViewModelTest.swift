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
    @Published var after: String?
    @Published var hasNextPage: Bool = true
    init() {
        fetch()
    }
    func fetch() {
        ApolloNetwokService.shared.apollo.fetch(
            query: GetCollectionsQuery(first: 10,after: nil)
        ) { result in
            switch result {
            case .success(let graphQLResult):
                graphQLResult.data?.collections.nodes.forEach { node in
                    self.items.append(node.title)
                }
                self.hasNextPage = graphQLResult.data?.collections.pageInfo.hasNextPage ?? false
                self.after = graphQLResult.data?.collections.pageInfo.endCursor
                self.isLoading = false
            case .failure(let error):
                print("Failure! Error: \(error.localizedDescription)")
            }
        }
    }
    func loadMore(){
        print("paginating...")
        ApolloNetwokService.shared.apollo.fetch(
            query: GetCollectionsQuery(first: 10,after: GraphQLNullable(stringLiteral: after ?? ""))
        ) { result in
            switch result {
            case .success(let graphQLResult):
                graphQLResult.data?.collections.nodes.forEach { node in
                    self.items.append(node.title)
                }
                self.hasNextPage = graphQLResult.data?.collections.pageInfo.hasNextPage ?? false
                self.after = graphQLResult.data?.collections.pageInfo.endCursor
                self.isLoading = false
            case .failure(let error):
                print("Failure! Error: \(error.localizedDescription)")
            }
        }
    }

}
