//
//  Vaniila.swift
//  practice-2025
//
//  Created by Ryota Matsumoto on 4/22/25.
//

import SwiftUI

extension View{
    func asIcon(color: Color) -> some View{
        self
            .font(.largeTitle)
            .symbolVariant(.fill)
            .foregroundStyle(.white)
            .padding(10)
            .frame(width: 64, height: 64)
            .background(color.gradient, in: .rect(cornerRadius:10, style: .continuous))
    }
}

extension View {
    func badge(_ value: Int, alignment: Alignment) -> some View {
        overlay(alignment: alignment) {
            Badge(value: value)
                .alignmentGuide(alignment.vertical, computeValue: { dimension in
                    dimension[VerticalAlignment.center]
                })
                .alignmentGuide(alignment.vertical, computeValue: { dimension in
                    dimension[VerticalAlignment.center]
                })
                .fixedSize()
        }
    }
}

struct Badge: View{
    var value: Int
    @ScaledMetric private var minWidth: CGFloat = 22
    var body : some View{
        Text("\(value)")
            .font(.body)
            .foregroundStyle(.white)
            .padding(.horizontal, 8)
            .frame(minWidth: minWidth)
            .frame(height: minWidth)
        .background(.red.gradient, in: .capsule)    }
}

struct ImageWithBadgeView: View {
    
    var body: some View {
        HStack{
            Image(systemName:"phone")
                .asIcon(color: .red)
            Image(systemName:"message")
                .asIcon(color:.green)
                .badge(2225, alignment: .topTrailing)
            Image(systemName:"book")
                .asIcon(color:.yellow)
            
        }
        .padding()
    }
}


#Preview {
    ImageWithBadgeView()
}
        
