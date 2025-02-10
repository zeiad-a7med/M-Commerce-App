//
//  FilterBar.swift
//  M-Commerce-App
//
//  Created by Usef on 10/02/2025.
//

import SwiftUI


struct FilterBar: View {
    @State var selectedItem:String = "All"
    @State var previousSelectedFilter:String = ""
    
    let unSelectedFilterColor = Color("primaryWhite")
    let selectedFilterColor = Color("darkPurble")
    let unSelectedFilterTxtColor = Color("darkPurble")
    let selectedFilterTxtColor = Color("primaryWhite")
    let filterItems:[String] = ["All","Men","Women","Children"]
    
    let paddingRadius:CGFloat = 8.0
    let shadowRadius:CGFloat = 5.0
    let cornerRadius:CGFloat = 10.0
    
    var body: some View {
        ScrollView (.horizontal){
            LazyHStack (alignment: .center){
                ForEach(filterItems, id: \.self) { itemIndex in
                    Button(action: {
                        previousSelectedFilter = selectedItem
                        selectedItem = itemIndex
                        if previousSelectedFilter != itemIndex {
                            //filter
                            print(itemIndex)
                        }
                    }, label: {
                        Text(itemIndex)
                            .font(.headline)
                            .bold()
                            .foregroundStyle(selectedItem == itemIndex ?
                                             selectedFilterTxtColor : unSelectedFilterTxtColor)
                            .padding(.leading,22)
                            .padding(.trailing,22)
                            .padding(.top,paddingRadius)
                            .padding(.bottom,paddingRadius)
                            .background(selectedItem == itemIndex ?
                                        selectedFilterColor : unSelectedFilterColor)
                            .cornerRadius(cornerRadius)
                            .shadow(radius: shadowRadius)
                            .padding(.top,paddingRadius)
                            .padding(.bottom,paddingRadius)
                    })

                }
            }.padding(.leading,paddingRadius)
        }
    }
}

#Preview {
    FilterBar()
}
