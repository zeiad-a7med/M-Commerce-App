//
//  ReviewsList.swift
//  M-Commerce-App
//
//  Created by Zeiad on 25/02/2025.
//

import SwiftUI

struct ReviewsListView: View {
    var body: some View {
        VStack{
            List {
                ForEach(0..<10) { _ in
                    ReviewComponent()
                }
            }
        }
        .navigationTitle("Reviews")
    }
}

#Preview {
    ReviewsListView()
}
