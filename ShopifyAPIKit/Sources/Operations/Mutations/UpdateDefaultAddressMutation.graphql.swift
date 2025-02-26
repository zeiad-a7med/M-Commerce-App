// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class UpdateDefaultAddressMutation: GraphQLMutation {
  public static let operationName: String = "UpdateDefaultAddress"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation UpdateDefaultAddress($customerAccessToken: String!, $id: ID!) { customerDefaultAddressUpdate( customerAccessToken: $customerAccessToken addressId: $id ) { __typename customerUserErrors { __typename code field message } customer { __typename defaultAddress { __typename address1 address2 city company country firstName id lastName name phone zip } } } }"#
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
      .field("customerDefaultAddressUpdate", CustomerDefaultAddressUpdate?.self, arguments: [
        "customerAccessToken": .variable("customerAccessToken"),
        "addressId": .variable("id")
      ]),
    ] }

    /// Updates the default address of an existing customer.
    public var customerDefaultAddressUpdate: CustomerDefaultAddressUpdate? { __data["customerDefaultAddressUpdate"] }

    /// CustomerDefaultAddressUpdate
    ///
    /// Parent Type: `CustomerDefaultAddressUpdatePayload`
    public struct CustomerDefaultAddressUpdate: ShopifyAPIKit.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.CustomerDefaultAddressUpdatePayload }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("customerUserErrors", [CustomerUserError].self),
        .field("customer", Customer?.self),
      ] }

      /// The list of errors that occurred from executing the mutation.
      public var customerUserErrors: [CustomerUserError] { __data["customerUserErrors"] }
      /// The updated customer object.
      public var customer: Customer? { __data["customer"] }

      /// CustomerDefaultAddressUpdate.CustomerUserError
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

      /// CustomerDefaultAddressUpdate.Customer
      ///
      /// Parent Type: `Customer`
      public struct Customer: ShopifyAPIKit.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.Customer }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("defaultAddress", DefaultAddress?.self),
        ] }

        /// The customer’s default address.
        public var defaultAddress: DefaultAddress? { __data["defaultAddress"] }

        /// CustomerDefaultAddressUpdate.Customer.DefaultAddress
        ///
        /// Parent Type: `MailingAddress`
        public struct DefaultAddress: ShopifyAPIKit.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.MailingAddress }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("address1", String?.self),
            .field("address2", String?.self),
            .field("city", String?.self),
            .field("company", String?.self),
            .field("country", String?.self),
            .field("firstName", String?.self),
            .field("id", ShopifyAPIKit.ID.self),
            .field("lastName", String?.self),
            .field("name", String?.self),
            .field("phone", String?.self),
            .field("zip", String?.self),
          ] }

          /// The first line of the address. Typically the street address or PO Box number.
          public var address1: String? { __data["address1"] }
          /// The second line of the address. Typically the number of the apartment, suite, or unit.
          public var address2: String? { __data["address2"] }
          /// The name of the city, district, village, or town.
          public var city: String? { __data["city"] }
          /// The name of the customer's company or organization.
          public var company: String? { __data["company"] }
          /// The name of the country.
          public var country: String? { __data["country"] }
          /// The first name of the customer.
          public var firstName: String? { __data["firstName"] }
          /// A globally-unique ID.
          public var id: ShopifyAPIKit.ID { __data["id"] }
          /// The last name of the customer.
          public var lastName: String? { __data["lastName"] }
          /// The full name of the customer, based on firstName and lastName.
          public var name: String? { __data["name"] }
          /// A unique phone number for the customer.
          ///
          /// Formatted using E.164 standard. For example, _+16135551111_.
          public var phone: String? { __data["phone"] }
          /// The zip or postal code of the address.
          public var zip: String? { __data["zip"] }
        }
      }
    }
  }
}
