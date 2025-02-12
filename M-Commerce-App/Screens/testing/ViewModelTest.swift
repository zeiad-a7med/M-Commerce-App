//
//  ViewModelTest.swift
//  M-Commerce-App
//
//  Created by Zeiad on 11/02/2025.
//
import SwiftUI
import Foundation
import ShopifyAPIKit
final class ViewModelTest: ObservableObject {
    init() {
            fetch()
    }
    func fetch() {
        
        
        ApolloNetwokService.shared.apollo.fetch(query: GetAllProductsQuery(first: 20)) { result in
          switch result {
          case .success(let graphQLResult):
              graphQLResult.data?.products.edges.forEach { edge in
                  print("title: \(edge.node.title)")
                  print("title: \(edge.node.id)")
                  
              }
          case .failure(let error):
              print("Failure! Error: \(error.localizedDescription)")
          }
        }
    }

}
