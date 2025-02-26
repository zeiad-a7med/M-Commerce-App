// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class UpdateAddressMutation: GraphQLMutation {
  public static let operationName: String = "UpdateAddress"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation UpdateAddress($customerAccessToken: String!, $id: ID!, $zip: String!, $phone: String!, $firstName: String!, $lastName: String!, $country: String!, $city: String!, $address1: String!, $address2: String!) { customerAddressUpdate( customerAccessToken: $customerAccessToken id: $id address: { zip: $zip phone: $phone lastName: $lastName firstName: $firstName country: $country city: $city address2: $address2 address1: $address1 } ) { __typename customerAddress { __typename address1 address2 city company country countryCode countryCodeV2 firstName formatted formattedArea id lastName latitude longitude name phone province provinceCode zip } customerUserErrors { __typename code field message } } }"#
    ))

  public var customerAccessToken: String
  public var id: ID
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
    id: ID,
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
    self.id = id
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
    "id": id,
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
      .field("customerAddressUpdate", CustomerAddressUpdate?.self, arguments: [
        "customerAccessToken": .variable("customerAccessToken"),
        "id": .variable("id"),
        "address": [
          "zip": .variable("zip"),
          "phone": .variable("phone"),
          "lastName": .variable("lastName"),
          "firstName": .variable("firstName"),
          "country": .variable("country"),
          "city": .variable("city"),
          "address2": .variable("address2"),
          "address1": .variable("address1")
        ]
      ]),
    ] }

    /// Updates the address of an existing customer.
    public var customerAddressUpdate: CustomerAddressUpdate? { __data["customerAddressUpdate"] }

    /// CustomerAddressUpdate
    ///
    /// Parent Type: `CustomerAddressUpdatePayload`
    public struct CustomerAddressUpdate: ShopifyAPIKit.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.CustomerAddressUpdatePayload }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("customerAddress", CustomerAddress?.self),
        .field("customerUserErrors", [CustomerUserError].self),
      ] }

      /// The customer’s updated mailing address.
      public var customerAddress: CustomerAddress? { __data["customerAddress"] }
      /// The list of errors that occurred from executing the mutation.
      public var customerUserErrors: [CustomerUserError] { __data["customerUserErrors"] }

      /// CustomerAddressUpdate.CustomerAddress
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
          .field("company", String?.self),
          .field("country", String?.self),
          .field("countryCode", String?.self),
          .field("countryCodeV2", GraphQLEnum<ShopifyAPIKit.CountryCode>?.self),
          .field("firstName", String?.self),
          .field("formatted", [String].self),
          .field("formattedArea", String?.self),
          .field("id", ShopifyAPIKit.ID.self),
          .field("lastName", String?.self),
          .field("latitude", Double?.self),
          .field("longitude", Double?.self),
          .field("name", String?.self),
          .field("phone", String?.self),
          .field("province", String?.self),
          .field("provinceCode", String?.self),
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
        /// The two-letter code for the country of the address.
        ///
        /// For example, US.
        @available(*, deprecated, message: "Use `countryCodeV2` instead.")
        public var countryCode: String? { __data["countryCode"] }
        /// The two-letter code for the country of the address.
        ///
        /// For example, US.
        public var countryCodeV2: GraphQLEnum<ShopifyAPIKit.CountryCode>? { __data["countryCodeV2"] }
        /// The first name of the customer.
        public var firstName: String? { __data["firstName"] }
        /// A formatted version of the address, customized by the provided arguments.
        public var formatted: [String] { __data["formatted"] }
        /// A comma-separated list of the values for city, province, and country.
        public var formattedArea: String? { __data["formattedArea"] }
        /// A globally-unique ID.
        public var id: ShopifyAPIKit.ID { __data["id"] }
        /// The last name of the customer.
        public var lastName: String? { __data["lastName"] }
        /// The latitude coordinate of the customer address.
        public var latitude: Double? { __data["latitude"] }
        /// The longitude coordinate of the customer address.
        public var longitude: Double? { __data["longitude"] }
        /// The full name of the customer, based on firstName and lastName.
        public var name: String? { __data["name"] }
        /// A unique phone number for the customer.
        ///
        /// Formatted using E.164 standard. For example, _+16135551111_.
        public var phone: String? { __data["phone"] }
        /// The region of the address, such as the province, state, or district.
        public var province: String? { __data["province"] }
        /// The alphanumeric code for the region.
        ///
        /// For example, ON.
        public var provinceCode: String? { __data["provinceCode"] }
        /// The zip or postal code of the address.
        public var zip: String? { __data["zip"] }
      }

      /// CustomerAddressUpdate.CustomerUserError
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
