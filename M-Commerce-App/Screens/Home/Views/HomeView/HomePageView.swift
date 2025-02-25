//
//  HomePageView.swift
//  M-Commerce
//
//  Created by Usef on 09/02/2025.
//

import SwiftUI

struct HomePageView: View {
    @State var favoriteCount: Int = 0
    @State var searchText: String = ""
    @State var isSearchActive: Bool = false
    //    @StateObject var searchViewModel = SearchViewModel(filterProduct: "m")
    var body: some View {
        ZStack {  //start of: ZStack
            ScrollView {
                VStack {
                    CustomTextField(
                        placeholder: "search for products ...",
                        onChange: { text in
                            self.searchText = text
                        },
                        prefix: {
                            Image(systemName: "magnifyingglass")
                        },
                        disActiveWhenCancel: true, initialText: .constant(""),
                        onActive: { active in
                            if active {
                                isSearchActive = true
                            } else {
                                isSearchActive = false
                            }
                        }

                    )
                    .padding([.leading, .trailing], 20)
                    if isSearchActive {
                        CustomSearchView(
                            searchText: $searchText, mainFilter: .constant(""))
                    } else {
                        AdCardView()
                        HeaderView(
                            title: ThemeManager.secondSectionTitle,
                            color: ThemeManager.titleColor)
                        BrandsView()
                    }
                }
            }
        }  //end of: ZStack
    }
}

#Preview {
    //    NavigationView {
    HomePageView(searchText: "m")
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
