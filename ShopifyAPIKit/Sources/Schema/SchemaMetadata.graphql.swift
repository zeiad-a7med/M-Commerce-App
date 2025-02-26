// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public protocol SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == ShopifyAPIKit.SchemaMetadata {}

public protocol InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == ShopifyAPIKit.SchemaMetadata {}

public protocol MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == ShopifyAPIKit.SchemaMetadata {}

public protocol MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == ShopifyAPIKit.SchemaMetadata {}

public enum SchemaMetadata: ApolloAPI.SchemaMetadata {
  public static let configuration: any ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

  public static func objectType(forTypename typename: String) -> ApolloAPI.Object? {
    switch typename {
    case "AppliedGiftCard": return ShopifyAPIKit.Objects.AppliedGiftCard
    case "Article": return ShopifyAPIKit.Objects.Article
    case "BaseCartLineConnection": return ShopifyAPIKit.Objects.BaseCartLineConnection
    case "Blog": return ShopifyAPIKit.Objects.Blog
    case "Cart": return ShopifyAPIKit.Objects.Cart
    case "CartCost": return ShopifyAPIKit.Objects.CartCost
    case "CartCreatePayload": return ShopifyAPIKit.Objects.CartCreatePayload
    case "CartLine": return ShopifyAPIKit.Objects.CartLine
    case "CartLineCost": return ShopifyAPIKit.Objects.CartLineCost
    case "CartLinesAddPayload": return ShopifyAPIKit.Objects.CartLinesAddPayload
    case "CartLinesRemovePayload": return ShopifyAPIKit.Objects.CartLinesRemovePayload
    case "CartLinesUpdatePayload": return ShopifyAPIKit.Objects.CartLinesUpdatePayload
    case "CartUserError": return ShopifyAPIKit.Objects.CartUserError
    case "Collection": return ShopifyAPIKit.Objects.Collection
    case "CollectionConnection": return ShopifyAPIKit.Objects.CollectionConnection
    case "Comment": return ShopifyAPIKit.Objects.Comment
    case "Company": return ShopifyAPIKit.Objects.Company
    case "CompanyContact": return ShopifyAPIKit.Objects.CompanyContact
    case "CompanyLocation": return ShopifyAPIKit.Objects.CompanyLocation
    case "ComponentizableCartLine": return ShopifyAPIKit.Objects.ComponentizableCartLine
    case "Count": return ShopifyAPIKit.Objects.Count
    case "Customer": return ShopifyAPIKit.Objects.Customer
    case "CustomerAccessToken": return ShopifyAPIKit.Objects.CustomerAccessToken
    case "CustomerAccessTokenCreatePayload": return ShopifyAPIKit.Objects.CustomerAccessTokenCreatePayload
    case "CustomerAccessTokenDeletePayload": return ShopifyAPIKit.Objects.CustomerAccessTokenDeletePayload
    case "CustomerAddressCreatePayload": return ShopifyAPIKit.Objects.CustomerAddressCreatePayload
    case "CustomerAddressDeletePayload": return ShopifyAPIKit.Objects.CustomerAddressDeletePayload
    case "CustomerAddressUpdatePayload": return ShopifyAPIKit.Objects.CustomerAddressUpdatePayload
    case "CustomerCreatePayload": return ShopifyAPIKit.Objects.CustomerCreatePayload
    case "CustomerDefaultAddressUpdatePayload": return ShopifyAPIKit.Objects.CustomerDefaultAddressUpdatePayload
    case "CustomerUpdatePayload": return ShopifyAPIKit.Objects.CustomerUpdatePayload
    case "CustomerUserError": return ShopifyAPIKit.Objects.CustomerUserError
    case "ExternalVideo": return ShopifyAPIKit.Objects.ExternalVideo
    case "Filter": return ShopifyAPIKit.Objects.Filter
    case "FilterValue": return ShopifyAPIKit.Objects.FilterValue
    case "GenericFile": return ShopifyAPIKit.Objects.GenericFile
    case "Image": return ShopifyAPIKit.Objects.Image
    case "ImageConnection": return ShopifyAPIKit.Objects.ImageConnection
    case "Location": return ShopifyAPIKit.Objects.Location
    case "MailingAddress": return ShopifyAPIKit.Objects.MailingAddress
    case "MailingAddressConnection": return ShopifyAPIKit.Objects.MailingAddressConnection
    case "Market": return ShopifyAPIKit.Objects.Market
    case "MediaImage": return ShopifyAPIKit.Objects.MediaImage
    case "MediaPresentation": return ShopifyAPIKit.Objects.MediaPresentation
    case "Menu": return ShopifyAPIKit.Objects.Menu
    case "MenuItem": return ShopifyAPIKit.Objects.MenuItem
    case "Metafield": return ShopifyAPIKit.Objects.Metafield
    case "MetafieldDeleteUserError": return ShopifyAPIKit.Objects.MetafieldDeleteUserError
    case "MetafieldsSetUserError": return ShopifyAPIKit.Objects.MetafieldsSetUserError
    case "Metaobject": return ShopifyAPIKit.Objects.Metaobject
    case "Model3d": return ShopifyAPIKit.Objects.Model3d
    case "MoneyV2": return ShopifyAPIKit.Objects.MoneyV2
    case "Mutation": return ShopifyAPIKit.Objects.Mutation
    case "Order": return ShopifyAPIKit.Objects.Order
    case "OrderConnection": return ShopifyAPIKit.Objects.OrderConnection
    case "OrderLineItem": return ShopifyAPIKit.Objects.OrderLineItem
    case "OrderLineItemConnection": return ShopifyAPIKit.Objects.OrderLineItemConnection
    case "Page": return ShopifyAPIKit.Objects.Page
    case "PageInfo": return ShopifyAPIKit.Objects.PageInfo
    case "Product": return ShopifyAPIKit.Objects.Product
    case "ProductConnection": return ShopifyAPIKit.Objects.ProductConnection
    case "ProductOption": return ShopifyAPIKit.Objects.ProductOption
    case "ProductOptionValue": return ShopifyAPIKit.Objects.ProductOptionValue
    case "ProductPriceRange": return ShopifyAPIKit.Objects.ProductPriceRange
    case "ProductVariant": return ShopifyAPIKit.Objects.ProductVariant
    case "ProductVariantConnection": return ShopifyAPIKit.Objects.ProductVariantConnection
    case "QuantityRule": return ShopifyAPIKit.Objects.QuantityRule
    case "QueryRoot": return ShopifyAPIKit.Objects.QueryRoot
    case "SearchQuerySuggestion": return ShopifyAPIKit.Objects.SearchQuerySuggestion
    case "SearchResultItemConnection": return ShopifyAPIKit.Objects.SearchResultItemConnection
    case "SellingPlan": return ShopifyAPIKit.Objects.SellingPlan
    case "Shop": return ShopifyAPIKit.Objects.Shop
    case "ShopPayInstallmentsFinancingPlan": return ShopifyAPIKit.Objects.ShopPayInstallmentsFinancingPlan
    case "ShopPayInstallmentsFinancingPlanTerm": return ShopifyAPIKit.Objects.ShopPayInstallmentsFinancingPlanTerm
    case "ShopPayInstallmentsProductVariantPricing": return ShopifyAPIKit.Objects.ShopPayInstallmentsProductVariantPricing
    case "ShopPolicy": return ShopifyAPIKit.Objects.ShopPolicy
    case "StringConnection": return ShopifyAPIKit.Objects.StringConnection
    case "TaxonomyCategory": return ShopifyAPIKit.Objects.TaxonomyCategory
    case "UrlRedirect": return ShopifyAPIKit.Objects.UrlRedirect
    case "UserError": return ShopifyAPIKit.Objects.UserError
    case "UserErrorsShopPayPaymentRequestSessionUserErrors": return ShopifyAPIKit.Objects.UserErrorsShopPayPaymentRequestSessionUserErrors
    case "Video": return ShopifyAPIKit.Objects.Video
    default: return nil
    }
  }
}

public enum Objects {}
public enum Interfaces {}
public enum Unions {}
