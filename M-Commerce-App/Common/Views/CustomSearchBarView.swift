//
//  CustomSearchBarView.swift
//  M-Commerce
//
//  Created by Zeiad on 09/02/2025.
//
import SwiftUI

struct CustomSearchBarView: View {
    let placeholder: String
    var onChange: (String) -> Void
    var prefix: (() -> any View)?
    var suffix: (() -> any View)?
    var enableClearButton: Bool = true
    var validationType: ValidationType?

    @State private var text: String = ""
    @FocusState private var isFocused: Bool
    @State private var errorMessage: String?
    var hasError: Bool { errorMessage != nil }

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                // Prefix view (e.g., magnifying glass icon)
                if prefix != nil {
                    AnyView(prefix!())
                        .foregroundColor(
                            isFocused
                                ? ThemeManager.darkPuble
                                : .secondary.opacity(0.5))
                }

                // TextField for search input
                TextField(placeholder, text: $text)
                    .focused($isFocused)
                    .onChange(
                        of: text,
                        {
                            onChange(text)
                            if validationType != nil {
                                if text.isEmpty {
                                    errorMessage = nil
                                } else {
                                    errorMessage = TextValidation.validateText(
                                        text, type: validationType!)
                                }
                            }

                        })

                // Suffix view (e.g., clear button)
                if !text.isEmpty && enableClearButton {
                    Button(action: {
                        text.removeAll()
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(
                                isFocused
                                    ? ThemeManager.darkPuble
                                    : .secondary.opacity(0.5))
                    }
                }
                if (suffix != nil && text.isEmpty)
                    || (suffix != nil && !text.isEmpty && !enableClearButton)
                {
                    AnyView(suffix!())
                        .foregroundColor(
                            isFocused
                                ? ThemeManager.darkPuble
                                : .secondary.opacity(0.5))
                }
            }
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(
                        hasError
                            ? .red
                            : isFocused
                                ? ThemeManager.darkPuble
                                : Color.gray.opacity(0.3),
                        lineWidth: isFocused ? 2 : 1)
                        .animation(.easeInOut(duration: 0.3), value: hasError) // Animate border color

            )
            if let error = errorMessage {
                Text(error)
                    .padding(.leading, 10)
                    .font(.caption)
                    .foregroundColor(.red)
                    .transition(.opacity) // Smooth slide-in effect
            }

        }
        .animation(.easeInOut(duration: 0.3), value: errorMessage) // Ensure smooth updates
    }
}

#Preview {
    CustomSearchBarView(
        placeholder: "search in favorites.....",
        onChange: { text in
            print("Search text: \(text)")
        },
        prefix: {
            Image(systemName: "magnifyingglass")

        },
        suffix: {
            Button(action: {
                print("Cleared")
            }) {
                Image(systemName: "heart")
            }
        }

    )
    .padding()
}
