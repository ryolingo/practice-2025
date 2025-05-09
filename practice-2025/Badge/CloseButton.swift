//
//  CloseButton.swift
//  practice-2025
//
//  Created by Ryota Matsumoto on 4/23/25.
//

import SwiftUI

struct CloseButton: View {
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text("name")
                    .font(.title3)
                    .fontWeight(.bold)
                
                Spacer()
                
                Button(action:{
                    print("tapped")
                }){
                    Image(systemName: "xmark")
                        .foregroundColor(.black)
                        .font(.title3)
                        .frame(width: 16, height: 16)
                        .padding(8)
                        .background(Color.blue.opacity(0.5))
                }
                .padding(.trailing, 8)
                .background(Color.red)
            }
            
            Spacer(minLength: 16)
                .fixedSize()
                
            Text("Add Contacttrwtrtrdfdsadsfdsfdfdsaffdafdafdsafdafdafdsafdsafdsafdsafdsafafdsadfdsadafdsafdsfdsafdafdfsadfsdfasdfsdafdsawttwe ")
                
            Spacer(minLength: 4)
                .fixedSize()
            
            Text("commentcommentcomment")
        }
        .padding(16)
        .background(
            ZStack{
                Color.gray.opacity(0.1)
            }
        )
    }
}

#Preview {
    VStack{
        CloseButton()
        CloseButton()
    }
}
