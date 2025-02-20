//
//  RadioButton.swift
//  M-Commerce-App
//
//  Created by Andrew Emad on 19/02/2025.
//

import SwiftUI

struct RadioButton: View {
    var id: Int
    var label: String
    @Binding var selectedOption: Int?
 
    var body: some View {
        Button(action: {
            selectedOption = id
            
      
            
            
        }) {
            HStack {
                ZStack {
                    Circle()
                        .strokeBorder(ThemeManager.darkPuble, lineWidth: 2)
                        .frame(width: 25, height: 25)
                    
                    if selectedOption == id {
                       
                        Circle()
                            .foregroundColor(ThemeManager.darkPuble)
                            .frame(width: 15, height: 15)
                        
                    }
                }
                
                Text(label)
                    .foregroundColor(.primary)
                    .font(.body)
            }
            .padding(.vertical, 8)
        }
        .buttonStyle(PlainButtonStyle())
    }
}


#Preview {
    return RadioButton(id:0 ,label: "hello There", selectedOption: .constant(0))
}







