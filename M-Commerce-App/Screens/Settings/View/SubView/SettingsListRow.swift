//
//  SettingsListRow.swift
//  M-Commerce-App
//
//  Created by Andrew Emad on 14/02/2025.
//

import SwiftUI

struct SettingsListRow: View {
    @State var imageName : String = "circle"
    @State var RowName : String = "hello there"
    @State var imageColor : Color = ThemeManager.darkPuble
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Image(systemName: imageName)
                    .padding(.trailing,5)
                    .foregroundStyle(imageColor)
                   
                Text(RowName).bold()
                Spacer()

            }
        }
    }
}

#Preview {
    SettingsListRow()
}
