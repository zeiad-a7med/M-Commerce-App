//
//  RowCard.swift
//  ShoppingCart
//
//  Created by Andrew Emad on 11/02/2025.
//

import SwiftUI

struct RowCard: View {
    @State var line: Line?
    @State var changeNumberOfItemInRow: ((Int) -> (Void))?
    @State var onDelete: ((Bool) -> (Void))?
    var minimumNumberOfItems: Int = 1
    @State var numberOfItems: Int = 0

    var body: some View {
        VStack {
            ZStack {
                imageCard(img: line?.variant?.image?.url ?? "")
                    .overlay(alignment: .bottomLeading) {
                        NumberOfItems(
                            numberOfItem: $numberOfItems,
                            max: line?.variant?.quantityAvailable
                        ) { count in
                            if(count<minimumNumberOfItems){
                                onDelete?(true)
                                numberOfItems = 1
                            }else{
                                changeNumberOfItemInRow?(count)
                            }
                           
                        }
                        .padding(.leading, 50)
                        .padding(.bottom, 20)
                    }
                    .overlay(alignment: .topTrailing) {
                        Button(
                            action: {
                                onDelete?(true)
                            },
                            label: {

                                Circle().fill(
                                    Color(
                                        #colorLiteral(
                                            red: 0.9529411197,
                                            green: 0.9529412389,
                                            blue: 0.9529412389, alpha: 1))
                                )
                                .frame(width: 35)
                                .overlay {
                                    Image(systemName: "trash")
                                        .font(.system(size: 15))
                                        .foregroundStyle(.red)
                                }

                                .padding(.trailing, 20)
                                .padding(.top, 10)
                            })

                    }
                    .shadow(radius: 10)
                //DeleteButton().offset(x:140,y:-33)
            }
            HStack {
                VStack(alignment: .leading) {
                    Text(line?.variant?.productTitle ?? "")
                        .font(.headline)
                        .padding(.leading)
                        .lineLimit(2)
                    Text("\(line?.variant?.productVendor ?? "")")
                        .font(.subheadline)
                        .italic(true)
                        .padding(.leading)
                        .foregroundStyle(.secondary)
                        .font(.subheadline)
                    Text("variant: \(line?.variant?.title ?? "")")
                        .font(.title3)
                        .padding(.leading)
                        .foregroundStyle(.secondary)
                        .font(.subheadline)

                }
                Spacer()
                Text(
                    "\(line?.lineCost?.totalAmount?.currencyCode ?? "") \(line?.lineCost?.totalAmount?.amount ?? "")"
                )
                .padding(.trailing)
                .font(.title2)
            }

        }
        .onAppear {
            numberOfItems = line?.quantity ?? 0
        }
    }

}

#Preview {
    let productVariant = ProductVariant(
        id: "gid://shopify/ProductVariant/52383522586995",

        title: "s / blue",
        image: ImgModel(
            url:
                "https://burst.shopifycdn.com/photos/black-sneakers-with-white-sole.jpg?width=4460&height=4460&exif=0&iptc=0"
        ),
        quantityAvailable: 10,
        sku: "NK-01-s-blue",
        price: Price(amount: "40", currencyCode: "EGP"),
        productId: "gid://shopify/Product/15046227886451",
        productTitle: "NIKE | CRACKLE PRINT TB TEE",
        productVendor: "NIKE"
    )
    RowCard(
        line: Line(
            id:
                "gid://shopify/CartLine/95cb6a84-c888-4042-b693-ad66de2d729f?cart=Z2NwLWV1cm9wZS13ZXN0MTowMUpNTUNCVjlGRktONzExTjE2TVdINjQ0UQ",
            variant: productVariant,
            quantity: 2,
            lineCost: LineCost(
                totalAmount: Price(amount: "80", currencyCode: "EGP"),
                subtotalAmount: Price(amount: "80", currencyCode: "EGP"),
                amountPerQuantity: Price(amount: "40", currencyCode: "EGP")
            )
        )
    )
}
