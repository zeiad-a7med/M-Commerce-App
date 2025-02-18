//
//  ColoredPins.swift
//  M-Commerce-App
//
//  Created by Andrew Emad on 17/02/2025.
//

import Foundation


struct ColoredPins{
    static let listOfColors = ["Cyan","DarkBlue","darkGreen","DarkPurple","LightBlue","lightGreen","LightPurple","Orange","Pink","Red","Teal","Yellow"]
    static func generateRandomColoredPin()->String{
        return listOfColors.randomElement() ?? "Cyan"
    }
}
