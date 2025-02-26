//
//  FilterBar.swift
//  M-Commerce-App
//
//  Created by Usef on 10/02/2025.
//

import SwiftUI


struct FilterBar: View {
    @State private var selectedItem:Int = 0
    let filterItems:[String]
    var willFilter: (String) -> Void
    let unSelectedFilterColor = Color.white
    let selectedFilterColor = ThemeManager.darkPuble
    let unSelectedFilterTxtColor = Color.secondary
    let selectedFilterTxtColor = Color.white
    let paddingRadius:CGFloat = 8.0
    let shadowRadius:CGFloat = 5.0
    let cornerRadius:CGFloat = 15.0
    
    
    var body: some View {
        ScrollView (.horizontal, showsIndicators: false){
            HStack {
                ForEach(filterItems.indices, id: \.self) { itemIndex in
                    Button(action: {
                        if selectedItem != itemIndex {
                           selectedItem = itemIndex
                            willFilter(filterItems[itemIndex])
                            print(filterItems[itemIndex])
                        }
                    }, label: {
                        Text(filterItems[itemIndex])
                            .font(.headline)
                            .bold()
                            .foregroundStyle(selectedItem == itemIndex ?
                                             selectedFilterTxtColor : unSelectedFilterTxtColor)
                            .frame(minWidth: 100, idealWidth: 120, maxWidth: 160, minHeight: 40, idealHeight: 40, maxHeight: 40, alignment: .center)
                            .background(selectedItem == itemIndex ?
                                        selectedFilterColor : unSelectedFilterColor)
                            .cornerRadius(cornerRadius)
                            .shadow(radius: shadowRadius)
                    })
                }.padding([.leading, .trailing],5)
                    .padding([.top, .bottom],10)
            }
        }
    }
}

#Preview {
    FilterBar(filterItems: ["All","Men","Women","Kid","sales","children"], willFilter: {_ in
        print("any")
    })
}
