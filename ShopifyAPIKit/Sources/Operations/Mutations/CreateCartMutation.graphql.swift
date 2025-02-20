// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class CreateCartMutation: GraphQLMutation {
  public static let operationName: String = "CreateCart"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation CreateCart($email: String, $customerAccessToken: String, $phone: String) { cartCreate( input: { buyerIdentity: { email: $email, customerAccessToken: $customerAccessToken, phone: $phone } } ) { __typename cart { __typename id createdAt updatedAt } userErrors { __typename code field message } } }"#
    ))

  public var email: GraphQLNullable<String>
  public var customerAccessToken: GraphQLNullable<String>
  public var phone: GraphQLNullable<String>

  public init(
    email: GraphQLNullable<String>,
    customerAccessToken: GraphQLNullable<String>,
    phone: GraphQLNullable<String>
  ) {
    self.email = email
    self.customerAccessToken = customerAccessToken
    self.phone = phone
  }

  public var __variables: Variables? { [
    "email": email,
    "customerAccessToken": customerAccessToken,
    "phone": phone
  ] }

  public struct Data: ShopifyAPIKit.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("cartCreate", CartCreate?.self, arguments: ["input": ["buyerIdentity": [
        "email": .variable("email"),
        "customerAccessToken": .variable("customerAccessToken"),
        "phone": .variable("phone")
      ]]]),
    ] }

    /// Creates a new cart.
    public var cartCreate: CartCreate? { __data["cartCreate"] }

    /// CartCreate
    ///
    /// Parent Type: `CartCreatePayload`
    public struct CartCreate: ShopifyAPIKit.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.CartCreatePayload }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("cart", Cart?.self),
        .field("userErrors", [UserError].self),
      ] }

      /// The new cart.
      public var cart: Cart? { __data["cart"] }
      /// The list of errors that occurred from executing the mutation.
      public var userErrors: [UserError] { __data["userErrors"] }

      /// CartCreate.Cart
      ///
      /// Parent Type: `Cart`
      public struct Cart: ShopifyAPIKit.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.Cart }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", ShopifyAPIKit.ID.self),
          .field("createdAt", ShopifyAPIKit.DateTime.self),
          .field("updatedAt", ShopifyAPIKit.DateTime.self),
        ] }

        /// A globally-unique ID.
        public var id: ShopifyAPIKit.ID { __data["id"] }
        /// The date and time when the cart was created.
        public var createdAt: ShopifyAPIKit.DateTime { __data["createdAt"] }
        /// The date and time when the cart was updated.
        public var updatedAt: ShopifyAPIKit.DateTime { __data["updatedAt"] }
      }

      /// CartCreate.UserError
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
