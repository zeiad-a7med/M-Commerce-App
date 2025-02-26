//
//  KeyAndValueTextView.swift
//  M-Commerce-App
//
//  Created by Usef on 19/02/2025.
//

import SwiftUI

struct KeyAndValueTextView: View {
    var key:String
    var value:String
    var body: some View {
        HStack (spacing: 0) {
            Text(key)
                .fontWeight(.light)
            Text(value)
               .fontWeight(.regular)
           Spacer()
        }.frame(maxHeight: 25)
    }
}

#Preview {
    KeyAndValueTextView(key: "Qnty: ", value: "43")
}
