//
//  File.swift
//  M-Commerce-App
//
//  Created by Andrew Emad on 13/02/2025.
//

import Foundation


struct Cart {
    var itemList : [CartItem]?
}
struct CartItem : Identifiable,Hashable{
    var id = UUID()
    var count : Int?
    var image : String?
    var price : Double?
    var name : String?
}
