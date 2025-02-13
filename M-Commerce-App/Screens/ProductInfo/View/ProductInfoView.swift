//
//  ProductInfoView.swift
//  M-Commerce-App
//
//  Created by Zeiad on 12/02/2025.
//

import SwiftUI

struct ProductInfoView: View {
    @Environment(\.modelContext) private var context
    @StateObject var viewModel = ProductViewModel(
        productId: "gid://shopify/Product/15046227394931")
    @State var val: Int = 0
    var body: some View {
        if viewModel.isLoading {
            ProgressView()
        } else {
            ZStack {
                Color(.white)
                    .ignoresSafeArea(.all)
                VStack {
                    ScrollView(.horizontal, showsIndicators: false) {
                        VStack {
                            LazyHStack {
                                ForEach(
                                    Array(
                                        (viewModel.product?.images ?? [])
                                            .enumerated()), id: \.offset
                                ) {
                                    index, discount in
                                    CustomNetworkImageView(
                                        url: URL(
                                            string: viewModel.product?.images![
                                                index
                                            ].url ?? ""

                                        )!
                                    )
                                    .frame(
                                        width: UIScreen.main.bounds.width,
                                        height: UIScreen.main.bounds.width + 70
                                    )

                                }
                            }

                        }

                    }
                    .frame(
                        width: UIScreen.main.bounds.width,
                        height: UIScreen.main.bounds.width + 70
                    )
                    .ignoresSafeArea(.all)
                    .scrollTargetLayout()
                    .scrollTargetBehavior(.paging)
                    Spacer()
                }
                VStack {
                    Spacer()
                    VStack(alignment: .leading) {

                        HStack {
                            VStack(alignment: .leading) {
                                Text(viewModel.product?.title ?? "")
                                    .font(.title2)
                                    .multilineTextAlignment(.leading)
                                    .bold(true)
                                    .padding(.bottom, 10)
                                StarRatingView(rating: Double.random(in: 2...5))
                            }.frame(
                                width: UIScreen.main.bounds.width * 2 / 3,
                                alignment: .leading)
                            Spacer()
                            FavoriteButtonView(
                                onFavorite:{ val in
                                    viewModel.addToFavoriteAlert()
                                },
                                size: 30
                            )
                        }.padding(.bottom, 20)

                        ScrollView {
                            ReadMoreTextView(
                                text: viewModel.product?.desc ?? "",
                                lineLimit: 3
                            )
                            .font(.system(size: 19))
                            .foregroundColor(.primary)
                            .padding(.bottom, 10)

                            HStack {
                                Text("Choose amount:")
                                    .bold(true)
                                Spacer()
                                CustomStepper(numberOfItem: 1) { count in
                                    print(count)
                                }
                            }
                        }
                        Spacer()
                        HStack {
                            Text(viewModel.product?.currency ?? "")
                                .foregroundStyle(ThemeManager.darkPuble)
                                .font(.title)
                            Text(viewModel.product?.formattedPrice ?? "")
                                .font(.title)
                            Spacer()
                            CustomRoundedButtonView(
                                text: "Add to Cart",
                                systemIconName: "handbag",
                                onTap: {
                                    print("Tapped")
                                }
                            )

                        }

                    }
                    .padding(30)
                    .frame(
                        width: UIScreen.main.bounds.width,
                        height: UIScreen.main.bounds.height / 2
                    )
                    .background(.thickMaterial)
                    .clipShape(
                        RoundedCornerShape(
                            corners: [.topRight, .topLeft], radius: 40)
                    )
                }
                .ignoresSafeArea(.all)
            }
            .alert(
                viewModel.alertContent?.title ?? "",
                isPresented: Binding(
                    get: { viewModel.alertContent?.isVisible ?? false },
                    set: { viewModel.alertContent?.isVisible = $0 }
                )
            ) {
                Button("Save") {
//                    viewModel.addToFavorite()
                    context.insert(viewModel.product!)
                    print("savew")
                    do {
                        try context.save()
                        print("saveqq")
                    } catch {
                        print("error")
                    }
                }
                Button("Cancel") {
                    
                }
            } message: {
                Text(viewModel.alertContent?.message ?? "")
            }
            
        }

    }
        
}
struct RoundedCornerShape: Shape {
    var corners: UIRectCorner
    var radius: CGFloat

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

#Preview {
    ProductInfoView()
        .modelContainer(for: Product.self, inMemory: true)
}
