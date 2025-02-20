// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

/// The input fields for an attribute.
public struct AttributeInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    key: String,
    value: String
  ) {
    __data = InputDict([
      "key": key,
      "value": value
    ])
  }

  /// Key or name of the attribute.
  public var key: String {
    get { __data["key"] }
    set { __data["key"] = newValue }
  }

  /// Value of the attribute.
  public var value: String {
    get { __data["value"] }
    set { __data["value"] = newValue }
  }
}
