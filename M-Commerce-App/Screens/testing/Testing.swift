//
//  Testing.swift
//  M-Commerce-App
//
//  Created by Zeiad on 11/02/2025.
//

import SwiftUI

struct Testing: View {
    @StateObject var viewModelTest = ViewModelTest()
    var body: some View {

        if !viewModelTest.isLoading {
            List(viewModelTest.items, id: \.self) { item in
                Text(item)
            }
        } else {
            ProgressView()
        }
    }
}

#Preview {
    Testing()
}
