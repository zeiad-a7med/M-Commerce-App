//
//  CustomProgressView.swift
//  M-Commerce-App
//
//  Created by Usef on 20/02/2025.
//

import SwiftUI
import Lottie

struct CustomProgressView: View {
    var body: some View {
        VStack {
            LottieView(animation: .named("loadingAnimation"))
                .playbackMode(.playing(.toProgress(1, loopMode: .loop)))
        }
    }
}
#Preview {
    CustomProgressView()
}
