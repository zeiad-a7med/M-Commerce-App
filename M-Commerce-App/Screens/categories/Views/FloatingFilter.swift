//
//  FloatingFilter.swift
//  M-Commerce-App
//
//  Created by Usef on 15/02/2025.
//

import SwiftUI

struct FloatingFilter: View {
    var SubFiltersArray:[String]
    var filter: (Int) -> Void
    var isSelectedPopup:Bool
    var filterBtnToggle: ()->Void
    @State var subFilterIndex: Int = 3
    var body: some View {
        ZStack {
            Button(
                action: {
                    if self.subFilterIndex != 0 {
                        self.subFilterIndex = 0
                    } else {
                        self.subFilterIndex = 3
                    }
                    filter(subFilterIndex)
                },
                label: {
                    FloatingButtonView(
                        color: subFilterIndex == 0 ? ThemeManager.darkPuble : .gray
                        , inconName: "hat.cap")
                }
            ).offset(y: isSelectedPopup ? -270.0 : 0.0)
            Button(
                action: {
                    if self.subFilterIndex != 1 {
                        self.subFilterIndex = 1
                    } else {
                        self.subFilterIndex = 3
                    }
                    filter(subFilterIndex)
                },
                label: {
                    FloatingButtonView(
                        color: subFilterIndex == 1 ? ThemeManager.darkPuble : .gray
                        , inconName: "tshirt")
                }
            ).offset(y: isSelectedPopup ? -180.0 : 0.0)
            Button(
                action: {
                    if self.subFilterIndex != 2 {
                        self.subFilterIndex = 2
                    } else {
                        self.subFilterIndex = 3
                    }
                    filter(subFilterIndex)
                },
                label: {
                    FloatingButtonView(
                        color: subFilterIndex == 2 ? ThemeManager.darkPuble : .gray
                        , inconName: "shoe")
                }
            ).offset(y: isSelectedPopup ? -90.0 : 0.0)
            
            Button(
                action: {
                    withAnimation(
                        .spring(
                            response: 0.5, dampingFraction: 0.5,
                            blendDuration: 0)
                    ) {
                        filterBtnToggle()
                    }
                },
                label: {
                    FloatingButtonView(
                        color: ThemeManager.darkPuble,
                        inconName: "plus")
                })
        }
    }
}


#Preview {
    FloatingFilter(SubFiltersArray: ["T-Shirts","Shoes","Dresses"], filter: {_ in }, isSelectedPopup: true, filterBtnToggle: {})
}
