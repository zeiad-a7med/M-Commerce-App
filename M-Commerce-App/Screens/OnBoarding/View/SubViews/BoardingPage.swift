//
//  BoardingPage.swift
//  M-Commerce-App
//
//  Created by Usef on 24/02/2025.
//

import SwiftUI

struct BoardingPage: View {
    var imgName: String
    var text: String
    var desc: String
    var body: some View {
        VStack {
            Image(imgName)
                .resizable()
                .frame(width: 320, height: 400)
                .cornerRadius(50)
            Text(text)
                .font(.system(size: 18, weight: .bold))
                .multilineTextAlignment(.center)
                .frame(maxWidth: 300, alignment: .center)
                .padding([.top, .horizontal])
                .padding(.bottom, 3)
                .fixedSize(horizontal: false, vertical: true)

            Text(desc)
                .font(.system(size: 14, weight: .light))
                .multilineTextAlignment(.center)
                .frame(maxWidth: 300, alignment: .center)
                .padding(.horizontal)
                .fixedSize(horizontal: false, vertical: true)

        }.frame(width: 330, height: 400)
    }
}

#Preview {
    BoardingPage(
        imgName: "board1", text: "hello, world!",
        desc: "hello, world!hello, world!")
}
