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
        ScrollView {
            LazyVStack {
                ForEach(viewModelTest.items, id: \.self) { item in
                    Text(item)
                        .frame(height: 200)
                        .padding()
                        .onAppear {
                            if item == viewModelTest.items.last {
                                viewModelTest.loadMore()
                            }
                        }
                }
                if viewModelTest.isLoading {
                    ProgressView("Loading more...")
                }
            }
        }
    }
}

#Preview {
    Testing()
}
