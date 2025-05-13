//
//  ViewModifire.swift
//  practice-2025
//
//  Created by Ryota Matsumoto on 5/13/25.
//

import SwiftUI


struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(16)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 5)
    }
}

struct CardModifierView: View {
    var body: some View {
        VStack {
            Text("Hello, world!")
                .modifier(CardModifier())
            ModifiedContent(
                content: Text("Hello, world!"),
                modifier: CardModifier())
        }
    }
}


#Preview {
    CardModifierView()
}
