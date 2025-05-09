//
//  HorizontalScrollView.swift
//  practice-2025
//
//  Created by Ryota Matsumoto on 5/9/25.
//

import SwiftUI

struct HorizontalScrollView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false,)
        {
            HStack{
                ForEach(0..<7, id: \.self){_ in
                    HorizontalItemView()
                }
            }
        }
    }
}

struct HorizontalItemView: View {
    let color: Color = Color(
        red: .random(in: 0...1),
        green: .random(in: 0...1),
        blue: .random(in: 0...1)
    )

    var body : some View {
        VStack{
            RoundedRectangle(cornerRadius: 20)
            .fill(color)
            .frame(width: 80, height: 80)
        }
    }
}

#Preview {
    HorizontalScrollView()
}

