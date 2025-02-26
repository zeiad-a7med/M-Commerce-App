//
//  SwiftUIView.swift
//  ShoppingCart
//
//  Created by Andrew Emad on 11/02/2025.
//

import SwiftUI

struct CustomStepper: View {
    @State var numberOfItem: Int
    var onChange: ((Int) -> Void)?
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .opacity(0.8)
                .frame(width: 90, height: 30)
                .foregroundStyle(
                    Color(
                        #colorLiteral(
                            red: 0.9364118576, green: 0.8771577477,
                            blue: 0.8891954, alpha: 1))
                )
                .overlay {

                    Circle()
                        .frame(width: 25, height: 25)
                        .offset(x: 30)
                        .foregroundStyle(
                            Color(
                                #colorLiteral(
                                    red: 1, green: 0.9934467673,
                                    blue: 0.9833366275, alpha: 1))
                        )
                        .overlay {
                            Button("", systemImage: "plus") {
                                numberOfItem += 1
                                onChange?(numberOfItem)

                            }.frame(width: 20, height: 15)
                                .offset(x: 34.5, y: -0.7)
                                .bold()
                                .foregroundStyle(.black)

                        }

                    Circle()
                        .frame(width: 25, height: 25)
                        .offset(x: -30)
                        .foregroundStyle(
                            Color(
                                #colorLiteral(
                                    red: 1, green: 0.9934467673,
                                    blue: 0.9833366275, alpha: 1))
                        )
                        .overlay {
                            Button("", systemImage: "minus") {
                                if numberOfItem > 0 {
                                    numberOfItem -= 1
                                    onChange?(numberOfItem)
                                }

                            }.frame(width: 20, height: 15)
                                .offset(x: -26.5, y: -3.5)
                                .bold()
                                .foregroundStyle(.black)

                        }

                }
            Text("\(numberOfItem)")

        }

    }
}

#Preview {
    CustomStepper(numberOfItem: 1)
}
