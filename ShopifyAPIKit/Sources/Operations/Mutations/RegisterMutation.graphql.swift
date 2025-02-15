// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class RegisterMutation: GraphQLMutation {
  public static let operationName: String = "Register"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation Register($firstName: String, $lastName: String, $email: String!, $phone: String, $password: String!, $acceptsMarketing: Boolean) { customerCreate( input: { firstName: $firstName lastName: $lastName email: $email phone: $phone password: $password acceptsMarketing: $acceptsMarketing } ) { __typename customer { __typename acceptsMarketing createdAt displayName email firstName id lastName numberOfOrders phone } userErrors { __typename field message } } }"#
    ))

  public var firstName: GraphQLNullable<String>
  public var lastName: GraphQLNullable<String>
  public var email: String
  public var phone: GraphQLNullable<String>
  public var password: String
  public var acceptsMarketing: GraphQLNullable<Bool>

  public init(
    firstName: GraphQLNullable<String>,
    lastName: GraphQLNullable<String>,
    email: String,
    phone: GraphQLNullable<String>,
    password: String,
    acceptsMarketing: GraphQLNullable<Bool>
  ) {
    self.firstName = firstName
    self.lastName = lastName
    self.email = email
    self.phone = phone
    self.password = password
    self.acceptsMarketing = acceptsMarketing
  }

  public var __variables: Variables? { [
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "phone": phone,
    "password": password,
    "acceptsMarketing": acceptsMarketing
  ] }

  public struct Data: ShopifyAPIKit.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("customerCreate", CustomerCreate?.self, arguments: ["input": [
        "firstName": .variable("firstName"),
        "lastName": .variable("lastName"),
        "email": .variable("email"),
        "phone": .variable("phone"),
        "password": .variable("password"),
        "acceptsMarketing": .variable("acceptsMarketing")
      ]]),
    ] }

    /// Creates a new customer.
    public var customerCreate: CustomerCreate? { __data["customerCreate"] }

    /// CustomerCreate
    ///
    /// Parent Type: `CustomerCreatePayload`
    public struct CustomerCreate: ShopifyAPIKit.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.CustomerCreatePayload }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("customer", Customer?.self),
        .field("userErrors", [UserError].self),
      ] }

      /// The created customer object.
      public var customer: Customer? { __data["customer"] }
      /// The list of errors that occurred from executing the mutation.
      @available(*, deprecated, message: "Use `customerUserErrors` instead.")
      public var userErrors: [UserError] { __data["userErrors"] }

      /// CustomerCreate.Customer
      ///
      /// Parent Type: `Customer`
      public struct Customer: ShopifyAPIKit.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.Customer }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("acceptsMarketing", Bool.self),
          .field("createdAt", ShopifyAPIKit.DateTime.self),
          .field("displayName", String.self),
          .field("email", String?.self),
          .field("firstName", String?.self),
          .field("id", ShopifyAPIKit.ID.self),
          .field("lastName", String?.self),
          .field("numberOfOrders", ShopifyAPIKit.UnsignedInt64.self),
          .field("phone", String?.self),
        ] }

        /// Indicates whether the customer has consented to be sent marketing material via email.
        public var acceptsMarketing: Bool { __data["acceptsMarketing"] }
        /// The date and time when the customer was created.
        public var createdAt: ShopifyAPIKit.DateTime { __data["createdAt"] }
        /// The customer’s name, email or phone number.
        public var displayName: String { __data["displayName"] }
        /// The customer’s email address.
        public var email: String? { __data["email"] }
        /// The customer’s first name.
        public var firstName: String? { __data["firstName"] }
        /// A unique ID for the customer.
        public var id: ShopifyAPIKit.ID { __data["id"] }
        /// The customer’s last name.
        public var lastName: String? { __data["lastName"] }
        /// The number of orders that the customer has made at the store in their lifetime.
        public var numberOfOrders: ShopifyAPIKit.UnsignedInt64 { __data["numberOfOrders"] }
        /// The customer’s phone number.
        public var phone: String? { __data["phone"] }
      }

      /// CustomerCreate.UserError
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
