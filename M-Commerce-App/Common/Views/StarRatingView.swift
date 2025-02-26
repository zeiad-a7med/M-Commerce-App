//
//  StarRatingView.swift
//  M-Commerce-App
//
//  Created by Zeiad on 12/02/2025.
//

import SwiftUI

struct StarRatingView: View {
    @State var rating: Double = 5
    let maxRating = 5
    var body: some View {
        VStack {
            HStack {
                ForEach(1...maxRating, id: \.self) { index in
                    if Double(index) <= rating {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    } else if Double(index) - 0.5 == rating {
                        Image(systemName: "star.leadinghalf.filled")
                            .foregroundColor(.yellow)
                    } else {
                        Image(systemName: "star")
                            .foregroundColor(.yellow)
                    }
                }
            }
            HStack{
                Text(String(format: "%.1f", rating))
                    .font(.caption)
                Text("(\(Int(rating*10)) Review)")
                    .font(.caption)
                    .foregroundStyle(.primary)
            }.padding(.top,5)
        }
    }
}

#Preview {
    StarRatingView(
        rating: 3.5
    )
}
