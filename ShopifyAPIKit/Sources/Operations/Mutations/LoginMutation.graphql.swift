// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class LoginMutation: GraphQLMutation {
  public static let operationName: String = "Login"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation Login($email: String!, $password: String!) { customerAccessTokenCreate(input: { email: $email, password: $password }) { __typename customerAccessToken { __typename accessToken expiresAt } userErrors { __typename field message } } }"#
    ))

  public var email: String
  public var password: String

  public init(
    email: String,
    password: String
  ) {
    self.email = email
    self.password = password
  }

  public var __variables: Variables? { [
    "email": email,
    "password": password
  ] }

  public struct Data: ShopifyAPIKit.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("customerAccessTokenCreate", CustomerAccessTokenCreate?.self, arguments: ["input": [
        "email": .variable("email"),
        "password": .variable("password")
      ]]),
    ] }

    /// Creates a customer access token.
    /// The customer access token is required to modify the customer object in any way.
    public var customerAccessTokenCreate: CustomerAccessTokenCreate? { __data["customerAccessTokenCreate"] }

    /// CustomerAccessTokenCreate
    ///
    /// Parent Type: `CustomerAccessTokenCreatePayload`
    public struct CustomerAccessTokenCreate: ShopifyAPIKit.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.CustomerAccessTokenCreatePayload }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("customerAccessToken", CustomerAccessToken?.self),
        .field("userErrors", [UserError].self),
      ] }

      /// The newly created customer access token object.
      public var customerAccessToken: CustomerAccessToken? { __data["customerAccessToken"] }
      /// The list of errors that occurred from executing the mutation.
      @available(*, deprecated, message: "Use `customerUserErrors` instead.")
      public var userErrors: [UserError] { __data["userErrors"] }

      /// CustomerAccessTokenCreate.CustomerAccessToken
      ///
      /// Parent Type: `CustomerAccessToken`
      public struct CustomerAccessToken: ShopifyAPIKit.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.CustomerAccessToken }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("accessToken", String.self),
          .field("expiresAt", ShopifyAPIKit.DateTime.self),
        ] }

        /// The customer’s access token.
        public var accessToken: String { __data["accessToken"] }
        /// The date and time when the customer access token expires.
        public var expiresAt: ShopifyAPIKit.DateTime { __data["expiresAt"] }
      }

      /// CustomerAccessTokenCreate.UserError
      ///
      /// Parent Type: `UserError`
      public struct UserError: ShopifyAPIKit.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.UserError }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("field", [String]?.self),
          .field("message", String.self),
        ] }

        /// The path to the input field that caused the error.
        public var field: [String]? { __data["field"] }
        /// The error message.
        public var message: String { __data["message"] }
      }
    }
  }
}
