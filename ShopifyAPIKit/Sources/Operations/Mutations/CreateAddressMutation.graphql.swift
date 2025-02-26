// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class CreateAddressMutation: GraphQLMutation {
  public static let operationName: String = "CreateAddress"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation CreateAddress($customerAccessToken: String!, $zip: String!, $phone: String!, $firstName: String!, $lastName: String!, $country: String!, $city: String!, $address1: String!, $address2: String!) { customerAddressCreate( customerAccessToken: $customerAccessToken address: { zip: $zip phone: $phone lastName: $firstName firstName: $lastName country: $country city: $city address2: $address1 address1: $address2 } ) { __typename customerAddress { __typename address1 address2 city country firstName id lastName phone zip } customerUserErrors { __typename code field message } } }"#
    ))

  public var customerAccessToken: String
  public var zip: String
  public var phone: String
  public var firstName: String
  public var lastName: String
  public var country: String
  public var city: String
  public var address1: String
  public var address2: String

  public init(
    customerAccessToken: String,
    zip: String,
    phone: String,
    firstName: String,
    lastName: String,
    country: String,
    city: String,
    address1: String,
    address2: String
  ) {
    self.customerAccessToken = customerAccessToken
    self.zip = zip
    self.phone = phone
    self.firstName = firstName
    self.lastName = lastName
    self.country = country
    self.city = city
    self.address1 = address1
    self.address2 = address2
  }

  public var __variables: Variables? { [
    "customerAccessToken": customerAccessToken,
    "zip": zip,
    "phone": phone,
    "firstName": firstName,
    "lastName": lastName,
    "country": country,
    "city": city,
    "address1": address1,
    "address2": address2
  ] }

  public struct Data: ShopifyAPIKit.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("customerAddressCreate", CustomerAddressCreate?.self, arguments: [
        "customerAccessToken": .variable("customerAccessToken"),
        "address": [
          "zip": .variable("zip"),
          "phone": .variable("phone"),
          "lastName": .variable("firstName"),
          "firstName": .variable("lastName"),
          "country": .variable("country"),
          "city": .variable("city"),
          "address2": .variable("address1"),
          "address1": .variable("address2")
        ]
      ]),
    ] }

    /// Creates a new address for a customer.
    public var customerAddressCreate: CustomerAddressCreate? { __data["customerAddressCreate"] }

    /// CustomerAddressCreate
    ///
    /// Parent Type: `CustomerAddressCreatePayload`
    public struct CustomerAddressCreate: ShopifyAPIKit.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.CustomerAddressCreatePayload }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("customerAddress", CustomerAddress?.self),
        .field("customerUserErrors", [CustomerUserError].self),
      ] }

      /// The new customer address object.
      public var customerAddress: CustomerAddress? { __data["customerAddress"] }
      /// The list of errors that occurred from executing the mutation.
      public var customerUserErrors: [CustomerUserError] { __data["customerUserErrors"] }

      /// CustomerAddressCreate.CustomerAddress
      ///
      /// Parent Type: `MailingAddress`
      public struct CustomerAddress: ShopifyAPIKit.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.MailingAddress }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("address1", String?.self),
          .field("address2", String?.self),
          .field("city", String?.self),
          .field("country", String?.self),
          .field("firstName", String?.self),
          .field("id", ShopifyAPIKit.ID.self),
          .field("lastName", String?.self),
          .field("phone", String?.self),
          .field("zip", String?.self),
        ] }

        /// The first line of the address. Typically the street address or PO Box number.
        public var address1: String? { __data["address1"] }
        /// The second line of the address. Typically the number of the apartment, suite, or unit.
        public var address2: String? { __data["address2"] }
        /// The name of the city, district, village, or town.
        public var city: String? { __data["city"] }
        /// The name of the country.
        public var country: String? { __data["country"] }
        /// The first name of the customer.
        public var firstName: String? { __data["firstName"] }
        /// A globally-unique ID.
        public var id: ShopifyAPIKit.ID { __data["id"] }
        /// The last name of the customer.
        public var lastName: String? { __data["lastName"] }
        /// A unique phone number for the customer.
        ///
        /// Formatted using E.164 standard. For example, _+16135551111_.
        public var phone: String? { __data["phone"] }
        /// The zip or postal code of the address.
        public var zip: String? { __data["zip"] }
      }

      /// CustomerAddressCreate.CustomerUserError
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
