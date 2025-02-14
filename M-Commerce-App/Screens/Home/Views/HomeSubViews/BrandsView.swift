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
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            LazyHStack(alignment: .center, spacing: 0){
                ForEach(Array(stride(from: 1, to: brandsDetails.count, by: 2)), id: \.self) { index in
                    LazyVStack(spacing: 0){
                        BrandCard(title: brandsDetails[index].title ?? "", imageUrl: brandsDetails[index].img?.url ?? "")
                            .onAppear {
                                if index + 2 ==  brandsDetails.count {
//                                    viewModelTest.loadMore()
                                    print("loading more!")
                                    reload()
                                }
                            }
                        if index + 1 < brandsDetails.count{
                            BrandCard(title: brandsDetails[index + 1].title ?? "", imageUrl: brandsDetails[index + 1].img?.url ?? "")
                        }else{
                            BrandCard(title: brandsDetails[index].title ?? "", imageUrl: brandsDetails[index].img?.url ?? "").hidden()
                        }
                    }
                }
            }.padding(.leading, 21)
                .padding(.trailing, 20)
                .padding(.top, 0)
        }
    }
}

//#Preview {
//    return BrandsView(brandsDetails: )
//}
