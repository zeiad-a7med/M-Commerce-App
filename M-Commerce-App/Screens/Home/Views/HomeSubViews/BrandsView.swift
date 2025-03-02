//
//  BrandsView.swift
//  M-Commerce
//
//  Created by Usef on 09/02/2025.
//

import SwiftUI

struct BrandsView: View {
    @StateObject var bViewModel: BrandsViewModel = BrandsViewModel(first: 10, after: nil)
    let rows: [GridItem] = [
        GridItem(
            .flexible(minimum: 100, maximum: 200), spacing: 0, alignment: nil),
        GridItem(
            .flexible(minimum: 100, maximum: 200), spacing: 0, alignment: nil),
    ]
    var body: some View {
        LazyVGrid(
            columns: rows,
            content: {
                ForEach(
                    bViewModel.brands.collections ?? [], id: \.id,
                    content: { brand in
                        Button(action:{
                            NavigationManager.shared.push(.brand(title: brand.title ?? ""))
                        },label: {
                            BrandCard(
                                title: brand.title ?? "",
                                imageUrl: brand.img?.url ?? ""
                            )
                            .onAppear {
                                print("s")

                                if brand.title ?? "" == bViewModel.brands
                                    .collections?.last?.title ?? ""
                                {
                                    bViewModel.loadMore()
                                }
                            }
                        })
                    })
            })
    }
}

#Preview {
    //    BrandsView(brandsDetails: [Collection(id: "1", title: "Brand 1"), Collection(id: "2", title: "Brand 2"), Collection(id: "3", title: "Brand 3"), Collection(id: "4", title: "Brand 4"), Collection(id: "5", title: "Brand 5"), Collection(id: "6", title: "Men"), Collection(id: "7", title: "Brand 6"), Collection(id: "8", title: "women")], reload: {
    //        print("reloading")
    //    } )
}
