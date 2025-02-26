//
//  AdsComponentV2.swift
//  AssetsForSwiftUIPorject
//
//  Created by Andrew Emad on 10/02/2025.
//

import SwiftUI

struct AdCardView: View {
    var copyToClipboard: (() -> Void)?
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
                                        .overlay {
                                            Color.primary.opacity(0.5)
                                        }
                                        .clipShape(
                                            RoundedRectangle(cornerRadius: 15)
                                        )
                                        .containerRelativeFrame(
                                            .horizontal, alignment: .center
                                        )
                                        .overlay {
                                            Text(coupon.code)
                                                .font(.title3)
                                                .foregroundStyle(.white)
                                                .bold()
                                                .italic()
                                        }

                                        .onTapGesture {
                                            if AuthManager.shared.isLoggedIn() {
                                                UIPasteboard.general.string =
                                                    coupon.code
                                                withAnimation(.snappy) {
                                                    SnackbarManager.shared.show(
                                                        message:
                                                            "Copied to clipboard!"
                                                    )
                                                }
                                            } else {
                                                AlertManager.shared
                                                    .showLoginAlert()
                                            }
                                        }

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
    return AdCardView()
}
