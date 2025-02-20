//
//  OrderedProductCard.swift
//  M-Commerce-App
//
//  Created by Usef on 20/02/2025.
//

import SwiftUI

struct OrderedProductCard: View {
    var name: String
    var phone: String
    var email: String
    var address: String
    var orderNo: String
    var orderPrice: String
    var isMyOrder: Bool
    let detailsDest: AnyView
    let secondDest: AnyView
    let width: CGFloat = UIScreen.main.bounds.width / 4.3
    let height: CGFloat = 80

    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: 220)
                .foregroundStyle(.WILDID)
                .cornerRadius(20)
                .padding(.top, 5)
                .shadow(radius: 0.5)

            VStack {
                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        ImageAndTextView(img: "person.fill", txt: name)
                        ImageAndTextView(img: "phone.fill", txt: phone)
                        ImageAndTextView(img: "mail", txt: email)
                        ImageAndTextView(img: "mappin.and.ellipse", txt: address)
                        ImageAndTextView(img: "number.circle", txt: orderNo)
                        KeyAndValueSmall(key: "Total Price:", value: orderPrice)
                    }.frame(width: 230, height: 150)
                    VStack(alignment: .trailing) {
                        Rectangle()
                            .foregroundStyle(.clear)
                            .frame(width: 95, height: 30)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay(
                                ZStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(
                                            isMyOrder ? .blue : .green,
                                            lineWidth: 1.5)
                                    Text(isMyOrder ? "In Progress" : "Completed")
                                        .font(.system(size: 13))
                                        .foregroundStyle(
                                            isMyOrder ? .blue : .green)
                                }
                            )
                        let url = URL(string: "")
                        AsyncImage(url: url) { image in
                            image.resizable()
                                .scaledToFill()
                        } placeholder: {
                            ShimmerView(width: width, height: height)
                        }
                        .frame(width: width, height: height)
                        .cornerRadius(12)

                    }
                    .frame(height: 90)

                    Spacer()

                }
                .padding(.horizontal, 10)
                HStack(spacing: 20) {
                    CustomButtonWith(
                        color: .clear , borderColor: .secondary.opacity(0.3),
                        text: "Details", textColor: .BILWID,
                        destination: detailsDest)
                    CustomButtonWith(
                        color: ThemeManager.darkPuble, borderColor: .secondary.opacity(0.3),
                        text: isMyOrder ? "Tracking" : "Received Order", textColor: .white,
                        destination:isMyOrder ? detailsDest : secondDest)
                }
                .padding(7)
            }
            Spacer()
        }
        .padding(.horizontal)
    }
}

#Preview {
    OrderedProductCard(
        name: "John Doe",
        phone: "+201012345678",
        email: "john.doe@example.com",
        address: "123 Street, City, Country", orderNo: "1024", orderPrice: "1040 EGP",
        isMyOrder: true,
        detailsDest: AnyView(Text("Hello1")), secondDest: AnyView(Text("f"))
    )
}

struct ImageAndTextView: View {
    var img:String
    var txt:String
    var body: some View {
        HStack {
            Image(systemName: img)
            Text(txt)
                .font(.caption)
            Spacer()
        }
    }
}

struct KeyAndValueSmall: View {
    var key:String
    var value:String
    var body: some View {
        HStack {
            Text(key)
                .font(.caption)
                .frame(maxWidth: 70)
            Text(value)
                .font(.caption)
                .frame(maxWidth: 70)
            Spacer()
        }
    }
}
