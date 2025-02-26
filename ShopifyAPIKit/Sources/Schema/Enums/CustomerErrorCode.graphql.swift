// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

/// Possible error codes that can be returned by `CustomerUserError`.
public enum CustomerErrorCode: String, EnumType {
  /// The input value is blank.
  case blank = "BLANK"
  /// The input value is invalid.
  case invalid = "INVALID"
  /// The input value is already taken.
  case taken = "TAKEN"
  /// The input value is too long.
  case tooLong = "TOO_LONG"
  /// The input value is too short.
  case tooShort = "TOO_SHORT"
  /// Unidentified customer.
  case unidentifiedCustomer = "UNIDENTIFIED_CUSTOMER"
  /// Customer is disabled.
  case customerDisabled = "CUSTOMER_DISABLED"
  /// Input password starts or ends with whitespace.
  case passwordStartsOrEndsWithWhitespace = "PASSWORD_STARTS_OR_ENDS_WITH_WHITESPACE"
  /// Input contains HTML tags.
  case containsHtmlTags = "CONTAINS_HTML_TAGS"
  /// Input contains URL.
  case containsUrl = "CONTAINS_URL"
  /// Invalid activation token.
  case tokenInvalid = "TOKEN_INVALID"
  /// Customer already enabled.
  case alreadyEnabled = "ALREADY_ENABLED"
  /// Address does not exist.
  case notFound = "NOT_FOUND"
  /// Input email contains an invalid domain name.
  case badDomain = "BAD_DOMAIN"
  /// Multipass token is not valid.
  case invalidMultipassRequest = "INVALID_MULTIPASS_REQUEST"
}
