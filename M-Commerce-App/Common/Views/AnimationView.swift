//
//  AnimationView.swift
//  M-Commerce-App
//
//  Created by Usef on 24/02/2025.
//

import SwiftUI
//import Lottie

struct AnimationView: View {
    var name:String
    var body: some View {
//        LottieView(animation: .named(name))
//            .playbackMode(.playing(.toProgress(1, loopMode: .loop)))
        ProgressView()
    }
}

#Preview {
    AnimationView(name: "")
}
