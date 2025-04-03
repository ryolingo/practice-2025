import SwiftUI

struct DragCircleDate: View {
    // 各ボタンの状態を配列で管理
    @State private var buttonStates = [false, false, false, false, false]
    
    // ドラッグの追跡用
    @State private var isDragging = false
    @State private var initialDragValue = false
    
    // 円のサイズ
    let circleSize: CGFloat = 60
    let spacing: CGFloat = 15
    
    var body: some View {
        VStack(spacing: 20) {
            Text("指でなぞってボタンをオン/オフ")
                .font(.headline)
                .foregroundColor(.white)
            
            HStack(spacing: spacing) {
                ForEach(0..<buttonStates.count, id: \.self) { index in
                    // 各ボタンの実装
                    buttonView(index: index)
                }
            }
        }
        .padding()
        .background(Color.black)
    }
    
    private func buttonView(index: Int) -> some View {
        Circle()
            .fill(buttonStates[index] ? Color.orange : Color(white: 0.2))
            .frame(width: circleSize, height: circleSize)
            .overlay(
                Text("\(index + 1)")
                    .foregroundColor(buttonStates[index] ? .black : .white)
            )
            .gesture(
                DragGesture(minimumDistance: 0) // minimumDistance: 0でタップも検知する
                    .onChanged { value in
                        processTouch(at: index, position: value.location)
                        print(value.location)
                    }
            
                    .onEnded { _ in
                        // ドラッグ終了時のリセット
                        isDragging = false
                    }
            )
    }
    
    private func processTouch(at index: Int, position: CGPoint) {
        if !isDragging {
            // ドラッグ開始時は逆の状態をセット
            isDragging = true
            initialDragValue = !buttonStates[index]
        }
        print()
        
        // ドラッグ中は最初に触れたときの状態を適用
        withAnimation(.spring()) {
            buttonStates[index] = initialDragValue
        }
    }
}

struct DragCircleDate_Previews: PreviewProvider {
    static var previews: some View {
        DragCircleDate()
    }
}
