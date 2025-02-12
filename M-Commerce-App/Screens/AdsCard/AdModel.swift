//
//  AdModel.swift
//  AssetsForSwiftUIPorject
//
//  Created by Andrew Emad on 10/02/2025.
//

import Foundation


/// Dummy images fro the ui
struct ImageList : Identifiable{
    var id: String
    var images : [String]  = ["https://burst.shopifycdn.com/photos/childrens-clothing-in-funky-colors.jpg?width=4460&height=4460&exif=0&iptc=0","https://burst.shopifycdn.com/photos/browsing-clothing.jpg?width=4460&height=4460&exif=0&iptc=0","https://burst.shopifycdn.com/photos/bright-modern-mens-fashion.jpg?width=4460&height=4460&exif=0&iptc=0"]
 
    
}

/// discount code data model
struct DiscountCode : Hashable ,Identifiable{
   var id = 507328175
   var price_rule_id = 507328175
   var code = "SUMMERSALE10OFF"
   var usage_count = 0
   var created_at =
    "2025-01-02T11:29:59-05:00"
   var updated_at = "2025-01-02T11:29:59-05:00"
   
}
struct PriceRulesList : Identifiable{
    var id: String
   var  price_rules : [PriceRules] = [PriceRules(),PriceRules()]
}
struct PriceRules : Identifiable{
          var id = 507328175
          var value_type = "fixed_amount"
          var value = -10.0
          var customer_selection = "all"
          var target_type = "line_item"
          var target_selection = "all"
          var allocation_method = "across"
          var allocation_limit = "null"
          var once_per_customer = false
          var usage_limit = "null"
          var starts_at = "2024-12-27T11:09:43-05:00"
          var ends_at = "2025-01-08T11:09:43-05:00"
          var created_at = "2025-01-02T11:09:43-05:00"
          var updated_at = "2025-01-02T11:09:43-05:00"
          var title = "SUMMERSALE10OFF"
     
}
struct savedCoupon {
    var coupon : String
}
