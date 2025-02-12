//
//  Testing.swift
//  M-Commerce-App
//
//  Created by Zeiad on 11/02/2025.
//

import SwiftUI

struct Testing: View {
    @StateObject var launchViewModel = ViewModelTest()
    var body: some View {
        if(!launchViewModel.isLoading){
            Text(launchViewModel.products[0])
        }
    }
}

#Preview {
    Testing()
}
