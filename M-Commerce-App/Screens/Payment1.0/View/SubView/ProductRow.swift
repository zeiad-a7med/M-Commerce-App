//
//  productRow.swift
//  M-Commerce-App
//
//  Created by Andrew Emad on 19/02/2025.
//

import SwiftUI

struct productRow: View {
    var body: some View {
        VStack(alignment: .leading) {
           
            HStack{
                ImageView()
                VStack(alignment:.leading) {
                    Text("bigBox limited Edition").bold()
                    HStack {
                        Text("Size:").bold()
                        Text("50")
                    }
                    HStack {
                        Text("Color:").bold()
                        Text("Brown")
                        Spacer()
                        Text("TotalPrice:").bold()
                        Text("500")
                        Text("$")
                           
                    }
                }

            }.padding()
        }
    }
}

#Preview {
    productRow()
}






