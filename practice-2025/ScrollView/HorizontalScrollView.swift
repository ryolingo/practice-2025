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
    var body : some View {
        VStack{
            Button{
                print("Pressed")
            }  label: {
                RoundedRectangle(cornerRadius: 20)
                .frame(width: 100, height: 100)
            }
        }
    }
}

#Preview {
    HorizontalScrollView()
}

	
    