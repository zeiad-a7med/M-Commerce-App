//
//  Mappin.swift
//  M-Commerce-App
//
//  Created by Andrew Emad on 16/02/2025.
//

import SwiftUI
struct MapPin : Shape{
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x:rect.midX,y:rect.maxY))
        path.addQuadCurve(to: CGPoint(x: rect.midX, y: rect.minY), control: CGPoint(x: rect.minX, y: rect.minY))
        path.addQuadCurve(to: CGPoint(x: rect.midX, y: rect.maxY), control: CGPoint(x: rect.maxX, y: rect.minY))
        
        
     
        
        return path
    }
    
    
}

