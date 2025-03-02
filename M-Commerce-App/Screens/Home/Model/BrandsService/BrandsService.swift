//
//  BrandsService.swift
//  M-Commerce-App
//
//  Created by Usef on 28/02/2025.
//

import Foundation
import ShopifyAPIKit

protocol BrandsServiceProtocol {
    static func fetchBransFromApi(first: GraphQLNullable<Int>,after: GraphQLNullable<String>,complition: @escaping(BrandsResponse?)->Void )
}

class BrandsService: BrandsServiceProtocol {
    static func fetchBransFromApi(first: GraphQLNullable<Int>,after: GraphQLNullable<String>,complition: @escaping (BrandsResponse?) -> Void) {
        ApolloNetwokService.shared.apollo.fetch(query: GetCollectionsQuery(first: 10, after: nil)) { result in
            switch result {
            case.success(let graphQLResult):
                var collectionsArr = [Collection]()
                graphQLResult.data?.collections.nodes.forEach { node in
                    if isValid(title: node.title) {
                        collectionsArr.append(
                            Collection(
                                description: node.description,
                                handle: node.handle,
                                id: node.id,
                                title: node.title,
                                trackingParameters: node.trackingParameters,
                                updatedAt: node.updatedAt,
                                img: ImgModel(
                                    height: node.image?.height ?? 0,
                                    url: node.image?.url ?? "",
                                    width: node.image?.width ?? 0,
                                    id: node.image?.id ?? "")
                            ))
                    }
                }
                complition(BrandsResponse(collectionCount: graphQLResult.data?.collections.totalCount ?? "0",collections: collectionsArr ,pageInfo: PageInfo(startCursor: graphQLResult.data?.collections.pageInfo.startCursor, endCursor: graphQLResult.data?.collections.pageInfo.endCursor, hasNextPage: graphQLResult.data?.collections.pageInfo.hasNextPage ?? false, hasPreviousPage: graphQLResult.data?.collections.pageInfo.hasPreviousPage ?? false),message: "",success: true))
            case .failure(let error):
                complition(BrandsResponse(message: error.localizedDescription,success: false))
            }
            
        }
    }
    
    private static func isValid(title: String) -> Bool {
        return (title.lowercased() != "men".lowercased())
            && (title.lowercased() != "women".lowercased())
            && (title.lowercased() != "kid".lowercased())
            && (title.lowercased() != "sale".lowercased())
            && (title.lowercased() != "home page".lowercased())
    }
}
