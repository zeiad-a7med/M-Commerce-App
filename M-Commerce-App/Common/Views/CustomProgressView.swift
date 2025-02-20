//
//  CustomProgressView.swift
//  M-Commerce-App
//
//  Created by Usef on 20/02/2025.
//

import SwiftUI

struct CustomProgressView: View {
    var body: some View {
        VStack {
            Spacer()
            ProgressView()
            .progressViewStyle(CircularProgressViewStyle())
            .scaleEffect(3)
            Spacer()
        }.padding(120)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    CustomProgressView()
}
