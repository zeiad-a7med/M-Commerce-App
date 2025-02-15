// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetProductsTypesQuery: GraphQLQuery {
  public static let operationName: String = "GetProductsTypes"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GetProductsTypes($first: Int!) { productTypes(first: $first) { __typename nodes } }"#
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
      .field("productTypes", ProductTypes.self, arguments: ["first": .variable("first")]),
    ] }

    /// List of product types for the shop's products that are published to your app.
    public var productTypes: ProductTypes { __data["productTypes"] }

    /// ProductTypes
    ///
    /// Parent Type: `StringConnection`
    public struct ProductTypes: ShopifyAPIKit.SelectionSet {
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
