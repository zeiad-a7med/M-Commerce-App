//
//  ShoppingView.swift
//  ShoppingCart
//
//  Created by Andrew Emad on 11/02/2025.
//

import SwiftUI

struct ShoppingView: View {
    @State var swipeDeleteFlag : Bool = false
    @State var confirmZeroItemDeleteFlag : Bool = false
    @State var cartItem : CartItem?
    @State var indexSet:IndexSet?
    @State var totalPrice : Double = 0.0
    @State var showCheckOut : Bool = false
    @StateObject var viewModel = ShoppingCartViewModel()
    var body: some View {
        List {
            ForEach((viewModel.CartResult?.itemList)!,id:\.self){ Item in
                LazyVStack {
                    RowCard(item: Item){number , sign in
                        if(number == 1 && !sign){
                           confirmZeroItemDeleteFlag = true
                           cartItem = Item
                        }else{
                            if let myIndex = self.viewModel.CartResult?.itemList!.firstIndex(of: cartItem!){
                                if sign{
                                    self.viewModel.CartResult?.itemList![myIndex].count! += 1
                                }else{
                                    self.viewModel.CartResult?.itemList![myIndex].count! -= 1
                                }
                            }
                         
                        }
                     
                       
                    }
                }
              
            }.onDelete { index in
                indexSet = index
                swipeDeleteFlag = true
            }.confirmationDialog("Do you really wish to remove your item from the cart?", isPresented: $swipeDeleteFlag) {
                Button("Delete" , role:.destructive){
                    viewModel.CartResult?.itemList?.remove(atOffsets: indexSet!)
                    swipeDeleteFlag = false
                  
                }
                Button("Cancel" , role:.cancel){
                    swipeDeleteFlag = false
                    
                }
               
               
            }//confirmation if Swipe
            .confirmationDialog("Do you really wish to remove your item from the cart?", isPresented: $confirmZeroItemDeleteFlag) {
                Button("Delete" , role:.destructive){
                    confirmZeroItemDeleteFlag=false
                    if let index = self.viewModel.CartResult?.itemList!.firstIndex(of: cartItem!) {
                        self.viewModel.CartResult?.itemList!.remove(at: index)
                   }
                }
                Button("Cancel" , role:.cancel){
                  
                    confirmZeroItemDeleteFlag=false
                }
            }//confiramtion if less than 1
        }.buttonStyle(.borderless)
        Button(action: {
            totalPrice = 0.0
            CalculateTotalPrice()
        
                showCheckOut.toggle()
            
                
        
        }
        , label: {
            Text("Proceed to checkout")
        }).foregroundStyle(.white)
            .frame(width: 300)
            .padding()
            .background(Color(#colorLiteral(red: 0.3154394925, green: 0.305562377, blue: 0.7188369632, alpha: 1)).clipShape(RoundedRectangle(cornerRadius: 25)))
            .sheet(isPresented: $showCheckOut, content: {
                CheckOutComponent(Total: String(totalPrice))
                    .presentationDetents([.medium])
            })
            
          
            
        
    }
    func CalculateTotalPrice(){
        for i in (viewModel.CartResult?.itemList)!{
            totalPrice += Double(i.count!) * i.price!
        }
        print(totalPrice)
    }
}

#Preview {
    ShoppingView()
}
