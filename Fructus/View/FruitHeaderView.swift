//
//  FruitHeaerView.swift
//  Fructus
//
//  Created by Shun Ganas on 2/21/23.
//

import SwiftUI

struct FruitHeaderView: View {
    // MARK: PROPERTIES
    
    var fruit: Fruit
    
    @State private var isAnimatingImage: Bool = false
    
    // MARK: BODY
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: fruit.gradientColors), startPoint: UnitPoint.topLeading, endPoint: UnitPoint.bottomTrailing)
            Image(fruit.image)
                .resizable()
                .scaledToFit()
                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
                .padding(.vertical, 20)
                .scaleEffect(isAnimatingImage ? 1.0 : 0.6)
        }//: ZSTACK
        .frame(height: 440)
        .onAppear(){
            withAnimation(.easeOut(duration: 0.5)) {
                isAnimatingImage = true
            }
        }
    }
}

// MARK: PREVIEW
struct FruitHeaerView_Previews: PreviewProvider {
    static var previews: some View {
        FruitHeaderView(fruit: fruitsData[0])
            .previewLayout(.fixed(width: 375, height: 440))
    }
}
