//
//  SwiftUIView.swift
//  reviews component
//
//  Created by Andrew Emad on 25/02/2025.
//

import SwiftUI

struct ReviewComponent: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                VStack (alignment: .center){
                    Image(.profile)
                        .resizable()
                        .frame(width: 70, height: 70)
                        .clipShape(Circle())
                        .overlay {
                            Circle().stroke(.white, lineWidth: 4)
                        }
                        .shadow(radius: 7)
                        .padding(.trailing)
                    Text(dummyNames[Int.random(in: 0...dummyNames.count-1)]).italic()
                }.padding(5)
                
                Spacer()
                StarRatingView(rating: Double.random(in: 2...5))
            }
            ReadMoreTextView(text: productReviews[Int.random(in: 0...productReviews.count-1)],lineLimit: 2)
        }.padding()
    }
    
}

#Preview {
    ReviewComponent()
}

let productReviews = [
    // 5 Stars
    "Absolutely love this product! The quality is top-notch, and it exceeded my expectations. Highly recommend it to anyone looking for something reliable and well-made.",
    "Perfect in every way! Fast shipping, great packaging, and works exactly as described. Will definitely purchase again.",
    "Worth every penny! I've been using it for a few weeks now, and it's made my life so much easier. Can't imagine going without it.",

    // 4 Stars
    "Great product, but there's room for improvement. It works as promised, but I wish the battery life was a bit longer. Still, a solid purchase!",
    "Very satisfied overall. The design is sleek, and it performs well. Just a minor issue with the setup, but customer service was helpful.",
    "Good value for the price. It’s not perfect, but it definitely gets the job done. Would recommend to others.",

    // 3 Stars
    "It’s okay, nothing extraordinary. The product works, but I was expecting a bit more given the price.",
    "Decent quality, but some flaws. It does what it says, but I had to troubleshoot a few times before it worked properly.",
    "Average experience. The product is fine, but the shipping took longer than expected, and the packaging was slightly damaged.",

    // 2 Stars
    "Not impressed. It works, but barely. I expected better quality based on the description.",
    "Disappointed with the durability. It looked promising, but it broke after a few uses. Wouldn’t buy again.",
    "Could be much better. The idea is great, but the execution is poor. Needs significant improvements.",

    // 1 Star
    "Terrible experience. The product arrived damaged, and customer support was unhelpful. Do not recommend.",
    "Complete waste of money. It didn’t work as advertised and fell apart within days. Very disappointed.",
    "Avoid this product. Poor quality, bad service, and not worth the hassle. Wish I had read more reviews before buying."
]

let dummyNames = [
    "John Smith",
    "Emily Johnson",
    "Michael Brown",
    "Jessica Davis",
    "David Wilson",
    "Sarah Miller",
    "James Anderson",
    "Ashley Taylor",
    "Robert Thomas",
    "Olivia Martinez",
    "William Hernandez",
    "Sophia Moore",
    "Daniel Garcia",
    "Isabella Lee",
    "Matthew White",
    "Ava Clark",
    "Christopher Hall",
    "Mia Lewis",
    "Andrew Young",
    "Emma Walker"
]
