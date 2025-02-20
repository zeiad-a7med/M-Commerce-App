//
//  SwitchScreensBar.swift
//  M-Commerce-App
//
//  Created by Usef on 19/02/2025.
//

import SwiftUI

struct SwitchScreensBar: View {
    @Binding var isMyOrdersSelected:Bool
    var body: some View {
        HStack (spacing: 30) {
            FlatButton(title: "My Orders",isSelected: isMyOrdersSelected, onTap: {
                if !isMyOrdersSelected {
                    isMyOrdersSelected.toggle()
                    print("My Orders")
                }
            })
            FlatButton(title: "History", isSelected: !isMyOrdersSelected, onTap: {
                if isMyOrdersSelected {
                    isMyOrdersSelected.toggle()
                    print("History")
                }
            })
        }
    }
}


#Preview {
    struct PreviewWrapper: View {
        @State private var value = true
            var body: some View {
                SwitchScreensBar(isMyOrdersSelected: $value)
            }
        }
    return PreviewWrapper()
}
