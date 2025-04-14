//
//  Chip_Api.swift
//  practice-2025
//
//  Created by matsumotoryota on 2025/04/03.
//w

import SwiftUI
//MARK: - Model -
struct ChipApiModel : Identifiable {
    var isSelected : Bool
    var id: Int
    var title: String
}

//MARK: - ViewModel
class ChipApiViewModel : ObservableObject {
    @Published var items : [ChipApiModel] = [
        ChipApiModel(isSelected: false, id: 1, title: "月曜日")
    ]
}

struct Chip_Api: View {
    var body: some View {
        Text("Hello World")
    }
}

#Preview {
    Chip_Api()
}

