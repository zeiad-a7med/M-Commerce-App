// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class DeleteAddressMutation: GraphQLMutation {
  public static let operationName: String = "DeleteAddress"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation DeleteAddress($customerAccessToken: String!, $id: ID!) { customerAddressDelete(id: $id, customerAccessToken: $customerAccessToken) { __typename deletedCustomerAddressId customerUserErrors { __typename code field message } } }"#
    ))

  public var customerAccessToken: String
  public var id: ID

  public init(
    customerAccessToken: String,
    id: ID
  ) {
    self.customerAccessToken = customerAccessToken
    self.id = id
  }

  public var __variables: Variables? { [
    "customerAccessToken": customerAccessToken,
    "id": id
  ] }

  public struct Data: ShopifyAPIKit.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("customerAddressDelete", CustomerAddressDelete?.self, arguments: [
        "id": .variable("id"),
        "customerAccessToken": .variable("customerAccessToken")
      ]),
    ] }

    /// Permanently deletes the address of an existing customer.
    public var customerAddressDelete: CustomerAddressDelete? { __data["customerAddressDelete"] }

    /// CustomerAddressDelete
    ///
    /// Parent Type: `CustomerAddressDeletePayload`
    public struct CustomerAddressDelete: ShopifyAPIKit.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.CustomerAddressDeletePayload }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("deletedCustomerAddressId", String?.self),
        .field("customerUserErrors", [CustomerUserError].self),
      ] }

      /// ID of the deleted customer address.
      public var deletedCustomerAddressId: String? { __data["deletedCustomerAddressId"] }
      /// The list of errors that occurred from executing the mutation.
      public var customerUserErrors: [CustomerUserError] { __data["customerUserErrors"] }

      /// CustomerAddressDelete.CustomerUserError
      ///
      /// Parent Type: `CustomerUserError`
      public struct CustomerUserError: ShopifyAPIKit.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.CustomerUserError }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("code", GraphQLEnum<ShopifyAPIKit.CustomerErrorCode>?.self),
          .field("field", [String]?.self),
          .field("message", String.self),
        ] }

        /// The error code.
        public var code: GraphQLEnum<ShopifyAPIKit.CustomerErrorCode>? { __data["code"] }
        /// The path to the input field that caused the error.
        public var field: [String]? { __data["field"] }
        /// The error message.
        public var message: String { __data["message"] }
      }
    }
  }
}
