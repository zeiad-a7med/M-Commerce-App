// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public protocol SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == ShopifyAPI.SchemaMetadata {}

public protocol InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == ShopifyAPI.SchemaMetadata {}

public protocol MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == ShopifyAPI.SchemaMetadata {}

public protocol MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == ShopifyAPI.SchemaMetadata {}

public enum SchemaMetadata: ApolloAPI.SchemaMetadata {
  public static let configuration: any ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

  public static func objectType(forTypename typename: String) -> ApolloAPI.Object? {
    switch typename {
    case "AppliedGiftCard": return ShopifyAPI.Objects.AppliedGiftCard
    case "Article": return ShopifyAPI.Objects.Article
    case "Blog": return ShopifyAPI.Objects.Blog
    case "Cart": return ShopifyAPI.Objects.Cart
    case "CartLine": return ShopifyAPI.Objects.CartLine
    case "Collection": return ShopifyAPI.Objects.Collection
    case "Comment": return ShopifyAPI.Objects.Comment
    case "Company": return ShopifyAPI.Objects.Company
    case "CompanyContact": return ShopifyAPI.Objects.CompanyContact
    case "CompanyLocation": return ShopifyAPI.Objects.CompanyLocation
    case "ComponentizableCartLine": return ShopifyAPI.Objects.ComponentizableCartLine
    case "Customer": return ShopifyAPI.Objects.Customer
    case "ExternalVideo": return ShopifyAPI.Objects.ExternalVideo
    case "GenericFile": return ShopifyAPI.Objects.GenericFile
    case "Image": return ShopifyAPI.Objects.Image
    case "ImageConnection": return ShopifyAPI.Objects.ImageConnection
    case "ImageEdge": return ShopifyAPI.Objects.ImageEdge
    case "Location": return ShopifyAPI.Objects.Location
    case "MailingAddress": return ShopifyAPI.Objects.MailingAddress
    case "Market": return ShopifyAPI.Objects.Market
    case "MediaImage": return ShopifyAPI.Objects.MediaImage
    case "MediaPresentation": return ShopifyAPI.Objects.MediaPresentation
    case "Menu": return ShopifyAPI.Objects.Menu
    case "MenuItem": return ShopifyAPI.Objects.MenuItem
    case "Metafield": return ShopifyAPI.Objects.Metafield
    case "Metaobject": return ShopifyAPI.Objects.Metaobject
    case "Model3d": return ShopifyAPI.Objects.Model3d
    case "Order": return ShopifyAPI.Objects.Order
    case "Page": return ShopifyAPI.Objects.Page
    case "Product": return ShopifyAPI.Objects.Product
    case "ProductConnection": return ShopifyAPI.Objects.ProductConnection
    case "ProductEdge": return ShopifyAPI.Objects.ProductEdge
    case "ProductOption": return ShopifyAPI.Objects.ProductOption
    case "ProductOptionValue": return ShopifyAPI.Objects.ProductOptionValue
    case "ProductVariant": return ShopifyAPI.Objects.ProductVariant
    case "QueryRoot": return ShopifyAPI.Objects.QueryRoot
    case "SearchQuerySuggestion": return ShopifyAPI.Objects.SearchQuerySuggestion
    case "SellingPlan": return ShopifyAPI.Objects.SellingPlan
    case "Shop": return ShopifyAPI.Objects.Shop
    case "ShopPayInstallmentsFinancingPlan": return ShopifyAPI.Objects.ShopPayInstallmentsFinancingPlan
    case "ShopPayInstallmentsFinancingPlanTerm": return ShopifyAPI.Objects.ShopPayInstallmentsFinancingPlanTerm
    case "ShopPayInstallmentsProductVariantPricing": return ShopifyAPI.Objects.ShopPayInstallmentsProductVariantPricing
    case "ShopPolicy": return ShopifyAPI.Objects.ShopPolicy
    case "TaxonomyCategory": return ShopifyAPI.Objects.TaxonomyCategory
    case "UrlRedirect": return ShopifyAPI.Objects.UrlRedirect
    case "Video": return ShopifyAPI.Objects.Video
    default: return nil
    }
  }
}

public enum Objects {}
public enum Interfaces {}
public enum Unions {}
