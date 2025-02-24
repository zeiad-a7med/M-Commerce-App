// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class SearchProductQuery: GraphQLQuery {
  public static let operationName: String = "SearchProduct"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query SearchProduct($filter: String!) { search(query: $filter, first: 50) { __typename nodes { __typename ... on Product { description id productType title totalInventory vendor featuredImage { __typename url } priceRange { __typename maxVariantPrice { __typename amount currencyCode } minVariantPrice { __typename amount currencyCode } } } } } }"#
    ))

  public var filter: String

  public init(filter: String) {
    self.filter = filter
  }

  public var __variables: Variables? { ["filter": filter] }

  public struct Data: ShopifyAPIKit.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.QueryRoot }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("search", Search.self, arguments: [
        "query": .variable("filter"),
        "first": 50
      ]),
    ] }

    /// List of the search results.
    public var search: Search { __data["search"] }

    /// Search
    ///
    /// Parent Type: `SearchResultItemConnection`
    public struct Search: ShopifyAPIKit.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.SearchResultItemConnection }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("nodes", [Node].self),
      ] }

      /// A list of the nodes contained in SearchResultItemEdge.
      public var nodes: [Node] { __data["nodes"] }

      /// Search.Node
      ///
      /// Parent Type: `SearchResultItem`
      public struct Node: ShopifyAPIKit.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Unions.SearchResultItem }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .inlineFragment(AsProduct.self),
        ] }

        public var asProduct: AsProduct? { _asInlineFragment() }

        /// Search.Node.AsProduct
        ///
        /// Parent Type: `Product`
        public struct AsProduct: ShopifyAPIKit.InlineFragment {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public typealias RootEntityType = SearchProductQuery.Data.Search.Node
          public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.Product }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("description", String.self),
            .field("id", ShopifyAPIKit.ID.self),
            .field("productType", String.self),
            .field("title", String.self),
            .field("totalInventory", Int?.self),
            .field("vendor", String.self),
            .field("featuredImage", FeaturedImage?.self),
            .field("priceRange", PriceRange.self),
          ] }

          /// A single-line description of the product, with [HTML tags](https://developer.mozilla.org/en-US/docs/Web/HTML) removed.
          public var description: String { __data["description"] }
          /// A globally-unique ID.
          public var id: ShopifyAPIKit.ID { __data["id"] }
          /// The [product type](https://help.shopify.com/manual/products/details/product-type)
          /// that merchants define.
          public var productType: String { __data["productType"] }
          /// The name for the product that displays to customers. The title is used to construct the product's handle.
          /// For example, if a product is titled "Black Sunglasses", then the handle is `black-sunglasses`.
          public var title: String { __data["title"] }
          /// The quantity of inventory that's in stock.
          public var totalInventory: Int? { __data["totalInventory"] }
          /// The name of the product's vendor.
          public var vendor: String { __data["vendor"] }
          /// The featured image for the product.
          ///
          /// This field is functionally equivalent to `images(first: 1)`.
          public var featuredImage: FeaturedImage? { __data["featuredImage"] }
          /// The minimum and maximum prices of a product, expressed in decimal numbers.
          /// For example, if the product is priced between $10.00 and $50.00,
          /// then the price range is $10.00 - $50.00.
          public var priceRange: PriceRange { __data["priceRange"] }

          /// Search.Node.AsProduct.FeaturedImage
          ///
          /// Parent Type: `Image`
          public struct FeaturedImage: ShopifyAPIKit.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.Image }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("url", ShopifyAPIKit.URL.self),
            ] }

            /// The location of the image as a URL.
            ///
            /// If no transform options are specified, then the original image will be preserved including any pre-applied transforms.
            ///
            /// All transformation options are considered "best-effort". Any transformation that the original image type doesn't support will be ignored.
            ///
            /// If you need multiple variations of the same image, then you can use [GraphQL aliases](https://graphql.org/learn/queries/#aliases).
            public var url: ShopifyAPIKit.URL { __data["url"] }
          }

          /// Search.Node.AsProduct.PriceRange
          ///
          /// Parent Type: `ProductPriceRange`
          public struct PriceRange: ShopifyAPIKit.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.ProductPriceRange }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("maxVariantPrice", MaxVariantPrice.self),
              .field("minVariantPrice", MinVariantPrice.self),
            ] }

            /// The highest variant's price.
            public var maxVariantPrice: MaxVariantPrice { __data["maxVariantPrice"] }
            /// The lowest variant's price.
            public var minVariantPrice: MinVariantPrice { __data["minVariantPrice"] }

            /// Search.Node.AsProduct.PriceRange.MaxVariantPrice
            ///
            /// Parent Type: `MoneyV2`
            public struct MaxVariantPrice: ShopifyAPIKit.SelectionSet {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.MoneyV2 }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("amount", ShopifyAPIKit.Decimal.self),
                .field("currencyCode", GraphQLEnum<ShopifyAPIKit.CurrencyCode>.self),
              ] }

              /// Decimal money amount.
              public var amount: ShopifyAPIKit.Decimal { __data["amount"] }
              /// Currency of the money.
              public var currencyCode: GraphQLEnum<ShopifyAPIKit.CurrencyCode> { __data["currencyCode"] }
            }

            /// Search.Node.AsProduct.PriceRange.MinVariantPrice
            ///
            /// Parent Type: `MoneyV2`
            public struct MinVariantPrice: ShopifyAPIKit.SelectionSet {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.MoneyV2 }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("amount", ShopifyAPIKit.Decimal.self),
                .field("currencyCode", GraphQLEnum<ShopifyAPIKit.CurrencyCode>.self),
              ] }

              /// Decimal money amount.
              public var amount: ShopifyAPIKit.Decimal { __data["amount"] }
              /// Currency of the money.
              public var currencyCode: GraphQLEnum<ShopifyAPIKit.CurrencyCode> { __data["currencyCode"] }
            }
          }
        }
      }
    }
  }
}
