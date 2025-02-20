// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetCartQuery: GraphQLQuery {
  public static let operationName: String = "GetCart"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GetCart($cartId: ID!) { cart(id: $cartId) { __typename checkoutUrl createdAt id note totalQuantity updatedAt lines(first: 50) { __typename nodes { __typename id merchandise { __typename ... on ProductVariant { availableForSale barcode currentlyNotInStock id quantityAvailable requiresComponents requiresShipping sku taxable title weight weightUnit image { __typename altText height id originalSrc src transformedSrc url width } price { __typename amount currencyCode } priceV2 { __typename amount currencyCode } quantityRule { __typename increment maximum minimum } product { __typename id title vendor } } } quantity cost { __typename totalAmount { __typename amount currencyCode } subtotalAmount { __typename amount currencyCode } amountPerQuantity { __typename amount currencyCode } } } } cost { __typename subtotalAmountEstimated totalAmountEstimated totalDutyAmountEstimated totalTaxAmountEstimated checkoutChargeAmount { __typename amount currencyCode } totalAmount { __typename amount currencyCode } subtotalAmount { __typename amount currencyCode } totalDutyAmount { __typename amount currencyCode } totalTaxAmount { __typename amount currencyCode } } } }"#
    ))

  public var cartId: ID

  public init(cartId: ID) {
    self.cartId = cartId
  }

  public var __variables: Variables? { ["cartId": cartId] }

  public struct Data: ShopifyAPIKit.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.QueryRoot }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("cart", Cart?.self, arguments: ["id": .variable("cartId")]),
    ] }

    /// Retrieve a cart by its ID. For more information, refer to
    /// [Manage a cart with the Storefront API](https://shopify.dev/custom-storefronts/cart/manage).
    public var cart: Cart? { __data["cart"] }

    /// Cart
    ///
    /// Parent Type: `Cart`
    public struct Cart: ShopifyAPIKit.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.Cart }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("checkoutUrl", ShopifyAPIKit.URL.self),
        .field("createdAt", ShopifyAPIKit.DateTime.self),
        .field("id", ShopifyAPIKit.ID.self),
        .field("note", String?.self),
        .field("totalQuantity", Int.self),
        .field("updatedAt", ShopifyAPIKit.DateTime.self),
        .field("lines", Lines.self, arguments: ["first": 50]),
        .field("cost", Cost.self),
      ] }

      /// The URL of the checkout for the cart.
      public var checkoutUrl: ShopifyAPIKit.URL { __data["checkoutUrl"] }
      /// The date and time when the cart was created.
      public var createdAt: ShopifyAPIKit.DateTime { __data["createdAt"] }
      /// A globally-unique ID.
      public var id: ShopifyAPIKit.ID { __data["id"] }
      /// A note that's associated with the cart. For example, the note can be a personalized message to the buyer.
      public var note: String? { __data["note"] }
      /// The total number of items in the cart.
      public var totalQuantity: Int { __data["totalQuantity"] }
      /// The date and time when the cart was updated.
      public var updatedAt: ShopifyAPIKit.DateTime { __data["updatedAt"] }
      /// A list of lines containing information about the items the customer intends to purchase.
      public var lines: Lines { __data["lines"] }
      /// The estimated costs that the buyer will pay at checkout. The costs are subject to change and changes will be reflected at checkout. The `cost` field uses the `buyerIdentity` field to determine [international pricing](https://shopify.dev/custom-storefronts/internationalization/international-pricing).
      public var cost: Cost { __data["cost"] }

      /// Cart.Lines
      ///
      /// Parent Type: `BaseCartLineConnection`
      public struct Lines: ShopifyAPIKit.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.BaseCartLineConnection }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("nodes", [Node].self),
        ] }

        /// A list of the nodes contained in BaseCartLineEdge.
        public var nodes: [Node] { __data["nodes"] }

        /// Cart.Lines.Node
        ///
        /// Parent Type: `BaseCartLine`
        public struct Node: ShopifyAPIKit.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Interfaces.BaseCartLine }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", ShopifyAPIKit.ID.self),
            .field("merchandise", Merchandise.self),
            .field("quantity", Int.self),
            .field("cost", Cost.self),
          ] }

          /// A globally-unique ID.
          public var id: ShopifyAPIKit.ID { __data["id"] }
          /// The merchandise that the buyer intends to purchase.
          public var merchandise: Merchandise { __data["merchandise"] }
          /// The quantity of the merchandise that the customer intends to purchase.
          public var quantity: Int { __data["quantity"] }
          /// The cost of the merchandise that the buyer will pay for at checkout. The costs are subject to change and changes will be reflected at checkout.
          public var cost: Cost { __data["cost"] }

          /// Cart.Lines.Node.Merchandise
          ///
          /// Parent Type: `Merchandise`
          public struct Merchandise: ShopifyAPIKit.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Unions.Merchandise }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .inlineFragment(AsProductVariant.self),
            ] }

            public var asProductVariant: AsProductVariant? { _asInlineFragment() }

            /// Cart.Lines.Node.Merchandise.AsProductVariant
            ///
            /// Parent Type: `ProductVariant`
            public struct AsProductVariant: ShopifyAPIKit.InlineFragment {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public typealias RootEntityType = GetCartQuery.Data.Cart.Lines.Node.Merchandise
              public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.ProductVariant }
              public static var __selections: [ApolloAPI.Selection] { [
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
                .field("weightUnit", GraphQLEnum<ShopifyAPIKit.WeightUnit>.self),
                .field("image", Image?.self),
                .field("price", Price.self),
                .field("priceV2", PriceV2.self),
                .field("quantityRule", QuantityRule.self),
                .field("product", Product.self),
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
              /// Unit of measurement for weight.
              public var weightUnit: GraphQLEnum<ShopifyAPIKit.WeightUnit> { __data["weightUnit"] }
              /// Image associated with the product variant. This field falls back to the product image if no image is available.
              public var image: Image? { __data["image"] }
              /// The product variant’s price.
              public var price: Price { __data["price"] }
              /// The product variant’s price.
              @available(*, deprecated, message: "Use `price` instead.")
              public var priceV2: PriceV2 { __data["priceV2"] }
              /// The quantity rule for the product variant in a given context.
              public var quantityRule: QuantityRule { __data["quantityRule"] }
              /// The product object that the product variant belongs to.
              public var product: Product { __data["product"] }

              /// Cart.Lines.Node.Merchandise.AsProductVariant.Image
              ///
              /// Parent Type: `Image`
              public struct Image: ShopifyAPIKit.SelectionSet {
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
                  .field("transformedSrc", ShopifyAPIKit.URL.self),
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
                /// The location of the transformed image as a URL.
                ///
                /// All transformation arguments are considered "best-effort". If they can be applied to an image, they will be.
                /// Otherwise any transformations which an image type doesn't support will be ignored.
                @available(*, deprecated, message: "Use `url(transform:)` instead")
                public var transformedSrc: ShopifyAPIKit.URL { __data["transformedSrc"] }
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

              /// Cart.Lines.Node.Merchandise.AsProductVariant.Price
              ///
              /// Parent Type: `MoneyV2`
              public struct Price: ShopifyAPIKit.SelectionSet {
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

              /// Cart.Lines.Node.Merchandise.AsProductVariant.PriceV2
              ///
              /// Parent Type: `MoneyV2`
              public struct PriceV2: ShopifyAPIKit.SelectionSet {
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

              /// Cart.Lines.Node.Merchandise.AsProductVariant.QuantityRule
              ///
              /// Parent Type: `QuantityRule`
              public struct QuantityRule: ShopifyAPIKit.SelectionSet {
                public let __data: DataDict
                public init(_dataDict: DataDict) { __data = _dataDict }

                public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.QuantityRule }
                public static var __selections: [ApolloAPI.Selection] { [
                  .field("__typename", String.self),
                  .field("increment", Int.self),
                  .field("maximum", Int?.self),
                  .field("minimum", Int.self),
                ] }

                /// The value that specifies the quantity increment between minimum and maximum of the rule.
                /// Only quantities divisible by this value will be considered valid.
                ///
                /// The increment must be lower than or equal to the minimum and the maximum, and both minimum and maximum
                /// must be divisible by this value.
                public var increment: Int { __data["increment"] }
                /// An optional value that defines the highest allowed quantity purchased by the customer.
                /// If defined, maximum must be lower than or equal to the minimum and must be a multiple of the increment.
                public var maximum: Int? { __data["maximum"] }
                /// The value that defines the lowest allowed quantity purchased by the customer.
                /// The minimum must be a multiple of the quantity rule's increment.
                public var minimum: Int { __data["minimum"] }
              }

              /// Cart.Lines.Node.Merchandise.AsProductVariant.Product
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
                  .field("vendor", String.self),
                ] }

                /// A globally-unique ID.
                public var id: ShopifyAPIKit.ID { __data["id"] }
                /// The name for the product that displays to customers. The title is used to construct the product's handle.
                /// For example, if a product is titled "Black Sunglasses", then the handle is `black-sunglasses`.
                public var title: String { __data["title"] }
                /// The name of the product's vendor.
                public var vendor: String { __data["vendor"] }
              }
            }
          }

          /// Cart.Lines.Node.Cost
          ///
          /// Parent Type: `CartLineCost`
          public struct Cost: ShopifyAPIKit.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.CartLineCost }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("totalAmount", TotalAmount.self),
              .field("subtotalAmount", SubtotalAmount.self),
              .field("amountPerQuantity", AmountPerQuantity.self),
            ] }

            /// The total cost of the merchandise line.
            public var totalAmount: TotalAmount { __data["totalAmount"] }
            /// The cost of the merchandise line before line-level discounts.
            public var subtotalAmount: SubtotalAmount { __data["subtotalAmount"] }
            /// The amount of the merchandise line.
            public var amountPerQuantity: AmountPerQuantity { __data["amountPerQuantity"] }

            /// Cart.Lines.Node.Cost.TotalAmount
            ///
            /// Parent Type: `MoneyV2`
            public struct TotalAmount: ShopifyAPIKit.SelectionSet {
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

            /// Cart.Lines.Node.Cost.SubtotalAmount
            ///
            /// Parent Type: `MoneyV2`
            public struct SubtotalAmount: ShopifyAPIKit.SelectionSet {
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

            /// Cart.Lines.Node.Cost.AmountPerQuantity
            ///
            /// Parent Type: `MoneyV2`
            public struct AmountPerQuantity: ShopifyAPIKit.SelectionSet {
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

      /// Cart.Cost
      ///
      /// Parent Type: `CartCost`
      public struct Cost: ShopifyAPIKit.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.CartCost }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("subtotalAmountEstimated", Bool.self),
          .field("totalAmountEstimated", Bool.self),
          .field("totalDutyAmountEstimated", Bool.self),
          .field("totalTaxAmountEstimated", Bool.self),
          .field("checkoutChargeAmount", CheckoutChargeAmount.self),
          .field("totalAmount", TotalAmount.self),
          .field("subtotalAmount", SubtotalAmount.self),
          .field("totalDutyAmount", TotalDutyAmount?.self),
          .field("totalTaxAmount", TotalTaxAmount?.self),
        ] }

        /// Whether the subtotal amount is estimated.
        public var subtotalAmountEstimated: Bool { __data["subtotalAmountEstimated"] }
        /// Whether the total amount is estimated.
        public var totalAmountEstimated: Bool { __data["totalAmountEstimated"] }
        /// Whether the total duty amount is estimated.
        @available(*, deprecated, message: "Tax and duty amounts are no longer available and will be removed in a future version.\nPlease see [the changelog](https://shopify.dev/changelog/tax-and-duties-are-deprecated-in-storefront-cart-api)\nfor more information.")
        public var totalDutyAmountEstimated: Bool { __data["totalDutyAmountEstimated"] }
        /// Whether the total tax amount is estimated.
        @available(*, deprecated, message: "Tax and duty amounts are no longer available and will be removed in a future version.\nPlease see [the changelog](https://shopify.dev/changelog/tax-and-duties-are-deprecated-in-storefront-cart-api)\nfor more information.")
        public var totalTaxAmountEstimated: Bool { __data["totalTaxAmountEstimated"] }
        /// The estimated amount, before taxes and discounts, for the customer to pay at checkout. The checkout charge amount doesn't include any deferred payments that'll be paid at a later date. If the cart has no deferred payments, then the checkout charge amount is equivalent to `subtotalAmount`.
        public var checkoutChargeAmount: CheckoutChargeAmount { __data["checkoutChargeAmount"] }
        /// The total amount for the customer to pay.
        public var totalAmount: TotalAmount { __data["totalAmount"] }
        /// The amount, before taxes and cart-level discounts, for the customer to pay.
        public var subtotalAmount: SubtotalAmount { __data["subtotalAmount"] }
        /// The duty amount for the customer to pay at checkout.
        @available(*, deprecated, message: "Tax and duty amounts are no longer available and will be removed in a future version.\nPlease see [the changelog](https://shopify.dev/changelog/tax-and-duties-are-deprecated-in-storefront-cart-api)\nfor more information.")
        public var totalDutyAmount: TotalDutyAmount? { __data["totalDutyAmount"] }
        /// The tax amount for the customer to pay at checkout.
        @available(*, deprecated, message: "Tax and duty amounts are no longer available and will be removed in a future version.\nPlease see [the changelog](https://shopify.dev/changelog/tax-and-duties-are-deprecated-in-storefront-cart-api)\nfor more information.")
        public var totalTaxAmount: TotalTaxAmount? { __data["totalTaxAmount"] }

        /// Cart.Cost.CheckoutChargeAmount
        ///
        /// Parent Type: `MoneyV2`
        public struct CheckoutChargeAmount: ShopifyAPIKit.SelectionSet {
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

        /// Cart.Cost.TotalAmount
        ///
        /// Parent Type: `MoneyV2`
        public struct TotalAmount: ShopifyAPIKit.SelectionSet {
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

        /// Cart.Cost.SubtotalAmount
        ///
        /// Parent Type: `MoneyV2`
        public struct SubtotalAmount: ShopifyAPIKit.SelectionSet {
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

        /// Cart.Cost.TotalDutyAmount
        ///
        /// Parent Type: `MoneyV2`
        public struct TotalDutyAmount: ShopifyAPIKit.SelectionSet {
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

        /// Cart.Cost.TotalTaxAmount
        ///
        /// Parent Type: `MoneyV2`
        public struct TotalTaxAmount: ShopifyAPIKit.SelectionSet {
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
