//
//  ProductInfoView.swift
//  M-Commerce-App
//
//  Created by Zeiad on 12/02/2025.
//

import SwiftUI

struct ProductInfoView: View {
    @StateObject var viewModel = ProductViewModel()
    @State var val: Int = 0
    var body: some View {
        if(viewModel.isLoading){
            ProgressView()
        }else{
            ZStack {
                Color(.white)
                    .ignoresSafeArea(.all)
                VStack {
                    ScrollView(.horizontal, showsIndicators: false) {
                        VStack {
                            LazyHStack {
                                ForEach(Array((viewModel.product?.images ?? []).enumerated()), id: \.offset) {
                                    index, discount in
                                    CustomNetworkImageView(
                                        url: URL(
                                            string: viewModel.product?.images[index].url ?? ""
                                                
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
                                StarRatingView(rating: 2.5)
                            }.frame(
                                width: UIScreen.main.bounds.width * 2 / 3,
                                alignment: .leading)
                            Spacer()
                            FavoriteButtonView(
                                size: 30
                            )
                        }.padding(.bottom, 20)

                        ScrollView {
                            ReadMoreTextView(
                                text:
                                    "he product is designed with high-quality materials to ensure durability and longevity. It features an ergonomic design that provides maximum comfort during use. Whether you’re using it for daily activities or special occasions, this product meets all your needs. It is lightweight, easy to carry, and packed with innovative features that set it apart from the competition. Additionally, it comes in various colors and sizes to suit different preferences. With its user-friendly interface and top-notch performance, this product is a must-have for anyone looking for quality and reliability.",
                                lineLimit: 2
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
                            Text("LE")
                                .foregroundStyle(ThemeManager.darkPuble)
                                .font(.title)
                            Text("35.5")
                                .font(.title)
                            
                            Spacer()
                            CustomRoundedButtonView(
                                text:"Add to Cart",
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
}
