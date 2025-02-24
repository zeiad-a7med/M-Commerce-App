// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetOrdersFromCustomerATQuery: GraphQLQuery {
  public static let operationName: String = "GetOrdersFromCustomerAT"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GetOrdersFromCustomerAT($CustomerAT: String!) { customer(customerAccessToken: $CustomerAT) { __typename id phone email orders(first: 100) { __typename totalCount nodes { __typename currencyCode edited email financialStatus fulfillmentStatus id name orderNumber processedAt statusUrl currentSubtotalPrice { __typename amount currencyCode } currentTotalPrice { __typename amount currencyCode } } } addresses(first: 1) { __typename nodes { __typename address1 city country countryCode firstName id lastName latitude longitude name phone } } displayName } }"#
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
        .field("id", ShopifyAPIKit.ID.self),
        .field("phone", String?.self),
        .field("email", String?.self),
        .field("orders", Orders.self, arguments: ["first": 100]),
        .field("addresses", Addresses.self, arguments: ["first": 1]),
        .field("displayName", String.self),
      ] }

      /// A unique ID for the customer.
      public var id: ShopifyAPIKit.ID { __data["id"] }
      /// The customer’s phone number.
      public var phone: String? { __data["phone"] }
      /// The customer’s email address.
      public var email: String? { __data["email"] }
      /// The orders associated with the customer.
      public var orders: Orders { __data["orders"] }
      /// A list of addresses for the customer.
      public var addresses: Addresses { __data["addresses"] }
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
            .field("currencyCode", GraphQLEnum<ShopifyAPIKit.CurrencyCode>.self),
            .field("edited", Bool.self),
            .field("email", String?.self),
            .field("financialStatus", GraphQLEnum<ShopifyAPIKit.OrderFinancialStatus>?.self),
            .field("fulfillmentStatus", GraphQLEnum<ShopifyAPIKit.OrderFulfillmentStatus>.self),
            .field("id", ShopifyAPIKit.ID.self),
            .field("name", String.self),
            .field("orderNumber", Int.self),
            .field("processedAt", ShopifyAPIKit.DateTime.self),
            .field("statusUrl", ShopifyAPIKit.URL.self),
            .field("currentSubtotalPrice", CurrentSubtotalPrice.self),
            .field("currentTotalPrice", CurrentTotalPrice.self),
          ] }

          /// The code of the currency used for the payment.
          public var currencyCode: GraphQLEnum<ShopifyAPIKit.CurrencyCode> { __data["currencyCode"] }
          /// Whether the order has had any edits applied or not.
          public var edited: Bool { __data["edited"] }
          /// The customer's email address.
          public var email: String? { __data["email"] }
          /// The financial status of the order.
          public var financialStatus: GraphQLEnum<ShopifyAPIKit.OrderFinancialStatus>? { __data["financialStatus"] }
          /// The fulfillment status for the order.
          public var fulfillmentStatus: GraphQLEnum<ShopifyAPIKit.OrderFulfillmentStatus> { __data["fulfillmentStatus"] }
          /// A globally-unique ID.
          public var id: ShopifyAPIKit.ID { __data["id"] }
          /// Unique identifier for the order that appears on the order.
          /// For example, _#1000_ or _Store1001.
          public var name: String { __data["name"] }
          /// A unique numeric identifier for the order for use by shop owner and customer.
          public var orderNumber: Int { __data["orderNumber"] }
          /// The date and time when the order was imported.
          /// This value can be set to dates in the past when importing from other systems.
          /// If no value is provided, it will be auto-generated based on current date and time.
          public var processedAt: ShopifyAPIKit.DateTime { __data["processedAt"] }
          /// The unique URL for the order's status page.
          public var statusUrl: ShopifyAPIKit.URL { __data["statusUrl"] }
          /// The subtotal of line items and their discounts, excluding line items that have been removed. Does not contain order-level discounts, duties, shipping costs, or shipping discounts. Taxes aren't included unless the order is a taxes-included order.
          public var currentSubtotalPrice: CurrentSubtotalPrice { __data["currentSubtotalPrice"] }
          /// The total amount of the order, including duties, taxes and discounts, minus amounts for line items that have been removed.
          public var currentTotalPrice: CurrentTotalPrice { __data["currentTotalPrice"] }

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
            .field("city", String?.self),
            .field("country", String?.self),
            .field("countryCode", String?.self),
            .field("firstName", String?.self),
            .field("id", ShopifyAPIKit.ID.self),
            .field("lastName", String?.self),
            .field("latitude", Double?.self),
            .field("longitude", Double?.self),
            .field("name", String?.self),
            .field("phone", String?.self),
          ] }

          /// The first line of the address. Typically the street address or PO Box number.
          public var address1: String? { __data["address1"] }
          /// The name of the city, district, village, or town.
          public var city: String? { __data["city"] }
          /// The name of the country.
          public var country: String? { __data["country"] }
          /// The two-letter code for the country of the address.
          ///
          /// For example, US.
          @available(*, deprecated, message: "Use `countryCodeV2` instead.")
          public var countryCode: String? { __data["countryCode"] }
          /// The first name of the customer.
          public var firstName: String? { __data["firstName"] }
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
        }
      }
    }
  }
}
