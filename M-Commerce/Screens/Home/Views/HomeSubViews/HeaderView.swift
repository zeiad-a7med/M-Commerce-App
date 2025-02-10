//
//  HeaderView.swift
//  M-Commerce
//
//  Created by Usef on 10/02/2025.
//

import SwiftUI

struct HeaderView: View {
    var title:String
    var color:Color
    var body: some View {
        HStack(content: {
            Text(title)
                .font(.system(.title, weight: .bold))
                .foregroundStyle(color)
            Spacer()
        }).padding(.leading)
    }
}

#Preview { 
    HeaderView(title: "Home", color: Color(red: 48/255, green: 25/255, blue: 52/255, opacity: 1.0))
}
