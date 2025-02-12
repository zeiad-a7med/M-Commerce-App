// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetCollectionQuery: GraphQLQuery {
  public static let operationName: String = "GetCollection"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GetCollection($id: ID, $first: Int) { collection(id: $id) { __typename id description handle title image { __typename id height width url originalSrc } products(first: $first) { __typename nodes { __typename id availableForSale title productType tags vendor images(first: 1) { __typename nodes { __typename id height width url originalSrc } } priceRange { __typename maxVariantPrice { __typename amount currencyCode } minVariantPrice { __typename amount currencyCode } } } filters { __typename id label type values { __typename count id label input } } } } }"#
    ))

  public var id: GraphQLNullable<ID>
  public var first: GraphQLNullable<Int>

  public init(
    id: GraphQLNullable<ID>,
    first: GraphQLNullable<Int>
  ) {
    self.id = id
    self.first = first
  }

  public var __variables: Variables? { [
    "id": id,
    "first": first
  ] }

  public struct Data: ShopifyAPIKit.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.QueryRoot }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("collection", Collection?.self, arguments: ["id": .variable("id")]),
    ] }

    /// Fetch a specific `Collection` by one of its unique attributes.
    public var collection: Collection? { __data["collection"] }

    /// Collection
    ///
    /// Parent Type: `Collection`
    public struct Collection: ShopifyAPIKit.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.Collection }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("id", ShopifyAPIKit.ID.self),
        .field("description", String.self),
        .field("handle", String.self),
        .field("title", String.self),
        .field("image", Image?.self),
        .field("products", Products.self, arguments: ["first": .variable("first")]),
      ] }

      /// A globally-unique ID.
      public var id: ShopifyAPIKit.ID { __data["id"] }
      /// Stripped description of the collection, single line with HTML tags removed.
      public var description: String { __data["description"] }
      /// A human-friendly unique string for the collection automatically generated from its title.
      /// Limit of 255 characters.
      public var handle: String { __data["handle"] }
      /// The collection’s name. Limit of 255 characters.
      public var title: String { __data["title"] }
      /// Image associated with the collection.
      public var image: Image? { __data["image"] }
      /// List of products in the collection.
      public var products: Products { __data["products"] }

      /// Collection.Image
      ///
      /// Parent Type: `Image`
      public struct Image: ShopifyAPIKit.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.Image }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", ShopifyAPIKit.ID?.self),
          .field("height", Int?.self),
          .field("width", Int?.self),
          .field("url", ShopifyAPIKit.URL.self),
          .field("originalSrc", ShopifyAPIKit.URL.self),
        ] }

        /// A unique ID for the image.
        public var id: ShopifyAPIKit.ID? { __data["id"] }
        /// The original height of the image in pixels. Returns `null` if the image isn't hosted by Shopify.
        public var height: Int? { __data["height"] }
        /// The original width of the image in pixels. Returns `null` if the image isn't hosted by Shopify.
        public var width: Int? { __data["width"] }
        /// The location of the image as a URL.
        ///
        /// If no transform options are specified, then the original image will be preserved including any pre-applied transforms.
        ///
        /// All transformation options are considered "best-effort". Any transformation that the original image type doesn't support will be ignored.
        ///
        /// If you need multiple variations of the same image, then you can use [GraphQL aliases](https://graphql.org/learn/queries/#aliases).
        public var url: ShopifyAPIKit.URL { __data["url"] }
        /// The location of the original image as a URL.
        ///
        /// If there are any existing transformations in the original source URL, they will remain and not be stripped.
        @available(*, deprecated, message: "Use `url` instead.")
        public var originalSrc: ShopifyAPIKit.URL { __data["originalSrc"] }
      }

      /// Collection.Products
      ///
      /// Parent Type: `ProductConnection`
      public struct Products: ShopifyAPIKit.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.ProductConnection }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("nodes", [Node].self),
          .field("filters", [Filter].self),
        ] }

        /// A list of the nodes contained in ProductEdge.
        public var nodes: [Node] { __data["nodes"] }
        /// A list of available filters.
        public var filters: [Filter] { __data["filters"] }

        /// Collection.Products.Node
        ///
        /// Parent Type: `Product`
        public struct Node: ShopifyAPIKit.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.Product }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", ShopifyAPIKit.ID.self),
            .field("availableForSale", Bool.self),
            .field("title", String.self),
            .field("productType", String.self),
            .field("tags", [String].self),
            .field("vendor", String.self),
            .field("images", Images.self, arguments: ["first": 1]),
            .field("priceRange", PriceRange.self),
          ] }

          /// A globally-unique ID.
          public var id: ShopifyAPIKit.ID { __data["id"] }
          /// Indicates if at least one product variant is available for sale.
          public var availableForSale: Bool { __data["availableForSale"] }
          /// The name for the product that displays to customers. The title is used to construct the product's handle.
          /// For example, if a product is titled "Black Sunglasses", then the handle is `black-sunglasses`.
          public var title: String { __data["title"] }
          /// The [product type](https://help.shopify.com/manual/products/details/product-type)
          /// that merchants define.
          public var productType: String { __data["productType"] }
          /// A comma-separated list of searchable keywords that are
          /// associated with the product. For example, a merchant might apply the `sports`
          /// and `summer` tags to products that are associated with sportwear for summer.
          /// Updating `tags` overwrites any existing tags that were previously added to the product.
          /// To add new tags without overwriting existing tags,
          /// use the GraphQL Admin API's [`tagsAdd`](/docs/api/admin-graphql/latest/mutations/tagsadd)
          /// mutation.
          public var tags: [String] { __data["tags"] }
          /// The name of the product's vendor.
          public var vendor: String { __data["vendor"] }
          /// List of images associated with the product.
          public var images: Images { __data["images"] }
          /// The minimum and maximum prices of a product, expressed in decimal numbers.
          /// For example, if the product is priced between $10.00 and $50.00,
          /// then the price range is $10.00 - $50.00.
          public var priceRange: PriceRange { __data["priceRange"] }

          /// Collection.Products.Node.Images
          ///
          /// Parent Type: `ImageConnection`
          public struct Images: ShopifyAPIKit.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.ImageConnection }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("nodes", [Node].self),
            ] }

            /// A list of the nodes contained in ImageEdge.
            public var nodes: [Node] { __data["nodes"] }

            /// Collection.Products.Node.Images.Node
            ///
            /// Parent Type: `Image`
            public struct Node: ShopifyAPIKit.SelectionSet {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.Image }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("id", ShopifyAPIKit.ID?.self),
                .field("height", Int?.self),
                .field("width", Int?.self),
                .field("url", ShopifyAPIKit.URL.self),
                .field("originalSrc", ShopifyAPIKit.URL.self),
              ] }

              /// A unique ID for the image.
              public var id: ShopifyAPIKit.ID? { __data["id"] }
              /// The original height of the image in pixels. Returns `null` if the image isn't hosted by Shopify.
              public var height: Int? { __data["height"] }
              /// The original width of the image in pixels. Returns `null` if the image isn't hosted by Shopify.
              public var width: Int? { __data["width"] }
              /// The location of the image as a URL.
              ///
              /// If no transform options are specified, then the original image will be preserved including any pre-applied transforms.
              ///
              /// All transformation options are considered "best-effort". Any transformation that the original image type doesn't support will be ignored.
              ///
              /// If you need multiple variations of the same image, then you can use [GraphQL aliases](https://graphql.org/learn/queries/#aliases).
              public var url: ShopifyAPIKit.URL { __data["url"] }
              /// The location of the original image as a URL.
              ///
              /// If there are any existing transformations in the original source URL, they will remain and not be stripped.
              @available(*, deprecated, message: "Use `url` instead.")
              public var originalSrc: ShopifyAPIKit.URL { __data["originalSrc"] }
            }
          }

          /// Collection.Products.Node.PriceRange
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

            /// Collection.Products.Node.PriceRange.MaxVariantPrice
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

            /// Collection.Products.Node.PriceRange.MinVariantPrice
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

        /// Collection.Products.Filter
        ///
        /// Parent Type: `Filter`
        public struct Filter: ShopifyAPIKit.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.Filter }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", String.self),
            .field("label", String.self),
            .field("type", GraphQLEnum<ShopifyAPIKit.FilterType>.self),
            .field("values", [Value].self),
          ] }

          /// A unique identifier.
          public var id: String { __data["id"] }
          /// A human-friendly string for this filter.
          public var label: String { __data["label"] }
          /// An enumeration that denotes the type of data this filter represents.
          public var type: GraphQLEnum<ShopifyAPIKit.FilterType> { __data["type"] }
          /// The list of values for this filter.
          public var values: [Value] { __data["values"] }

          /// Collection.Products.Filter.Value
          ///
          /// Parent Type: `FilterValue`
          public struct Value: ShopifyAPIKit.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.FilterValue }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("count", Int.self),
              .field("id", String.self),
              .field("label", String.self),
              .field("input", ShopifyAPIKit.JSON.self),
            ] }

            /// The number of results that match this filter value.
            public var count: Int { __data["count"] }
            /// A unique identifier.
            public var id: String { __data["id"] }
            /// A human-friendly string for this filter value.
            public var label: String { __data["label"] }
            /// An input object that can be used to filter by this value on the parent field.
            ///
            /// The value is provided as a helper for building dynamic filtering UI. For
            /// example, if you have a list of selected `FilterValue` objects, you can combine
            /// their respective `input` values to use in a subsequent query.
            public var input: ShopifyAPIKit.JSON { __data["input"] }
          }
        }
      }
    }
  }
}
