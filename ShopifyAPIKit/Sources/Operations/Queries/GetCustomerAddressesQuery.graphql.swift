// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetCustomerAddressesQuery: GraphQLQuery {
  public static let operationName: String = "GetCustomerAddresses"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GetCustomerAddresses($customerAccessToken: String!) { customer(customerAccessToken: $customerAccessToken) { __typename id addresses(first: 10) { __typename nodes { __typename address1 address2 city company country countryCode countryCodeV2 firstName formatted formattedArea id lastName latitude longitude name phone province provinceCode zip } } defaultAddress { __typename address1 address2 city company country countryCode countryCodeV2 firstName formattedArea id lastName latitude longitude name phone province provinceCode zip } } }"#
    ))

  public var customerAccessToken: String

  public init(customerAccessToken: String) {
    self.customerAccessToken = customerAccessToken
  }

  public var __variables: Variables? { ["customerAccessToken": customerAccessToken] }

  public struct Data: ShopifyAPIKit.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.QueryRoot }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("customer", Customer?.self, arguments: ["customerAccessToken": .variable("customerAccessToken")]),
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
        .field("id", ShopifyAPIKit.ID.self),
        .field("addresses", Addresses.self, arguments: ["first": 10]),
        .field("defaultAddress", DefaultAddress?.self),
      ] }

      /// A unique ID for the customer.
      public var id: ShopifyAPIKit.ID { __data["id"] }
      /// A list of addresses for the customer.
      public var addresses: Addresses { __data["addresses"] }
      /// The customer’s default address.
      public var defaultAddress: DefaultAddress? { __data["defaultAddress"] }

      /// Customer.Addresses
      ///
      /// Parent Type: `MailingAddressConnection`
      public struct Addresses: ShopifyAPIKit.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.MailingAddressConnection }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("nodes", [Node].self),
        ] }

        /// A list of the nodes contained in MailingAddressEdge.
        public var nodes: [Node] { __data["nodes"] }

        /// Customer.Addresses.Node
        ///
        /// Parent Type: `MailingAddress`
        public struct Node: ShopifyAPIKit.SelectionSet {
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
      }

      /// Customer.DefaultAddress
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
          .field("countryCode", String?.self),
          .field("countryCodeV2", GraphQLEnum<ShopifyAPIKit.CountryCode>?.self),
          .field("firstName", String?.self),
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
    }
  }
}
