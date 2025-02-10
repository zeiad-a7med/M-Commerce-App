//
//  CategorieView.swift
//  M-Commerce-App
//
//  Created by Usef on 10/02/2025.
//

import SwiftUI

struct CategorieView: View {
    @State var isSelectedPopup: Bool = false
    var body: some View {
        NavigationView {
            ZStack (alignment: .bottomTrailing){
                ScrollView {
                    LazyVStack {
                        CustomSearchBarView(placeholder: "search for a product...", onChange: {text in
                            print(text)
                        }).padding(10)
                        
                        FilterBar()
                        
                        ProductsSubView()
                    }
                }
                
                HStack {
                    Spacer()
                        ZStack {
                            Button(action: {
                                
                            }, label: {
                                FloatingButtonView(color: .gray, inconName: "hat.cap")
                            }).offset(y:isSelectedPopup ? -270.0 : 0.0)
                            Button(action: {
                                
                            }, label: {
                                FloatingButtonView(color: .gray, inconName: "tshirt")
                            }).offset(y:isSelectedPopup ? -180.0 : 0.0)
                            Button(action: {
                               
                            }, label: {
                                FloatingButtonView(color: .gray, inconName: "shoe")
                            }).offset(y:isSelectedPopup ? -90.0 : 0.0)
                            
                            Button(action: {
                                withAnimation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0)) {
                                    isSelectedPopup.toggle()
                                }
                            }, label: {
                                FloatingButtonView(color: .darkPurble, inconName: "plus")
                            })
                        }
                        
                }
                
            }
            .navigationTitle("Categories")
            .toolbar {  //start of: toolbar
                ToolbarItem(
                    placement: .topBarTrailing,
                    content: {
                        LazyHStack {
                            NavigationLink(destination: Text("cart")
                                .font(.title)
                                           , label: {
                            ButtonView(
                                imageSystemName: ThemeManager.cartImg,
                                itemCounter: 10)
                        })
                            NavigationLink(destination: Text("favorites")
                                .font(.title)
                                           , label: {
                            ButtonView(
                                imageSystemName: ThemeManager.favouriteImg,
                                itemCounter: 2)
                            })
                        }
                    })
            }//End of: toolbar
        }
    }
}

#Preview {
    CategorieView()
}

struct FloatingButtonView: View {
    var color: Color
    var inconName: String
    var body: some View {
        ZStack{
            Circle()
                .fill(color)
                .frame(width: 60, height: 60)
                .shadow(radius: 8)
                .padding(12)
            Image(systemName: inconName)
                .font(.system(size: 30))
                .foregroundStyle(.white)
        }
    }
}
