//
//  FlatButton.swift
//  M-Commerce-App
//
//  Created by Usef on 19/02/2025.
//

import SwiftUI

struct FlatButton: View {
    var title:String
    var isSelected:Bool
    var onTap: ()->()
    var body: some View {
        VStack {
            Button(action: {
                onTap()
            }, label: {
                Text(title)
                    .frame(width: 150, height: 25, alignment: .center)
                    .foregroundStyle(isSelected ? .BILWID : .GILGID)
            }).disabled(isSelected)
            Rectangle()
                .frame(width: 110, height: 1.7, alignment: .center)
                .foregroundStyle(isSelected ? ThemeManager.darkPuble : .clear)
        }
    }
}

#Preview {
    FlatButton(title: "Details", isSelected: true, onTap: {
        print("Tapped")
    })
}
