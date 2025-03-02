//
//  BrandsViewModel.swift
//  M-Commerce-App
//
//  Created by Usef on 12/02/2025.
//

import Foundation
import ShopifyAPIKit
import SwiftUI

final class BrandsViewModel: ObservableObject {

    @Published var brands: BrandsResponse = BrandsResponse()
    @Published var isLoading: Bool = true
    var countity: GraphQLNullable<Int> = 20

    init(first: GraphQLNullable<Int>, after: GraphQLNullable<String>) {
        fetchBrands(first: first, after: after)
    }

    func fetchBrands(first: GraphQLNullable<Int>, after: GraphQLNullable<String>) {
        self.brands.collections = [Collection]()
        self.isLoading = true
        BrandsService.fetchBransFromApi(first: 10, after: nil ,complition: { res in
            guard let res = res else { return }
            
            res.collections?.forEach { collection in
                self.brands.collections?.append(collection)
            }
            self.brands.pageInfo = res.pageInfo
            self.brands.collectionCount = res.collectionCount
            self.brands.message = res.message
            self.brands.success = res.success
            
            self.isLoading = false
        })
//        ApolloNetwokService.shared.apollo.fetch(
//            query: GetCollectionsQuery(first: countity, after: nil)
//        ) { result in
//            switch result {
//            case .success(let graphQLResult):
//                self.brands.collectionCount =
//                    graphQLResult.data?.collections.totalCount
//                graphQLResult.data?.collections.nodes.forEach { node in
//                    if self.isValid(title: node.title) {
//                        self.brands.collections?.append(
//                            Collection(
//                                description: node.description,
//                                handle: node.handle,
//                                id: node.id,
//                                title: node.title,
//                                trackingParameters: node.trackingParameters,
//                                updatedAt: node.updatedAt,
//                                img: ImgModel(
//                                    height: node.image?.height ?? 0,
//                                    url: node.image?.url ?? "",
//                                    width: node.image?.width ?? 0,
//                                    id: node.image?.id ?? "")
//                            ))
//                    }
//                }

//                let updatedPageInfo = PageInfo(
//                    startCursor: graphQLResult.data?.collections.pageInfo
//                        .startCursor,
//                    endCursor: graphQLResult.data?.collections.pageInfo
//                        .endCursor,
//                    hasNextPage: graphQLResult.data?.collections.pageInfo
//                        .hasNextPage ?? false,
//                    hasPreviousPage: graphQLResult.data?.collections.pageInfo
//                        .hasPreviousPage ?? false
//                )
//                self.brands.pageInfo = updatedPageInfo

//                self.isLoading = false
//            case .failure(let error):
//                print("Failure! Error: \(error.localizedDescription)")
//            }
//        }
    }
    func loadMore() {
        if self.brands.pageInfo?.hasNextPage == false { return }
        self.isLoading = true
        BrandsService.fetchBransFromApi(first: 10, after: self.brands.pageInfo?.endCursor ?? "" ,complition: { res in
            guard let res = res else { return }
            
            res.collections?.forEach { collection in
                self.brands.collections?.append(collection)
            }
            self.brands.pageInfo = res.pageInfo
            self.brands.collectionCount = res.collectionCount
            self.brands.message = res.message
            self.brands.success = res.success
            print("Load more...Brands")
            self.isLoading = false
        })
        
        
    }

    func isValid(title: String) -> Bool {
        return (title.lowercased() != "men".lowercased())
            && (title.lowercased() != "women".lowercased())
            && (title.lowercased() != "kid".lowercased())
            && (title.lowercased() != "sale".lowercased())
            && (title.lowercased() != "home page".lowercased())
    }
}
