//
//  CustomSearchBarView.swift
//  M-Commerce
//
//  Created by Zeiad on 09/02/2025.
//
import SwiftUI

struct CustomSearchBarView: View {
    @State private var text: String = ""
    let placeholder: String
    var onChange: (String) -> Void
    var prefix: (() -> any View)?
    var suffix: (() -> any View)?

    var body: some View {
        HStack {
            // Prefix view (e.g., magnifying glass icon)
            if(prefix != nil){
                AnyView(prefix!())
            }
            
            // TextField for search input
            TextField(placeholder, text: $text)
                .onChange(of: text, {
                    onChange(text)
                })
                
            // Suffix view (e.g., clear button)
            if(suffix != nil){
                AnyView(suffix!())
            }
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
        )
    }
}

#Preview {
    CustomSearchBarView(
        placeholder:"search in favorites.....",
        onChange: { text in
            print("Search text: \(text)")
        },
        prefix: {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
        },
        suffix: {
            Button(action: {
                print("Cleared")
            }) {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(.gray)
            }
        }
    )
    .padding()
}
