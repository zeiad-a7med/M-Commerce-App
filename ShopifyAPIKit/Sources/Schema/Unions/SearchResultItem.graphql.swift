// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension Unions {
  /// A search result that matches the search query.
  static let SearchResultItem = Union(
    name: "SearchResultItem",
    possibleTypes: [
      Objects.Article.self,
      Objects.Page.self,
      Objects.Product.self
    ]
  )
}