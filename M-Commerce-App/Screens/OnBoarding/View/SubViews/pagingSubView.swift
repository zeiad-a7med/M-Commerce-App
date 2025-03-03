//
//  pagingSubView.swift
//  M-Commerce-App
//
//  Created by Usef on 24/02/2025.
//

import SwiftUI

struct pagingSubView: View {
    private let imgArray = ["board1", "board2", "board3"]
    private let textArray = [
        "Various Collection Of The Latest Products",
        "Complete Collections Of Colors And Sizes",
        "Find The Most Suitable Outfit For You",
    ]
    private let descArray =
        [
            "Discover outfits curated just for you with AI-powered recommendations",
            "ETry Now, Pay Later – because fashion waits for no one!",
            "Easy returns and exchanges, because style should be stress-free!",
        ]
    private let pageCount = 3
    @State private var currentIndex = 0
    var body: some View {
        TabView(selection: $currentIndex) {
            ForEach(0..<pageCount, id: \.self) { index in
                BoardingPage(
                    imgName: imgArray[index],
                    text: textArray[index],
                    desc: descArray[index]
                )
                .tag(index)
                .tabItem {
                    Label("Home", image: "heart.fill")
                }
            }
        }.offset(y: -30)
            .frame(
                width: UIScreen.main.bounds.width,
                height: UIScreen.main.bounds.width * 1.5
            )
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .overlay(
                HStack(spacing: 10) {
                    ForEach(0..<pageCount, id: \.self) {
                        index in
                        Capsule()
                            .fill(
                                index == currentIndex
                                    ? ThemeManager.darkPuble : .secondary
                            )
                            .frame(width: currentIndex == index ? 25 : 10, height: 10)
                            .animation(.easeInOut(duration: 0.3), value: currentIndex)
                    }
                }.padding(
                .bottom,
                UIApplication.shared.windows.first?.safeAreaInsets.bottom),
                alignment: .bottom
            )
    }
}

#Preview {
    pagingSubView()
}
