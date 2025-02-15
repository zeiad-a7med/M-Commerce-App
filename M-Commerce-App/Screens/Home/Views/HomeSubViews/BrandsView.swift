//
//  BrandsView.swift
//  M-Commerce
//
//  Created by Usef on 09/02/2025.
//

import SwiftUI

struct BrandsView: View {
    var brandsDetails: [Collection]
    var reload: (() -> Void)
    let rows: [GridItem] = [
        GridItem(.flexible(minimum: 100, maximum: 200), spacing: 0, alignment: nil),
        GridItem(.flexible(minimum: 100, maximum: 200), spacing: 0, alignment: nil)
    ]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            LazyHGrid(rows: rows, content: {
                ForEach(brandsDetails, id: \.id, content: { brand in
                    if isValid(title: brand.title ?? ""){
                        NavigationLink(destination: {
                            Text("Products")
                        }, label: {
                            BrandCard(title: brand.title ?? "", imageUrl: brand.img?.url ?? "")
                                .onAppear {
                                    if brand.title ==  brandsDetails.last?.title {
                                        print("loading more!")
                                        reload()
                                    }
                                }
                        })
                    }
                })
            })
        }
    }
    func isValid(title: String) -> Bool {
        return (title.lowercased() != "men".lowercased()) && (title.lowercased() != "women".lowercased()) && (title.lowercased() != "kid".lowercased()) && (title.lowercased() != "sale".lowercased()) && (title.lowercased() != "home page".lowercased())
    }
}

#Preview {
    BrandsView(brandsDetails: [Collection(id: "1", title: "Brand 1"), Collection(id: "2", title: "Brand 2"), Collection(id: "3", title: "Brand 3"), Collection(id: "4", title: "Brand 4"), Collection(id: "5", title: "Brand 5"), Collection(id: "6", title: "Men"), Collection(id: "7", title: "Brand 6"), Collection(id: "8", title: "women")], reload: {
        print("reloading")
    } )
}
