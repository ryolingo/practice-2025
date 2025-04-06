//
//  TextRenderer.swift
//  practice-2025
//
//  Created by matsumotoryota on 2025/04/03.
//

import SwiftUI

struct PeachTecTextRenderering: View {
    var body: some View {
        TextView()
    }
}

private struct TextView: View {
    var body: some View {
        Text("PeachTech")
            .font(.system(size: 50, weight: .black))
            .textRenderer(Renderer())
    }
}

struct Renderer: TextRenderer {
    func draw(layout: Text.Layout, in ctx: inout GraphicsContext) {
        for line in layout {
            ctx.draw(line)
            ctx.transform = .init(translationX: 10, y: 10)
            ctx.opacity = 0.5
            ctx.draw(line)
        }
    }
}

#Preview {
    PeachTecTextRenderering()
}
