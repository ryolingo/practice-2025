//
//  BorderView.swift
//  practice-2025
//
//  Created by Ryota Matsumoto on 4/30/25.
//

import SwiftUI

struct BorderView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(Color.red)
                    .frame(width: 88, height: 125)
                
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width:70, height: 70)
                    .offset(x:80, y: 150)

                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.white, lineWidth: 5)
                    .frame(width:70, height: 70)
                    .offset(x:80, y: 150)
            }
        }
    }
}

#Preview {
    BorderView()
}
