//
//  RadioList.swift
//  M-Commerce-App
//
//  Created by Andrew Emad on 17/02/2025.
//

import Foundation

class RadioList : ObservableObject{
    @Published var boolArray : [Bool] = Array(repeating: false, count: 0)
    func generateArray(count:Int){
        boolArray = Array(repeating:false,count: count)
    }

}
