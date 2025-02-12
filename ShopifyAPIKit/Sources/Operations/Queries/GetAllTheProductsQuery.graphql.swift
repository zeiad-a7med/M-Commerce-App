// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetAllTheProductsQuery: GraphQLQuery {
  public static let operationName: String = "GetAllTheProducts"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GetAllTheProducts($first: Int, $after: String) { products(first: $first, after: $after) { __typename nodes { __typename availableForSale description encodedVariantAvailability handle id isGiftCard productType tags title totalInventory trackingParameters updatedAt vendor category { __typename id name } encodedVariantExistence featuredImage { __typename altText height id originalSrc url width } images(first: 5) { __typename nodes { __typename altText height id originalSrc src url width } pageInfo { __typename endCursor hasNextPage hasPreviousPage startCursor } } priceRange { __typename minVariantPrice { __typename amount currencyCode } maxVariantPrice { __typename amount currencyCode } } } pageInfo { __typename endCursor hasNextPage hasPreviousPage startCursor } } }"#
    ))

  public var first: GraphQLNullable<Int>
  public var after: GraphQLNullable<String>

  public init(
    first: GraphQLNullable<Int>,
    after: GraphQLNullable<String>
  ) {
    self.first = first
    self.after = after
  }

  public var __variables: Variables? { [
    "first": first,
    "after": after
  ] }

  public struct Data: ShopifyAPIKit.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.QueryRoot }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("products", Products.self, arguments: [
        "first": .variable("first"),
        "after": .variable("after")
      ]),
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
        .field("nodes", [Node].self),
        .field("pageInfo", PageInfo.self),
      ] }

      /// A list of the nodes contained in ProductEdge.
      public var nodes: [Node] { __data["nodes"] }
      /// Information to aid in pagination.
      public var pageInfo: PageInfo { __data["pageInfo"] }

      /// Products.Node
      ///
      /// Parent Type: `Product`
      public struct Node: ShopifyAPIKit.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.Product }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("availableForSale", Bool.self),
          .field("description", String.self),
          .field("encodedVariantAvailability", String?.self),
          .field("handle", String.self),
          .field("id", ShopifyAPIKit.ID.self),
          .field("isGiftCard", Bool.self),
          .field("productType", String.self),
          .field("tags", [String].self),
          .field("title", String.self),
          .field("totalInventory", Int?.self),
          .field("trackingParameters", String?.self),
          .field("updatedAt", ShopifyAPIKit.DateTime.self),
          .field("vendor", String.self),
          .field("category", Category?.self),
          .field("encodedVariantExistence", String?.self),
          .field("featuredImage", FeaturedImage?.self),
          .field("images", Images.self, arguments: ["first": 5]),
          .field("priceRange", PriceRange.self),
        ] }

        /// Indicates if at least one product variant is available for sale.
        public var availableForSale: Bool { __data["availableForSale"] }
        /// A single-line description of the product, with [HTML tags](https://developer.mozilla.org/en-US/docs/Web/HTML) removed.
        public var description: String { __data["description"] }
        /// An encoded string containing all option value combinations
        /// with a corresponding variant that is currently available for sale.
        ///
        /// Integers represent option and values:
        /// [0,1] represents option_value at array index 0 for the option at array index 0
        ///
        /// `:`, `,`, ` ` and `-` are control characters.
        /// `:` indicates a new option. ex: 0:1 indicates value 0 for the option in position 1, value 1 for the option in position 2.
        /// `,` indicates the end of a repeated prefix, mulitple consecutive commas indicate the end of multiple repeated prefixes.
        /// ` ` indicates a gap in the sequence of option values. ex: 0 4 indicates option values in position 0 and 4 are present.
        /// `-` indicates a continuous range of option values. ex: 0 1-3 4
        ///
        /// Decoding process:
        ///
        /// Example options: [Size, Color, Material]
        /// Example values: [[Small, Medium, Large], [Red, Blue], [Cotton, Wool]]
        /// Example encoded string: "0:0:0,1:0-1,,1:0:0-1,1:1,,2:0:1,1:0,,"
        ///
        /// Step 1: Expand ranges into the numbers they represent: "0:0:0,1:0 1,,1:0:0 1,1:1,,2:0:1,1:0,,"
        /// Step 2: Expand repeated prefixes: "0:0:0,0:1:0 1,1:0:0 1,1:1:1,2:0:1,2:1:0,"
        /// Step 3: Expand shared prefixes so data is encoded as a string: "0:0:0,0:1:0,0:1:1,1:0:0,1:0:1,1:1:1,2:0:1,2:1:0,"
        /// Step 4: Map to options + option values to determine existing variants:
        ///
        /// [Small, Red, Cotton] (0:0:0), [Small, Blue, Cotton] (0:1:0), [Small, Blue, Wool] (0:1:1),
        /// [Medium, Red, Cotton] (1:0:0), [Medium, Red, Wool] (1:0:1), [Medium, Blue, Wool] (1:1:1),
        /// [Large, Red, Wool] (2:0:1), [Large, Blue, Cotton] (2:1:0).
        public var encodedVariantAvailability: String? { __data["encodedVariantAvailability"] }
        /// A unique, human-readable string of the product's title.
        /// A handle can contain letters, hyphens (`-`), and numbers, but no spaces.
        /// The handle is used in the online store URL for the product.
        public var handle: String { __data["handle"] }
        /// A globally-unique ID.
        public var id: ShopifyAPIKit.ID { __data["id"] }
        /// Whether the product is a gift card.
        public var isGiftCard: Bool { __data["isGiftCard"] }
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
        /// The name for the product that displays to customers. The title is used to construct the product's handle.
        /// For example, if a product is titled "Black Sunglasses", then the handle is `black-sunglasses`.
        public var title: String { __data["title"] }
        /// The quantity of inventory that's in stock.
        public var totalInventory: Int? { __data["totalInventory"] }
        /// URL parameters to be added to a page URL to track the origin of on-site search traffic for [analytics reporting](https://help.shopify.com/manual/reports-and-analytics/shopify-reports/report-types/default-reports/behaviour-reports). Returns a result when accessed through the [search](https://shopify.dev/docs/api/storefront/current/queries/search) or [predictiveSearch](https://shopify.dev/docs/api/storefront/current/queries/predictiveSearch) queries, otherwise returns null.
        public var trackingParameters: String? { __data["trackingParameters"] }
        /// The date and time when the product was last modified.
        /// A product's `updatedAt` value can change for different reasons. For example, if an order
        /// is placed for a product that has inventory tracking set up, then the inventory adjustment
        /// is counted as an update.
        public var updatedAt: ShopifyAPIKit.DateTime { __data["updatedAt"] }
        /// The name of the product's vendor.
        public var vendor: String { __data["vendor"] }
        /// The category of a product from [Shopify's Standard Product Taxonomy](https://shopify.github.io/product-taxonomy/releases/unstable/?categoryId=sg-4-17-2-17).
        public var category: Category? { __data["category"] }
        /// An encoded string containing all option value combinations with a corresponding variant.
        ///
        /// Integers represent option and values:
        /// [0,1] represents option_value at array index 0 for the option at array index 0
        ///
        /// `:`, `,`, ` ` and `-` are control characters.
        /// `:` indicates a new option. ex: 0:1 indicates value 0 for the option in position 1, value 1 for the option in position 2.
        /// `,` indicates the end of a repeated prefix, mulitple consecutive commas indicate the end of multiple repeated prefixes.
        /// ` ` indicates a gap in the sequence of option values. ex: 0 4 indicates option values in position 0 and 4 are present.
        /// `-` indicates a continuous range of option values. ex: 0 1-3 4
        ///
        /// Decoding process:
        ///
        /// Example options: [Size, Color, Material]
        /// Example values: [[Small, Medium, Large], [Red, Blue], [Cotton, Wool]]
        /// Example encoded string: "0:0:0,1:0-1,,1:0:0-1,1:1,,2:0:1,1:0,,"
        ///
        /// Step 1: Expand ranges into the numbers they represent: "0:0:0,1:0 1,,1:0:0 1,1:1,,2:0:1,1:0,,"
        /// Step 2: Expand repeated prefixes: "0:0:0,0:1:0 1,1:0:0 1,1:1:1,2:0:1,2:1:0,"
        /// Step 3: Expand shared prefixes so data is encoded as a string: "0:0:0,0:1:0,0:1:1,1:0:0,1:0:1,1:1:1,2:0:1,2:1:0,"
        /// Step 4: Map to options + option values to determine existing variants:
        ///
        /// [Small, Red, Cotton] (0:0:0), [Small, Blue, Cotton] (0:1:0), [Small, Blue, Wool] (0:1:1),
        /// [Medium, Red, Cotton] (1:0:0), [Medium, Red, Wool] (1:0:1), [Medium, Blue, Wool] (1:1:1),
        /// [Large, Red, Wool] (2:0:1), [Large, Blue, Cotton] (2:1:0).
        public var encodedVariantExistence: String? { __data["encodedVariantExistence"] }
        /// The featured image for the product.
        ///
        /// This field is functionally equivalent to `images(first: 1)`.
        public var featuredImage: FeaturedImage? { __data["featuredImage"] }
        /// List of images associated with the product.
        public var images: Images { __data["images"] }
        /// The minimum and maximum prices of a product, expressed in decimal numbers.
        /// For example, if the product is priced between $10.00 and $50.00,
        /// then the price range is $10.00 - $50.00.
        public var priceRange: PriceRange { __data["priceRange"] }

        /// Products.Node.Category
        ///
        /// Parent Type: `TaxonomyCategory`
        public struct Category: ShopifyAPIKit.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.TaxonomyCategory }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", ShopifyAPIKit.ID.self),
            .field("name", String.self),
          ] }

          /// A static identifier for the taxonomy category.
          public var id: ShopifyAPIKit.ID { __data["id"] }
          /// The localized name of the taxonomy category.
          public var name: String { __data["name"] }
        }

        /// Products.Node.FeaturedImage
        ///
        /// Parent Type: `Image`
        public struct FeaturedImage: ShopifyAPIKit.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.Image }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("altText", String?.self),
            .field("height", Int?.self),
            .field("id", ShopifyAPIKit.ID?.self),
            .field("originalSrc", ShopifyAPIKit.URL.self),
            .field("url", ShopifyAPIKit.URL.self),
            .field("width", Int?.self),
          ] }

          /// A word or phrase to share the nature or contents of an image.
          public var altText: String? { __data["altText"] }
          /// The original height of the image in pixels. Returns `null` if the image isn't hosted by Shopify.
          public var height: Int? { __data["height"] }
          /// A unique ID for the image.
          public var id: ShopifyAPIKit.ID? { __data["id"] }
          /// The location of the original image as a URL.
          ///
          /// If there are any existing transformations in the original source URL, they will remain and not be stripped.
          @available(*, deprecated, message: "Use `url` instead.")
          public var originalSrc: ShopifyAPIKit.URL { __data["originalSrc"] }
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

        /// Products.Node.Images
        ///
        /// Parent Type: `ImageConnection`
        public struct Images: ShopifyAPIKit.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.ImageConnection }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("nodes", [Node].self),
            .field("pageInfo", PageInfo.self),
          ] }

          /// A list of the nodes contained in ImageEdge.
          public var nodes: [Node] { __data["nodes"] }
          /// Information to aid in pagination.
          public var pageInfo: PageInfo { __data["pageInfo"] }

          /// Products.Node.Images.Node
          ///
          /// Parent Type: `Image`
          public struct Node: ShopifyAPIKit.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.Image }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("altText", String?.self),
              .field("height", Int?.self),
              .field("id", ShopifyAPIKit.ID?.self),
              .field("originalSrc", ShopifyAPIKit.URL.self),
              .field("src", ShopifyAPIKit.URL.self),
              .field("url", ShopifyAPIKit.URL.self),
              .field("width", Int?.self),
            ] }

            /// A word or phrase to share the nature or contents of an image.
            public var altText: String? { __data["altText"] }
            /// The original height of the image in pixels. Returns `null` if the image isn't hosted by Shopify.
            public var height: Int? { __data["height"] }
            /// A unique ID for the image.
            public var id: ShopifyAPIKit.ID? { __data["id"] }
            /// The location of the original image as a URL.
            ///
            /// If there are any existing transformations in the original source URL, they will remain and not be stripped.
            @available(*, deprecated, message: "Use `url` instead.")
            public var originalSrc: ShopifyAPIKit.URL { __data["originalSrc"] }
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

          /// Products.Node.Images.PageInfo
          ///
          /// Parent Type: `PageInfo`
          public struct PageInfo: ShopifyAPIKit.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.PageInfo }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("endCursor", String?.self),
              .field("hasNextPage", Bool.self),
              .field("hasPreviousPage", Bool.self),
              .field("startCursor", String?.self),
            ] }

            /// The cursor corresponding to the last node in edges.
            public var endCursor: String? { __data["endCursor"] }
            /// Whether there are more pages to fetch following the current page.
            public var hasNextPage: Bool { __data["hasNextPage"] }
            /// Whether there are any pages prior to the current page.
            public var hasPreviousPage: Bool { __data["hasPreviousPage"] }
            /// The cursor corresponding to the first node in edges.
            public var startCursor: String? { __data["startCursor"] }
          }
        }

        /// Products.Node.PriceRange
        ///
        /// Parent Type: `ProductPriceRange`
        public struct PriceRange: ShopifyAPIKit.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.ProductPriceRange }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("minVariantPrice", MinVariantPrice.self),
            .field("maxVariantPrice", MaxVariantPrice.self),
          ] }

          /// The lowest variant's price.
          public var minVariantPrice: MinVariantPrice { __data["minVariantPrice"] }
          /// The highest variant's price.
          public var maxVariantPrice: MaxVariantPrice { __data["maxVariantPrice"] }

          /// Products.Node.PriceRange.MinVariantPrice
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

          /// Products.Node.PriceRange.MaxVariantPrice
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
        }
      }

      /// Products.PageInfo
      ///
      /// Parent Type: `PageInfo`
      public struct PageInfo: ShopifyAPIKit.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.PageInfo }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("endCursor", String?.self),
          .field("hasNextPage", Bool.self),
          .field("hasPreviousPage", Bool.self),
          .field("startCursor", String?.self),
        ] }

        /// The cursor corresponding to the last node in edges.
        public var endCursor: String? { __data["endCursor"] }
        /// Whether there are more pages to fetch following the current page.
        public var hasNextPage: Bool { __data["hasNextPage"] }
        /// Whether there are any pages prior to the current page.
        public var hasPreviousPage: Bool { __data["hasPreviousPage"] }
        /// The cursor corresponding to the first node in edges.
        public var startCursor: String? { __data["startCursor"] }
      }
    }
  }
}
