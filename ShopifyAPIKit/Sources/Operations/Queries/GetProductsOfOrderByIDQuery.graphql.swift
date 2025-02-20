// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetProductsOfOrderByIDQuery: GraphQLQuery {
  public static let operationName: String = "GetProductsOfOrderByID"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GetProductsOfOrderByID($CustomerAT: String!) { customer(customerAccessToken: $CustomerAT) { __typename orders(first: 10) { __typename totalCount nodes { __typename lineItems(first: 10) { __typename nodes { __typename currentQuantity quantity title variant { __typename currentlyNotInStock id title image { __typename id url } } } } currentSubtotalPrice { __typename amount currencyCode } currentTotalPrice { __typename amount currencyCode } } } displayName } }"#
    ))

  public var customerAT: String

  public init(customerAT: String) {
    self.customerAT = customerAT
  }

  public var __variables: Variables? { ["CustomerAT": customerAT] }

  public struct Data: ShopifyAPIKit.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.QueryRoot }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("customer", Customer?.self, arguments: ["customerAccessToken": .variable("CustomerAT")]),
    ] }

    /// The customer associated with the given access token. Tokens are obtained by using the
    /// [`customerAccessTokenCreate` mutation](https://shopify.dev/docs/api/storefront/latest/mutations/customerAccessTokenCreate).
    public var customer: Customer? { __data["customer"] }

    /// Customer
    ///
    /// Parent Type: `Customer`
    public struct Customer: ShopifyAPIKit.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.Customer }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("orders", Orders.self, arguments: ["first": 10]),
        .field("displayName", String.self),
      ] }

      /// The orders associated with the customer.
      public var orders: Orders { __data["orders"] }
      /// The customer’s name, email or phone number.
      public var displayName: String { __data["displayName"] }

      /// Customer.Orders
      ///
      /// Parent Type: `OrderConnection`
      public struct Orders: ShopifyAPIKit.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.OrderConnection }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("totalCount", ShopifyAPIKit.UnsignedInt64.self),
          .field("nodes", [Node].self),
        ] }

        /// The total count of Orders.
        public var totalCount: ShopifyAPIKit.UnsignedInt64 { __data["totalCount"] }
        /// A list of the nodes contained in OrderEdge.
        public var nodes: [Node] { __data["nodes"] }

        /// Customer.Orders.Node
        ///
        /// Parent Type: `Order`
        public struct Node: ShopifyAPIKit.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.Order }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("lineItems", LineItems.self, arguments: ["first": 10]),
            .field("currentSubtotalPrice", CurrentSubtotalPrice.self),
            .field("currentTotalPrice", CurrentTotalPrice.self),
          ] }

          /// List of the order’s line items.
          public var lineItems: LineItems { __data["lineItems"] }
          /// The subtotal of line items and their discounts, excluding line items that have been removed. Does not contain order-level discounts, duties, shipping costs, or shipping discounts. Taxes aren't included unless the order is a taxes-included order.
          public var currentSubtotalPrice: CurrentSubtotalPrice { __data["currentSubtotalPrice"] }
          /// The total amount of the order, including duties, taxes and discounts, minus amounts for line items that have been removed.
          public var currentTotalPrice: CurrentTotalPrice { __data["currentTotalPrice"] }

          /// Customer.Orders.Node.LineItems
          ///
          /// Parent Type: `OrderLineItemConnection`
          public struct LineItems: ShopifyAPIKit.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.OrderLineItemConnection }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("nodes", [Node].self),
            ] }

            /// A list of the nodes contained in OrderLineItemEdge.
            public var nodes: [Node] { __data["nodes"] }

            /// Customer.Orders.Node.LineItems.Node
            ///
            /// Parent Type: `OrderLineItem`
            public struct Node: ShopifyAPIKit.SelectionSet {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.OrderLineItem }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("currentQuantity", Int.self),
                .field("quantity", Int.self),
                .field("title", String.self),
                .field("variant", Variant?.self),
              ] }

              /// The number of entries associated to the line item minus the items that have been removed.
              public var currentQuantity: Int { __data["currentQuantity"] }
              /// The number of products variants associated to the line item.
              public var quantity: Int { __data["quantity"] }
              /// The title of the product combined with title of the variant.
              public var title: String { __data["title"] }
              /// The product variant object associated to the line item.
              public var variant: Variant? { __data["variant"] }

              /// Customer.Orders.Node.LineItems.Node.Variant
              ///
              /// Parent Type: `ProductVariant`
              public struct Variant: ShopifyAPIKit.SelectionSet {
                public let __data: DataDict
                public init(_dataDict: DataDict) { __data = _dataDict }

                public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.ProductVariant }
                public static var __selections: [ApolloAPI.Selection] { [
                  .field("__typename", String.self),
                  .field("currentlyNotInStock", Bool.self),
                  .field("id", ShopifyAPIKit.ID.self),
                  .field("title", String.self),
                  .field("image", Image?.self),
                ] }

                /// Whether a product is out of stock but still available for purchase (used for backorders).
                public var currentlyNotInStock: Bool { __data["currentlyNotInStock"] }
                /// A globally-unique ID.
                public var id: ShopifyAPIKit.ID { __data["id"] }
                /// The product variant’s title.
                public var title: String { __data["title"] }
                /// Image associated with the product variant. This field falls back to the product image if no image is available.
                public var image: Image? { __data["image"] }

                /// Customer.Orders.Node.LineItems.Node.Variant.Image
                ///
                /// Parent Type: `Image`
                public struct Image: ShopifyAPIKit.SelectionSet {
                  public let __data: DataDict
                  public init(_dataDict: DataDict) { __data = _dataDict }

                  public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.Image }
                  public static var __selections: [ApolloAPI.Selection] { [
                    .field("__typename", String.self),
                    .field("id", ShopifyAPIKit.ID?.self),
                    .field("url", ShopifyAPIKit.URL.self),
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
                }
              }
            }
          }

          /// Customer.Orders.Node.CurrentSubtotalPrice
          ///
          /// Parent Type: `MoneyV2`
          public struct CurrentSubtotalPrice: ShopifyAPIKit.SelectionSet {
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

          /// Customer.Orders.Node.CurrentTotalPrice
          ///
          /// Parent Type: `MoneyV2`
          public struct CurrentTotalPrice: ShopifyAPIKit.SelectionSet {
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
