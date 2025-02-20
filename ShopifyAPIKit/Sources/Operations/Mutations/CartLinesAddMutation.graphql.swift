// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class CartLinesAddMutation: GraphQLMutation {
  public static let operationName: String = "CartLinesAdd"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation CartLinesAdd($cartId: ID!, $lines: [CartLineInput!]!) { cartLinesAdd(cartId: $cartId, lines: $lines) { __typename cart { __typename id checkoutUrl note totalQuantity lines(first: 50) { __typename nodes { __typename id merchandise { __typename ... on ProductVariant { id title } } quantity cost { __typename amountPerQuantity { __typename amount currencyCode } totalAmount { __typename amount currencyCode } subtotalAmount { __typename amount currencyCode } } } } } userErrors { __typename code field message } } }"#
    ))

  public var cartId: ID
  public var lines: [CartLineInput]

  public init(
    cartId: ID,
    lines: [CartLineInput]
  ) {
    self.cartId = cartId
    self.lines = lines
  }

  public var __variables: Variables? { [
    "cartId": cartId,
    "lines": lines
  ] }

  public struct Data: ShopifyAPIKit.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("cartLinesAdd", CartLinesAdd?.self, arguments: [
        "cartId": .variable("cartId"),
        "lines": .variable("lines")
      ]),
    ] }

    /// Adds a merchandise line to the cart.
    public var cartLinesAdd: CartLinesAdd? { __data["cartLinesAdd"] }

    /// CartLinesAdd
    ///
    /// Parent Type: `CartLinesAddPayload`
    public struct CartLinesAdd: ShopifyAPIKit.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.CartLinesAddPayload }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("cart", Cart?.self),
        .field("userErrors", [UserError].self),
      ] }

      /// The updated cart.
      public var cart: Cart? { __data["cart"] }
      /// The list of errors that occurred from executing the mutation.
      public var userErrors: [UserError] { __data["userErrors"] }

      /// CartLinesAdd.Cart
      ///
      /// Parent Type: `Cart`
      public struct Cart: ShopifyAPIKit.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.Cart }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", ShopifyAPIKit.ID.self),
          .field("checkoutUrl", ShopifyAPIKit.URL.self),
          .field("note", String?.self),
          .field("totalQuantity", Int.self),
          .field("lines", Lines.self, arguments: ["first": 50]),
        ] }

        /// A globally-unique ID.
        public var id: ShopifyAPIKit.ID { __data["id"] }
        /// The URL of the checkout for the cart.
        public var checkoutUrl: ShopifyAPIKit.URL { __data["checkoutUrl"] }
        /// A note that's associated with the cart. For example, the note can be a personalized message to the buyer.
        public var note: String? { __data["note"] }
        /// The total number of items in the cart.
        public var totalQuantity: Int { __data["totalQuantity"] }
        /// A list of lines containing information about the items the customer intends to purchase.
        public var lines: Lines { __data["lines"] }

        /// CartLinesAdd.Cart.Lines
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

          /// CartLinesAdd.Cart.Lines.Node
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

            /// CartLinesAdd.Cart.Lines.Node.Merchandise
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

              /// CartLinesAdd.Cart.Lines.Node.Merchandise.AsProductVariant
              ///
              /// Parent Type: `ProductVariant`
              public struct AsProductVariant: ShopifyAPIKit.InlineFragment {
                public let __data: DataDict
                public init(_dataDict: DataDict) { __data = _dataDict }

                public typealias RootEntityType = CartLinesAddMutation.Data.CartLinesAdd.Cart.Lines.Node.Merchandise
                public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.ProductVariant }
                public static var __selections: [ApolloAPI.Selection] { [
                  .field("id", ShopifyAPIKit.ID.self),
                  .field("title", String.self),
                ] }

                /// A globally-unique ID.
                public var id: ShopifyAPIKit.ID { __data["id"] }
                /// The product variant’s title.
                public var title: String { __data["title"] }
              }
            }

            /// CartLinesAdd.Cart.Lines.Node.Cost
            ///
            /// Parent Type: `CartLineCost`
            public struct Cost: ShopifyAPIKit.SelectionSet {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.CartLineCost }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("amountPerQuantity", AmountPerQuantity.self),
                .field("totalAmount", TotalAmount.self),
                .field("subtotalAmount", SubtotalAmount.self),
              ] }

              /// The amount of the merchandise line.
              public var amountPerQuantity: AmountPerQuantity { __data["amountPerQuantity"] }
              /// The total cost of the merchandise line.
              public var totalAmount: TotalAmount { __data["totalAmount"] }
              /// The cost of the merchandise line before line-level discounts.
              public var subtotalAmount: SubtotalAmount { __data["subtotalAmount"] }

              /// CartLinesAdd.Cart.Lines.Node.Cost.AmountPerQuantity
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

              /// CartLinesAdd.Cart.Lines.Node.Cost.TotalAmount
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

              /// CartLinesAdd.Cart.Lines.Node.Cost.SubtotalAmount
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
            }
          }
        }
      }

      /// CartLinesAdd.UserError
      ///
      /// Parent Type: `CartUserError`
      public struct UserError: ShopifyAPIKit.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.CartUserError }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("code", GraphQLEnum<ShopifyAPIKit.CartErrorCode>?.self),
          .field("field", [String]?.self),
          .field("message", String.self),
        ] }

        /// The error code.
        public var code: GraphQLEnum<ShopifyAPIKit.CartErrorCode>? { __data["code"] }
        /// The path to the input field that caused the error.
        public var field: [String]? { __data["field"] }
        /// The error message.
        public var message: String { __data["message"] }
      }
    }
  }
}
