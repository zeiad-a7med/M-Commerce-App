//
//  AdsComponentV2.swift
//  AssetsForSwiftUIPorject
//
//  Created by Andrew Emad on 10/02/2025.
//

import SwiftUI

struct AdCardView: View {
    var copyToClipboard : (() -> Void)?
    var adViewModel = AdViewModel()
    @State var isCopied = false
    var body: some View {

        ScrollView(.horizontal, showsIndicators: false) {
            VStack {
                LazyHStack {
                    ForEach(Array(Constants.coupons), id: \.self) {
                        coupon in

                        AsyncImage(url: URL(string: coupon.image)) {
                            phase in
                            switch phase {
                            case .empty:
                                ShimmerView(width: 330, height: 140)

                                    .frame(width: 330, height: 140)
                                    .clipShape(
                                        RoundedRectangle(cornerRadius: 15)
                                    )
                                    .containerRelativeFrame(
                                        .horizontal, alignment: .center)

                            case .success(let image):
                                ZStack {
                                    image
                                        .resizable()
                                        .frame(width: 330, height: 140)
                                        .clipShape(
                                            RoundedRectangle(cornerRadius: 15)
                                        )
                                        .containerRelativeFrame(
                                            .horizontal, alignment: .center
                                        ).onTapGesture {
                                            if(AuthManager.shared.isLoggedIn()){
                                                UIPasteboard.general.string =
                                                coupon.code
                                                withAnimation(.snappy) {
                                                    SnackbarManager.shared.show(message: "Copied to clipboard!")
                                                }
                                            }else{
                                                AlertManager.shared.showLoginAlert()
                                            }
                                        }

                                    Text(coupon.code)
                                        .frame(alignment: .leading)
                                        .foregroundStyle(.white)
                                        .bold()
                                }
                            case .failure:
                                ZStack {
                                    RoundedRectangle(cornerRadius: 15)
                                        .frame(width: 330, height: 140)
                                        .foregroundStyle(.gray)
                                        .containerRelativeFrame(
                                            .horizontal, alignment: .center)
                                    Text("Failed to load image")
                                        .foregroundStyle(.white)
                                }
                            @unknown default:
                                EmptyView()
                            }
                        }

                    }
                }

            }

        }
        .scrollTargetLayout()
        .scrollTargetBehavior(.paging)
        .contentMargins(20.0)
        .onAppear {
        }
    }
}

#Preview {
    let tempImageList = ImageList(id: "")
    return AdCardView()
}
