//
//  ShoppingView.swift
//  ShoppingCart
//
//  Created by Andrew Emad on 11/02/2025.
//

import SwiftUI

struct ShoppingView: View {
    @State var swipeDeleteFlag: Bool = false
    @State var confirmZeroItemDeleteFlag: Bool = false
//    @State var cartItem: CartItem?
    @State var indexSet: IndexSet?
    @State var totalPrice: Double = 0.0
    @State var showCheckOut: Bool = false
    @State var isLoggedIn: Bool = false
    @State var currentDeletion: Line?
    @StateObject var viewModel = ShoppingCartViewModel()
    var body: some View {
        VStack {
            if(isLoggedIn){
                List {
                    if let tempViewModel = viewModel.cartResult?.cart?.lines {
                        ForEach(Array(
                            (tempViewModel)
                                .enumerated()), id: \.offset) { line in
                                    RowCard(line:line.element) { count in
                                    if(count == 0){
                                        confirmZeroItemDeleteFlag = true
                                        currentDeletion = line.element
                                    }
                            }

                        }.onDelete { index in
                            indexSet = index
                            swipeDeleteFlag = true
                        }.confirmationDialog(
                            "Do you really wish to remove your item from the cart?",
                            isPresented: $swipeDeleteFlag
                        ) {
                            Button("Delete", role: .destructive) {
//                                viewModel.CartResult?.itemList?.remove(
//                                    atOffsets: indexSet!)
//                                swipeDeleteFlag = false

                            }
                            Button("Cancel", role: .cancel) {
                                swipeDeleteFlag = false

                            }

                        }  //confirmation if Swipe
                        .confirmationDialog(
                            "Do you really wish to remove your item from the cart?",
                            isPresented: $confirmZeroItemDeleteFlag
                        ) {
                            Button("Delete", role: .destructive) {
//                                confirmZeroItemDeleteFlag = false
//                                if let index = self.viewModel.CartResult?.itemList!
//                                    .firstIndex(of: cartItem!)
//                                {
//                                    self.viewModel.CartResult?.itemList!.remove(
//                                        at: index)
//                                }
                            }
                            Button("Cancel", role: .cancel) {

                                confirmZeroItemDeleteFlag = false
                                viewModel.updateLine(line: currentDeletion!)
                                currentDeletion = nil
                            }
                        }  //confiramtion if less than 1
                    }

                }.buttonStyle(.borderless)

                CustomRoundedButtonView(
                    text: "Proceed to checkout",
                    width: 60,
                    onTap: {
                        totalPrice = 0.0
                        CalculateTotalPrice()
                        showCheckOut.toggle()
                    }, isButtonEnabled: .constant(true)
                )
                .sheet(
                    isPresented: $showCheckOut,
                    content: {
                        CheckOutComponent(totalPrice: $totalPrice)
                            .presentationDetents([.medium])
                    })
            }else{
                VStack {
                    ContentUnavailableView(
                        "You are not logged in", systemImage: "person.slash",
                        description: Text(
                            "to view your favorites please sign in")
                    ).frame(height: 300)
                    NavigationLink(destination: LoginView()) {
                        CustomRoundedButtonView(
                            text: "Sign In",
                            width: 100,
                            onTap: {},
                            isButtonEnabled: .constant(true)
                        )
                        .allowsHitTesting(false)
                    }
                }
            }
            
        }.onAppear {
            isLoggedIn = AuthManager.shared.isLoggedIn()
        }

        
        

    }
    func CalculateTotalPrice() {
//        for i in (viewModel.CartResult?.itemList)! {
//            totalPrice += Double(i.count!) * i.price!
//        }
//        print(totalPrice)
    }

}

#Preview {
    ShoppingView()
}
