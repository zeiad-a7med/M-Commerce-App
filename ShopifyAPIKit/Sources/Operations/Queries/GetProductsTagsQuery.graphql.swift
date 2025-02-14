// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetProductsTagsQuery: GraphQLQuery {
  public static let operationName: String = "GetProductsTags"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GetProductsTags($first: Int!) { productTags(first: $first) { __typename nodes } }"#
    ))

  public var first: Int

  public init(first: Int) {
    self.first = first
  }

  public var __variables: Variables? { ["first": first] }

  public struct Data: ShopifyAPIKit.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.QueryRoot }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("productTags", ProductTags.self, arguments: ["first": .variable("first")]),
    ] }

    /// Tags added to products.
    /// Additional access scope required: unauthenticated_read_product_tags.
    public var productTags: ProductTags { __data["productTags"] }

    /// ProductTags
    ///
    /// Parent Type: `StringConnection`
    public struct ProductTags: ShopifyAPIKit.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.StringConnection }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("nodes", [String].self),
      ] }

      /// A list of the nodes contained in StringEdge.
      public var nodes: [String] { __data["nodes"] }
    }
  }
}
