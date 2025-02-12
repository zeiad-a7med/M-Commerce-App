// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

/// The type of data that the filter group represents.
///
/// For more information, refer to [Filter products in a collection with the Storefront API]
/// (https://shopify.dev/custom-storefronts/products-collections/filter-products).
public enum FilterType: String, EnumType {
  /// A list of selectable values.
  case list = "LIST"
  /// A range of prices.
  case priceRange = "PRICE_RANGE"
  /// A boolean value.
  case boolean = "BOOLEAN"
}
