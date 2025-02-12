// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetCollectionsQuery: GraphQLQuery {
  public static let operationName: String = "GetCollections"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GetCollections($first: Int, $after: String) { collections(first: $first, after: $after) { __typename totalCount nodes { __typename description descriptionHtml handle id onlineStoreUrl title trackingParameters updatedAt image { __typename altText height originalSrc src transformedSrc url width id } } pageInfo { __typename endCursor hasNextPage hasPreviousPage startCursor } } }"#
    ))

  public var first: GraphQLNullable<Int>
  public var after: GraphQLNullable<String>

  public init(
    first: GraphQLNullable<Int>,
    after: GraphQLNullable<String>
  ) {
    self.first = first
    self.after = after
  }

  public var __variables: Variables? { [
    "first": first,
    "after": after
  ] }

  public struct Data: ShopifyAPIKit.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.QueryRoot }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("collections", Collections.self, arguments: [
        "first": .variable("first"),
        "after": .variable("after")
      ]),
    ] }

    /// List of the shop’s collections.
    public var collections: Collections { __data["collections"] }

    /// Collections
    ///
    /// Parent Type: `CollectionConnection`
    public struct Collections: ShopifyAPIKit.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.CollectionConnection }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("totalCount", ShopifyAPIKit.UnsignedInt64.self),
        .field("nodes", [Node].self),
        .field("pageInfo", PageInfo.self),
      ] }

      /// The total count of Collections.
      public var totalCount: ShopifyAPIKit.UnsignedInt64 { __data["totalCount"] }
      /// A list of the nodes contained in CollectionEdge.
      public var nodes: [Node] { __data["nodes"] }
      /// Information to aid in pagination.
      public var pageInfo: PageInfo { __data["pageInfo"] }

      /// Collections.Node
      ///
      /// Parent Type: `Collection`
      public struct Node: ShopifyAPIKit.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.Collection }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("description", String.self),
          .field("descriptionHtml", ShopifyAPIKit.HTML.self),
          .field("handle", String.self),
          .field("id", ShopifyAPIKit.ID.self),
          .field("onlineStoreUrl", ShopifyAPIKit.URL?.self),
          .field("title", String.self),
          .field("trackingParameters", String?.self),
          .field("updatedAt", ShopifyAPIKit.DateTime.self),
          .field("image", Image?.self),
        ] }

        /// Stripped description of the collection, single line with HTML tags removed.
        public var description: String { __data["description"] }
        /// The description of the collection, complete with HTML formatting.
        public var descriptionHtml: ShopifyAPIKit.HTML { __data["descriptionHtml"] }
        /// A human-friendly unique string for the collection automatically generated from its title.
        /// Limit of 255 characters.
        public var handle: String { __data["handle"] }
        /// A globally-unique ID.
        public var id: ShopifyAPIKit.ID { __data["id"] }
        /// The URL used for viewing the resource on the shop's Online Store. Returns `null` if the resource is currently not published to the Online Store sales channel.
        public var onlineStoreUrl: ShopifyAPIKit.URL? { __data["onlineStoreUrl"] }
        /// The collection’s name. Limit of 255 characters.
        public var title: String { __data["title"] }
        /// URL parameters to be added to a page URL to track the origin of on-site search traffic for [analytics reporting](https://help.shopify.com/manual/reports-and-analytics/shopify-reports/report-types/default-reports/behaviour-reports). Returns a result when accessed through the [search](https://shopify.dev/docs/api/storefront/current/queries/search) or [predictiveSearch](https://shopify.dev/docs/api/storefront/current/queries/predictiveSearch) queries, otherwise returns null.
        public var trackingParameters: String? { __data["trackingParameters"] }
        /// The date and time when the collection was last modified.
        public var updatedAt: ShopifyAPIKit.DateTime { __data["updatedAt"] }
        /// Image associated with the collection.
        public var image: Image? { __data["image"] }

        /// Collections.Node.Image
        ///
        /// Parent Type: `Image`
        public struct Image: ShopifyAPIKit.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.Image }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("altText", String?.self),
            .field("height", Int?.self),
            .field("originalSrc", ShopifyAPIKit.URL.self),
            .field("src", ShopifyAPIKit.URL.self),
            .field("transformedSrc", ShopifyAPIKit.URL.self),
            .field("url", ShopifyAPIKit.URL.self),
            .field("width", Int?.self),
            .field("id", ShopifyAPIKit.ID?.self),
          ] }

          /// A word or phrase to share the nature or contents of an image.
          public var altText: String? { __data["altText"] }
          /// The original height of the image in pixels. Returns `null` if the image isn't hosted by Shopify.
          public var height: Int? { __data["height"] }
          /// The location of the original image as a URL.
          ///
          /// If there are any existing transformations in the original source URL, they will remain and not be stripped.
          @available(*, deprecated, message: "Use `url` instead.")
          public var originalSrc: ShopifyAPIKit.URL { __data["originalSrc"] }
          /// The location of the image as a URL.
          @available(*, deprecated, message: "Use `url` instead.")
          public var src: ShopifyAPIKit.URL { __data["src"] }
          /// The location of the transformed image as a URL.
          ///
          /// All transformation arguments are considered "best-effort". If they can be applied to an image, they will be.
          /// Otherwise any transformations which an image type doesn't support will be ignored.
          @available(*, deprecated, message: "Use `url(transform:)` instead")
          public var transformedSrc: ShopifyAPIKit.URL { __data["transformedSrc"] }
          /// The location of the image as a URL.
          ///
          /// If no transform options are specified, then the original image will be preserved including any pre-applied transforms.
          ///
          /// All transformation options are considered "best-effort". Any transformation that the original image type doesn't support will be ignored.
          ///
          /// If you need multiple variations of the same image, then you can use [GraphQL aliases](https://graphql.org/learn/queries/#aliases).
          public var url: ShopifyAPIKit.URL { __data["url"] }
          /// The original width of the image in pixels. Returns `null` if the image isn't hosted by Shopify.
          public var width: Int? { __data["width"] }
          /// A unique ID for the image.
          public var id: ShopifyAPIKit.ID? { __data["id"] }
        }
      }

      /// Collections.PageInfo
      ///
      /// Parent Type: `PageInfo`
      public struct PageInfo: ShopifyAPIKit.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { ShopifyAPIKit.Objects.PageInfo }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("endCursor", String?.self),
          .field("hasNextPage", Bool.self),
          .field("hasPreviousPage", Bool.self),
          .field("startCursor", String?.self),
        ] }

        /// The cursor corresponding to the last node in edges.
        public var endCursor: String? { __data["endCursor"] }
        /// Whether there are more pages to fetch following the current page.
        public var hasNextPage: Bool { __data["hasNextPage"] }
        /// Whether there are any pages prior to the current page.
        public var hasPreviousPage: Bool { __data["hasPreviousPage"] }
        /// The cursor corresponding to the first node in edges.
        public var startCursor: String? { __data["startCursor"] }
      }
    }
  }
}
