//
//  FlatFilterBar.swift
//  M-Commerce-App
//
//  Created by Usef on 14/02/2025.
//

import SwiftUI


struct FlatFilterBar: View {
    @State var selectedFilter: String = "All Products"
    var filterItems: [String] = ["All Products",
                                 "Sale",
                                 "Winter",
                                 "Spring",
                                 "Autumn",
                                 "Summer"]
    var filter: (String)->Void
    var body: some View {
        ScrollView (.horizontal, showsIndicators: false){
            LazyHStack (alignment: .center, spacing: 10) {
                ForEach(filterItems, id: \.self) { item in
                    Button(action: {
                        //filter
                        selectedFilter = item
                        filter(item)
                    }, label: {
                        FlatFilterButton(item: item
                        ,isSelected: (selectedFilter == item))
                    })
                }
            }.padding()
        }.frame(width: UIScreen.main.bounds.width, height: 40)
    }
}

#Preview {
    FlatFilterBar(filter: {res in
        print("Filter: \(res)")
    })
}


