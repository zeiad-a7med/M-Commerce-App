// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetProductQuery: GraphQLQuery {
  public static let operationName: String = "GetProduct"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GetProduct($id: ID!) { product(id: $id) { __typename id title availableForSale description encodedVariantAvailability encodedVariantExistence handle isGiftCard productType tags totalInventory vendor updatedAt images(first: 10) { __typename nodes { __typename id url originalSrc altText width height } } featuredImage { __typename id url originalSrc altText width height } adjacentVariants { __typename availableForSale barcode currentlyNotInStock id quantityAvailable requiresComponents requiresShipping sku taxable title weight } category { __typename id name } priceRange { __typename maxVariantPrice { __typename amount currencyCode } minVariantPrice { __typename amount currencyCode } } } }"#
    ))

  public var id: ID

  public init(id: ID) {
    self.id = id
  }

  public var __variables: Variables? { ["id": id] }

  public struct Data: ShopifyAPIKit.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.QueryRoot }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("product", Product?.self, arguments: ["id": .variable("id")]),
    ] }

    /// Fetch a specific `Product` by one of its unique attributes.
    public var product: Product? { __data["product"] }

    /// Product
    ///
    /// Parent Type: `Product`
    public struct Product: ShopifyAPIKit.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.Product }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("id", ShopifyAPIKit.ID.self),
        .field("title", String.self),
        .field("availableForSale", Bool.self),
        .field("description", String.self),
        .field("encodedVariantAvailability", String?.self),
        .field("encodedVariantExistence", String?.self),
        .field("handle", String.self),
        .field("isGiftCard", Bool.self),
        .field("productType", String.self),
        .field("tags", [String].self),
        .field("totalInventory", Int?.self),
        .field("vendor", String.self),
        .field("updatedAt", ShopifyAPIKit.DateTime.self),
        .field("images", Images.self, arguments: ["first": 10]),
        .field("featuredImage", FeaturedImage?.self),
        .field("adjacentVariants", [AdjacentVariant].self),
        .field("category", Category?.self),
        .field("priceRange", PriceRange.self),
      ] }

      /// A globally-unique ID.
      public var id: ShopifyAPIKit.ID { __data["id"] }
      /// The name for the product that displays to customers. The title is used to construct the product's handle.
      /// For example, if a product is titled "Black Sunglasses", then the handle is `black-sunglasses`.
      public var title: String { __data["title"] }
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
      /// A unique, human-readable string of the product's title.
      /// A handle can contain letters, hyphens (`-`), and numbers, but no spaces.
      /// The handle is used in the online store URL for the product.
      public var handle: String { __data["handle"] }
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
      /// The quantity of inventory that's in stock.
      public var totalInventory: Int? { __data["totalInventory"] }
      /// The name of the product's vendor.
      public var vendor: String { __data["vendor"] }
      /// The date and time when the product was last modified.
      /// A product's `updatedAt` value can change for different reasons. For example, if an order
      /// is placed for a product that has inventory tracking set up, then the inventory adjustment
      /// is counted as an update.
      public var updatedAt: ShopifyAPIKit.DateTime { __data["updatedAt"] }
      /// List of images associated with the product.
      public var images: Images { __data["images"] }
      /// The featured image for the product.
      ///
      /// This field is functionally equivalent to `images(first: 1)`.
      public var featuredImage: FeaturedImage? { __data["featuredImage"] }
      /// A list of variants whose selected options differ with the provided selected options by one, ordered by variant id.
      /// If selected options are not provided, adjacent variants to the first available variant is returned.
      ///
      /// Note that this field returns an array of variants. In most cases, the number of variants in this array will be low.
      /// However, with a low number of options and a high number of values per option, the number of variants returned
      /// here can be high. In such cases, it recommended to avoid using this field.
      ///
      /// This list of variants can be used in combination with the `options` field to build a rich variant picker that
      /// includes variant availability or other variant information.
      public var adjacentVariants: [AdjacentVariant] { __data["adjacentVariants"] }
      /// The category of a product from [Shopify's Standard Product Taxonomy](https://shopify.github.io/product-taxonomy/releases/unstable/?categoryId=sg-4-17-2-17).
      public var category: Category? { __data["category"] }
      /// The minimum and maximum prices of a product, expressed in decimal numbers.
      /// For example, if the product is priced between $10.00 and $50.00,
      /// then the price range is $10.00 - $50.00.
      public var priceRange: PriceRange { __data["priceRange"] }

      /// Product.Images
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

        /// Product.Images.Node
        ///
        /// Parent Type: `Image`
        public struct Node: ShopifyAPIKit.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.Image }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", ShopifyAPIKit.ID?.self),
            .field("url", ShopifyAPIKit.URL.self),
            .field("originalSrc", ShopifyAPIKit.URL.self),
            .field("altText", String?.self),
            .field("width", Int?.self),
            .field("height", Int?.self),
          ] }

          /// A unique ID for the image.
          public var id: ShopifyAPIKit.ID? { __data["id"] }
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
          /// A word or phrase to share the nature or contents of an image.
          public var altText: String? { __data["altText"] }
          /// The original width of the image in pixels. Returns `null` if the image isn't hosted by Shopify.
          public var width: Int? { __data["width"] }
          /// The original height of the image in pixels. Returns `null` if the image isn't hosted by Shopify.
          public var height: Int? { __data["height"] }
        }
      }

      /// Product.FeaturedImage
      ///
      /// Parent Type: `Image`
      public struct FeaturedImage: ShopifyAPIKit.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.Image }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", ShopifyAPIKit.ID?.self),
          .field("url", ShopifyAPIKit.URL.self),
          .field("originalSrc", ShopifyAPIKit.URL.self),
          .field("altText", String?.self),
          .field("width", Int?.self),
          .field("height", Int?.self),
        ] }

        /// A unique ID for the image.
        public var id: ShopifyAPIKit.ID? { __data["id"] }
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
        /// A word or phrase to share the nature or contents of an image.
        public var altText: String? { __data["altText"] }
        /// The original width of the image in pixels. Returns `null` if the image isn't hosted by Shopify.
        public var width: Int? { __data["width"] }
        /// The original height of the image in pixels. Returns `null` if the image isn't hosted by Shopify.
        public var height: Int? { __data["height"] }
      }

      /// Product.AdjacentVariant
      ///
      /// Parent Type: `ProductVariant`
      public struct AdjacentVariant: ShopifyAPIKit.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.ProductVariant }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("availableForSale", Bool.self),
          .field("barcode", String?.self),
          .field("currentlyNotInStock", Bool.self),
          .field("id", ShopifyAPIKit.ID.self),
          .field("quantityAvailable", Int?.self),
          .field("requiresComponents", Bool.self),
          .field("requiresShipping", Bool.self),
          .field("sku", String?.self),
          .field("taxable", Bool.self),
          .field("title", String.self),
          .field("weight", Double?.self),
        ] }

        /// Indicates if the product variant is available for sale.
        public var availableForSale: Bool { __data["availableForSale"] }
        /// The barcode (for example, ISBN, UPC, or GTIN) associated with the variant.
        public var barcode: String? { __data["barcode"] }
        /// Whether a product is out of stock but still available for purchase (used for backorders).
        public var currentlyNotInStock: Bool { __data["currentlyNotInStock"] }
        /// A globally-unique ID.
        public var id: ShopifyAPIKit.ID { __data["id"] }
        /// The total sellable quantity of the variant for online sales channels.
        public var quantityAvailable: Int? { __data["quantityAvailable"] }
        /// Whether a product variant requires components. The default value is `false`.
        /// If `true`, then the product variant can only be purchased as a parent bundle with components.
        public var requiresComponents: Bool { __data["requiresComponents"] }
        /// Whether a customer needs to provide a shipping address when placing an order for the product variant.
        public var requiresShipping: Bool { __data["requiresShipping"] }
        /// The SKU (stock keeping unit) associated with the variant.
        public var sku: String? { __data["sku"] }
        /// Whether tax is charged when the product variant is sold.
        public var taxable: Bool { __data["taxable"] }
        /// The product variant’s title.
        public var title: String { __data["title"] }
        /// The weight of the product variant in the unit system specified with `weight_unit`.
        public var weight: Double? { __data["weight"] }
      }

      /// Product.Category
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

      /// Product.PriceRange
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

        /// Product.PriceRange.MaxVariantPrice
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

        /// Product.PriceRange.MinVariantPrice
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
