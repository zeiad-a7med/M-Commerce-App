// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetAllProductsQuery: GraphQLQuery {
  public static let operationName: String = "GetAllProducts"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GetAllProducts($first: Int) { products(first: $first) { __typename edges { __typename node { __typename title id images(first: 10) { __typename edges { __typename node { __typename id src url width } } } } cursor } } }"#
    ))

  public var first: GraphQLNullable<Int>

  public init(first: GraphQLNullable<Int>) {
    self.first = first
  }

  public var __variables: Variables? { ["first": first] }

  public struct Data: ShopifyAPIKit.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.QueryRoot }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("products", Products.self, arguments: ["first": .variable("first")]),
    ] }

    /// Returns a list of the shop's products. For storefront search, use the [`search`](https://shopify.dev/docs/api/storefront/latest/queries/search) query.
    public var products: Products { __data["products"] }

    /// Products
    ///
    /// Parent Type: `ProductConnection`
    public struct Products: ShopifyAPIKit.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.ProductConnection }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("edges", [Edge].self),
      ] }

      /// A list of edges.
      public var edges: [Edge] { __data["edges"] }

      /// Products.Edge
      ///
      /// Parent Type: `ProductEdge`
      public struct Edge: ShopifyAPIKit.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.ProductEdge }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("node", Node.self),
          .field("cursor", String.self),
        ] }

        /// The item at the end of ProductEdge.
        public var node: Node { __data["node"] }
        /// A cursor for use in pagination.
        public var cursor: String { __data["cursor"] }

        /// Products.Edge.Node
        ///
        /// Parent Type: `Product`
        public struct Node: ShopifyAPIKit.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.Product }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("title", String.self),
            .field("id", ShopifyAPIKit.ID.self),
            .field("images", Images.self, arguments: ["first": 10]),
          ] }

          /// The name for the product that displays to customers. The title is used to construct the product's handle.
          /// For example, if a product is titled "Black Sunglasses", then the handle is `black-sunglasses`.
          public var title: String { __data["title"] }
          /// A globally-unique ID.
          public var id: ShopifyAPIKit.ID { __data["id"] }
          /// List of images associated with the product.
          public var images: Images { __data["images"] }

          /// Products.Edge.Node.Images
          ///
          /// Parent Type: `ImageConnection`
          public struct Images: ShopifyAPIKit.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.ImageConnection }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("edges", [Edge].self),
            ] }

            /// A list of edges.
            public var edges: [Edge] { __data["edges"] }

            /// Products.Edge.Node.Images.Edge
            ///
            /// Parent Type: `ImageEdge`
            public struct Edge: ShopifyAPIKit.SelectionSet {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.ImageEdge }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("node", Node.self),
              ] }

              /// The item at the end of ImageEdge.
              public var node: Node { __data["node"] }

              /// Products.Edge.Node.Images.Edge.Node
              ///
              /// Parent Type: `Image`
              public struct Node: ShopifyAPIKit.SelectionSet {
                public let __data: DataDict
                public init(_dataDict: DataDict) { __data = _dataDict }

                public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.Image }
                public static var __selections: [ApolloAPI.Selection] { [
                  .field("__typename", String.self),
                  .field("id", ShopifyAPIKit.ID?.self),
                  .field("src", ShopifyAPIKit.URL.self),
                  .field("url", ShopifyAPIKit.URL.self),
                  .field("width", Int?.self),
                ] }

                /// A unique ID for the image.
                public var id: ShopifyAPIKit.ID? { __data["id"] }
                /// The location of the image as a URL.
                @available(*, deprecated, message: "Use `url` instead.")
                public var src: ShopifyAPIKit.URL { __data["src"] }
                /// The location of the image as a URL.
                ///
                /// If no transform options are specified, then the original image will be preserved including any pre-applied transforms.
                ///
                /// All transformation options are considered "best-effort". Any transformation that the original image type doesn't support will be ignored.
                ///
                /// If you need multiple variations of the same image, then you can use [GraphQL aliases](https://graphql.org/learn/queries/#aliases).
                public var url: ShopifyAPIKit.URL { __data["url"] }
                /// The original width of the image in pixels. Returns `null` if the image isn't hosted by Shopify.
                public var width: Int? { __data["width"] }
              }
            }
          }
        }
      }
    }
  }
}
