//
//  HomePageView.swift
//  M-Commerce
//
//  Created by Usef on 09/02/2025.
//

import SwiftUI

struct HomePageView: View {
    @StateObject var bViewModel: BrandsViewModel = BrandsViewModel()
    let screenTitle: String = "Home"
    let tempImageList = ImageList(id: "")
    @State var isCopied: Bool = false
    @State var favoriteCount : Int = 0
    var body: some View {

        NavigationView {
            ZStack {  //start of: ZStack
                ScrollView {
                    LazyVStack {
                        CustomSearchBarView(
                            placeholder: "search for brand ...",
                            onChange: { text in
                                print("Search text: \(text)")
                            },
                            prefix: {
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(.black)
                                    .font(.title2)
                            }
                        )
                        .padding([.leading,.trailing],20)
                        HeaderView(
                            title: ThemeManager.firstSectionTitle,
                            color: ThemeManager.titleColor)
                        AdCardView(
                            imageList: tempImageList,
                            discountCode: [
                                DiscountCode(), DiscountCode(code: "ByeBye"),
                                DiscountCode(code: "areWeThereYet"),
                            ], pricesruleList: PriceRulesList(id: "")
                        ) {
                            self.isCopied.toggle()
                        }
                        HeaderView(
                            title: ThemeManager.secondSectionTitle,
                            color: ThemeManager.titleColor)
                        if let bv = bViewModel.brands.collections {
                            BrandsView(
                                brandsDetails: bv,
                                reload: {
                                    bViewModel.loadMore()
                                })
                        }
                        Spacer()
                    }
                }
                if isCopied {
                    Text("Copied to Clipboard")
                        .foregroundStyle(.gray)
                        .transition(.move(edge: .bottom))
                        .frame(height: 50, alignment: .bottom)
                        .offset(y: UIScreen.main.bounds.height / 3)
                }
            }  //end of: ZStack
            .navigationTitle(screenTitle)
            .toolbar {  //start of: toolbar
                ToolbarItem(
                    placement: .topBarTrailing,
                    content: {
                        LazyHStack {
                            NavigationLink(
                                destination: ShoppingView(),
                                label: {
                                    ButtonView(
                                        imageSystemName: ThemeManager.cartImg,
                                        itemCounter: 10)
                                })
                            NavigationLink(
                                destination: FavoritesView(),
                                label: {
                                    ButtonView(
                                        imageSystemName: ThemeManager
                                            .favouriteImg,
                                        itemCounter: favoriteCount)
                                })
                            .onAppear {
                                favoriteCount = FavoritesManager.shared.favorites.count
                            }
                        }
                    })
            }
        }  //end of: toolbar
    }
}

#Preview {
    //    NavigationView {
    HomePageView()
    //    }
}

let dummyImgsUrlArray = [
    "https://cdn.logojoy.com/wp-content/uploads/2018/05/30143356/127.png",
    "https://designshifu.com/wp-content/uploads/2022/12/DS_Blog_Image_Best_Clothing_Brand_Logos_of_all_Time_3-1024x536.jpg",
    "https://assets.turbologo.ru/blog/ru/2021/11/12082532/Hermes-Logo.png",
    "https://sp-ao.shortpixel.ai/client/to_webp,q_glossy,ret_img,w_750,h_400/http://assets.designhill.com/design-blog/wp-content/uploads/2019/04/10.png",
    "https://designshifu.com/wp-content/uploads/2023/01/DS_Blog_Images_Clothing_Logo_Design_Inspiration__Ideas_4-1024x536.jpg",
    "https://cdn.logojoy.com/wp-content/uploads/2018/05/30143419/95.png",
    "https://assets.turbologo.ru/blog/ru/2021/11/12073500/Burberry-Logo.png",
]
let dummyBrndsNamesArray = [
    "Adidas", "Hermes", "Ralph Aura", "H&M", "Zara", "Hollister", "Burberry",
]
