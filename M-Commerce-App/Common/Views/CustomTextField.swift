//
//  CustomSearchBarView.swift
//  M-Commerce
//
//  Created by Zeiad on 09/02/2025.
//
import SwiftUI

struct CustomTextField: View {
    let placeholder: String
    var onChange: (String) -> Void
    var prefix: (() -> any View)?
    var suffix: (() -> any View)?
    var enableClearButton: Bool = true
    var disActiveWhenCancel: Bool = false
    var showClearBtnWhenClearText: Bool = false
    var validationType: ValidationType?
    var characterLimit: Int?
    var isValid: ((Bool) -> Void)?
    @State private var defaultSet : Bool = false
    @Binding var initialText: String
    @State private var text: String = ""
    @FocusState private var isFocused: Bool
    @State private var errorMessage: String?
    var hasError: Bool { errorMessage != nil }
    
    var onActive: ((Bool) -> Void)?
    
    

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                // Prefix view (e.g., magnifying glass icon)
                if prefix != nil {
                    AnyView(prefix!())
                        .foregroundColor(
                            isFocused
                                ? ThemeManager.darkPuble
                                : .secondary.opacity(0.5)
                        )
                        .animation(.easeInOut(duration: 0.3), value: isFocused)
                }

                // TextField for search input
                TextField(placeholder, text: $text)
                    .focused($isFocused)
                    .onChange(
                        of: text,
                        {
                            if characterLimit != nil {
                                if text.count > characterLimit! {
                                    text = String(
                                        text.prefix(characterLimit!))
                                }
                            }
                            onChange(text)
                            if validationType != nil {
                                if text.isEmpty {
                                    errorMessage = nil
                                } else {
                                    errorMessage = TextValidation.validateText(
                                        text, type: validationType!)
                                }
                                isValid?(!hasError && !text.isEmpty)
                            }

                        })

                // Suffix view (e.g., clear button)
                if (!text.isEmpty || showClearBtnWhenClearText) && enableClearButton {
                    Button(action: {
                        text.removeAll()
                        if disActiveWhenCancel {
                            isFocused = false
                        }
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(
                                isFocused
                                    ? ThemeManager.darkPuble
                                    : .secondary.opacity(0.5)
                            )
                            .animation(
                                .easeInOut(duration: 0.3), value: isFocused)
                    }
                }
                if (suffix != nil && text.isEmpty)
                    || (suffix != nil && !text.isEmpty && !enableClearButton)
                {
                    AnyView(suffix!())
                        .foregroundColor(
                            isFocused
                                ? ThemeManager.darkPuble
                                : .secondary.opacity(0.5)
                        )
                        .animation(.easeInOut(duration: 0.3), value: isFocused)
                }
            }
            .onChange(of:isFocused) { val in
                onActive?(val)
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
                        lineWidth: isFocused ? 2 : 1
                    )
                    .animation(.easeInOut(duration: 0.3), value: hasError)
                    .animation(.easeInOut(duration: 0.3), value: isFocused)

            )
            if let error = errorMessage {
                Text(error)
                    .padding(.leading, 10)
                    .font(.caption)
                    .foregroundColor(.red)
                    .transition(.opacity)  // Smooth slide-in effect
            }

        }
        .animation(.easeInOut(duration: 0.3), value: errorMessage)
        .onAppear{
            if(!defaultSet){
                defaultSet = true
                print(initialText ?? "")
                text = initialText ?? ""
            }
        }
    }
}

#Preview {
    CustomTextField(
        placeholder: "search in favorites.....",
        onChange: { text in
            print("Search text: \(text)")
        },
        //        prefix: {
        //            Image(systemName: "magnifyingglass")
        //
        //        },
        //        suffix: {
        //            Button(action: {
        //                print("Cleared")
        //            }) {
        //                Image(systemName: "heart")
        //            }
        //        },
        characterLimit: 5,
        initialText: .constant("assa")
        

    )
    .padding()
}
