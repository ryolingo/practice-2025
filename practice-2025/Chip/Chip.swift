//
//  Chip.swift
//  practice-2025
//
//  Created by matsumotoryota on 2025/04/02.
//

import SwiftUI

//MARK: - モデル -
struct ChipModel: Identifiable {
    var isSelected: Bool
    let id = UUID()
    let systemImage: String
    let titleKey: LocalizedStringKey
}
//MARK:  ViewModel
class ChipsViewModel :ObservableObject {
    @Published var chipsArray: [ChipModel] = [
        ChipModel(isSelected: false, systemImage: "square.and.arrow.up.badge.clock", titleKey: "Today"),
        ChipModel(isSelected: false, systemImage: "square.and.arrow.up.badge.clock", titleKey: "Yesterday"),
        ChipModel(isSelected: false, systemImage: "square.and.arrow.up.badge.clock", titleKey: "Last Week"),
        ChipModel(isSelected: false, systemImage: "square.and.arrow.up.badge.clock", titleKey: "next Week"),
        ChipModel(isSelected: false, systemImage: "square.and.arrow.up.badge.clock", titleKey: "Today"),
        ChipModel(isSelected: false, systemImage: "square.and.arrow.up.badge.clock", titleKey: "Yesterday"),
        ChipModel(isSelected: false, systemImage: "square.and.arrow.up.badge.clock", titleKey: "Last Week"),
        ChipModel(isSelected: false, systemImage: "square.and.arrow.up.badge.clock", titleKey: "next Week")
    ]
}
//MARK: ChipのView
struct ChipView: View {
    let systemImage : String
    let titleKey : LocalizedStringKey
    @Binding var isSelected: Bool

    
    var body: some View {
        HStack{
            Image.init(systemName: systemImage)
                .font(.body)
            
            Text(titleKey)
                .font(.body)
                .lineLimit(1)
            
        }
        .padding(.vertical, 4)
        .padding(.leading, 4)
        .padding(.trailing, 10)
        .foregroundColor(isSelected ? .white : .blue)
        .background(isSelected ? Color.blue : Color.white)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.blue, lineWidth: 1.5)
        )
        .scaleEffect(isSelected ? 1.1 : 1.0)
        .shadow(color: isSelected ? Color.blue : Color.clear, radius: 2)
        .onTapGesture {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.5)){
                isSelected.toggle()

            }
        }
    }
}
//MARK: ChipのContainer
struct ChipViewContainer: View {
    @ObservedObject var viewModel = ChipsViewModel()
    
    var body : some View {
        var width = CGFloat.zero
        var height = CGFloat.zero
        return GeometryReader { geo in
            ScrollView {
                LazyVGrid(
                    columns: [GridItem(.adaptive(minimum: 100, maximum: 150), spacing: 8)],
                    spacing: 8
                ) {
                    ForEach(0..<viewModel.chipsArray.count, id: \.self) { index in
                        ChipView(
                            systemImage: viewModel.chipsArray[index].systemImage,
                            titleKey: viewModel.chipsArray[index].titleKey,
                            isSelected: $viewModel.chipsArray[index].isSelected
                        )
                    }
                }
                .padding()
            }
            
        }
        .padding(.all, 5)
        
    }
    
}




#Preview {
    ChipViewContainer()
}
