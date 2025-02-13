//
//  ShoppingCartModel.swift
//  M-Commerce-App
//
//  Created by Andrew Emad on 13/02/2025.
//

import Foundation


class ShoppingCartViewModel : ObservableObject{
    @Published var CartResult : Cart?
    init(){
        getData()
    }
    func getData(){
        
        let tempItem = CartItem(count:1 ,image:"https://images.pexels.com/photos/19090/pexels-photo.jpg?auto=compress&cs=tinysrgb&w=400" ,price:35.0 ,name: "Adidas Sneakers")
        let tempItem1 = CartItem(count:1 ,image:"https://images.pexels.com/photos/1598508/pexels-photo-1598508.jpeg?auto=compress&cs=tinysrgb&w=400" ,price:60 ,name: "puma Sneakers")
        let tempItem2 = CartItem(count:1 ,image:"https://images.pexels.com/photos/267301/pexels-photo-267301.jpeg?auto=compress&cs=tinysrgb&w=400" ,price:100 ,name: "TimberLand Sneakers")
        let tempItem3 = CartItem(count:1 ,image:"https://images.pexels.com/photos/1240892/pexels-photo-1240892.jpeg?auto=compress&cs=tinysrgb&w=400" ,price:10 ,name: "Active Sneakers")
        CartResult = Cart(itemList: [tempItem,tempItem1,tempItem2,tempItem3])
   
        
    }
}
