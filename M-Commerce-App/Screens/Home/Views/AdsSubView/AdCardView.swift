//
//  AdsComponentV2.swift
//  AssetsForSwiftUIPorject
//
//  Created by Andrew Emad on 10/02/2025.
//

import SwiftUI

struct AdCardView: View {
    @State var imageList : ImageList
    @State var discountCode : [DiscountCode]
    @State var pricesruleList : PriceRulesList
    var adViewModel = AdViewModel()
   @State var isCopied = false
    var body: some View {
        
       
    ScrollView(.horizontal,showsIndicators: false){
        VStack {
            LazyHStack{
                    ForEach(Array(discountCode.enumerated()), id: \.offset){index, discount in
                    
                        AsyncImage(url: URL(string: imageList.images[index])) { phase in
                                switch phase {
                                case .empty:
                                    ProgressView() 
                                        
                                        .frame(width: 330 , height: 140)
                                        .clipShape(RoundedRectangle(cornerRadius: 15))
                                        .containerRelativeFrame(.horizontal, alignment: .center)
                                        
                                case .success(let image):
                                    ZStack{
                                        image
                                           .resizable()
                                           .frame(width: 330 , height: 140)
                                           .clipShape(RoundedRectangle(cornerRadius: 15))
                                           .containerRelativeFrame(.horizontal, alignment: .center).onTapGesture {
                                               UIPasteboard.general.string = discount.code
                                               withAnimation(.snappy){
                                                   isCopied = true
                                               }
                                               DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                                                   withAnimation(.snappy){
                                                       isCopied = false
                                                   }
                                               }
                                               
                                           }
                                      
                                        Text("\(discount.code)")
                                           .frame(alignment: .leading)
                                           .foregroundStyle(.white)
                                           .bold()
                                    }
                                case .failure:
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 15)
                                            .frame(width: 330 , height: 140)
                                            .foregroundStyle(.gray)
                                            .containerRelativeFrame(.horizontal, alignment: .center)
                                        Text("Failed to load image")
                                            .foregroundStyle(.white)
                                    }
                                @unknown default:
                                    EmptyView()
                                }
                            }
                        
                            
                        
                    
                        
                    }
            }
            
           
        }
   
        
        }
        .scrollTargetLayout()
        .scrollTargetBehavior(.paging)
        .contentMargins(20.0)
        .onAppear{
        }
     
        if isCopied {
            Text("Copied to Clipboard")
                .foregroundStyle(.gray)
                .transition(.move(edge: .bottom))
                .frame(height:50 , alignment: .bottom)
        }
            
    }
}

#Preview {
    let tempImageList = ImageList(id: "" )
    return AdCardView(imageList: tempImageList,discountCode: [DiscountCode(),DiscountCode(code:"ByeBye"),DiscountCode(code: "areWeThereYet")],pricesruleList: PriceRulesList(id: ""))
}
