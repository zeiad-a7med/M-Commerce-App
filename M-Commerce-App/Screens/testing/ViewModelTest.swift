//
//  ViewModelTest.swift
//  M-Commerce-App
//
//  Created by Zeiad on 11/02/2025.
//
import Foundation
import ShopifyAPIKit
import SwiftUI
final class ViewModelTest: ObservableObject {
    @Published var items: [String] = []
    @Published var isLoading: Bool = true
    @Published var pageInfo: PageInfo?
    
    init() {
        fetch()
    }
    func fetch() {
        ApolloNetwokService.shared.apollo.fetch(
            query: GetCollectionsQuery(first: 10, after: nil)
        ) { result in
            switch result {
            case .success(let graphQLResult):
                graphQLResult.data?.collections.nodes.forEach { node in
                    self.items.append(node.title)
                }
                
                let updatedPageInfo = PageInfo(
                    startCursor : graphQLResult.data?.collections.pageInfo.startCursor,
                    endCursor : graphQLResult.data?.collections.pageInfo.endCursor,
                    hasNextPage : graphQLResult.data?.collections.pageInfo.hasNextPage ?? false,
                    hasPreviousPage : graphQLResult.data?.collections.pageInfo.hasPreviousPage ?? false
                )
                self.pageInfo = updatedPageInfo
                
                self.isLoading = false
            case .failure(let error):
                print("Failure! Error: \(error.localizedDescription)")
            }
        }
    }
    func loadMore() {
        if (pageInfo?.hasNextPage == false) { return }
        ApolloNetwokService.shared.apollo.fetch(
            query: GetCollectionsQuery(
                first: 10, after: GraphQLNullable(stringLiteral: pageInfo?.endCursor ?? ""))
        ) { result in
            switch result {
            case .success(let graphQLResult):
                graphQLResult.data?.collections.nodes.forEach { node in
                    self.items.append(node.title)
                }
                
                let updatedPageInfo = PageInfo(
                    startCursor : graphQLResult.data?.collections.pageInfo.startCursor,
                    endCursor : graphQLResult.data?.collections.pageInfo.endCursor,
                    hasNextPage : graphQLResult.data?.collections.pageInfo.hasNextPage ?? false,
                    hasPreviousPage : graphQLResult.data?.collections.pageInfo.hasPreviousPage ?? false
                )
                self.pageInfo = updatedPageInfo
                
                self.isLoading = false
            case .failure(let error):
                print("Failure! Error: \(error.localizedDescription)")
            }
        }
    }

}
