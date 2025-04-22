//
//  Test.swift
//  practice-2025
//
//  Created by Ryota Matsumoto on 4/21/25.
//

import SwiftUI

enum StatusType{
    case inReview
    case rejected
    case approved
}

private struct Test: View {
    @State private var status: StatusType
    init (status:StatusType){
        self._status = State(initialValue: status)
    }
    
    var body: some View {
        VStack {
            statusLabelView
        }
    }
    
    @ViewBuilder
    var statusLabelView : some View {
        if let status = statusParameters{
            Text(status.Text)
                .font(status.Font)
                .foregroundColor(status.Color)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(status.BorderColor, lineWidth: 1)
                )
        }
    }
    private var statusParameters:(Text:String , Font: Font, Color: Color , BorderColor : Color)? {
        switch status{
        case .inReview:
            return ("審査中", .title, .green, .green)
        case .rejected:
            return("却下", .title, .red, .red)
            
        case .approved:
            return .none
            
            
        }
    }
}


#Preview {
    VStack{
        Test(status: .inReview)
        Test(status: .rejected)
        Test(status: .approved)
    }
}

