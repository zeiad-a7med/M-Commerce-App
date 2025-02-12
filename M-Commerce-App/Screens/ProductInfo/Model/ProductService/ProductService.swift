//
//  WeatherService.swift
//  WeatherCast
//
//  Created by Zeiad on 11/02/2025.
//

import Foundation
import ShopifyAPIKit
protocol ProductServiceProtocol {
    static func getProductFromApi(
        complitionHandler: @escaping (ProductResponse?) -> Void)
}

class ProductService: ProductServiceProtocol {
    static func getProductFromApi(
        complitionHandler: @escaping (ProductResponse?) -> Void
    ) {
//        guard
//            let url = URL(
//                string:
//                    ApiEndpoint.baseUrl
//            )
//        else {
//            print("Invalid URL")
//            return
//        }
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            if let error = error {
//                print("Error fetching data: \(error.localizedDescription)")
//                return
//            }
//            guard let data = data else {
//                print("No data received")
//                return
//            }
//            do {
//                let forcastResponse = try JSONDecoder().decode(
//                    ForcastResponse.self, from: data)
//                complitionHandler(forcastResponse)
//            } catch {
//                print("Error decoding JSON: \(error.localizedDescription)")
//            }
//        }.resume()
//        
        
        ApolloNetwokService.shared.apollo.fetch(
            query: GetCollectionsQuery(first: 10, after: nil)
        ) { result in
            switch result {
            case .success(let graphQLResult):
                graphQLResult.data?.collections.nodes.forEach { node in
//                    self.items.append(node.title)
                }
                
                let updatedPageInfo = PageInfo(
                    startCursor : graphQLResult.data?.collections.pageInfo.startCursor,
                    endCursor : graphQLResult.data?.collections.pageInfo.endCursor,
                    hasNextPage : graphQLResult.data?.collections.pageInfo.hasNextPage ?? false,
                    hasPreviousPage : graphQLResult.data?.collections.pageInfo.hasPreviousPage ?? false
                )
//                self.pageInfo = updatedPageInfo
                
//                self.isLoading = false
            case .failure(let error):
                print("Failure! Error: \(error.localizedDescription)")
            }
        }
    }
}
