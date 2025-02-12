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
//    @Published var pageInfo: PageInfo?
    var countity:GraphQLNullable<Int> = 10
    
    
    
    init() {
        fetchBrands()
    }
    
    func fetchBrands() {
//        ApolloNetwokService.shared.apollo.fetch(query: GetCollectionsQuery(first: countity, after: nil)) { result in
//            switch result {
//                case .success(let graphQLResult):
//                if let collections = graphQLResult.data?.collections.nodes {
////                    self.brands.collections.append(contentsOf: collections)
//                }
//            self.brands.pageInfo = graphQLResult.data?.collections.pageInfo
//            self.isLoading = false
//                
//                
//                
//                self.isLoading = false
//            case .failure(let error):
//                print("Error fetching brands: \(error)")
//            }
//        }
    }
}





