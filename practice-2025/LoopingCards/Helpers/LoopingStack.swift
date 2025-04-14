import SwiftUI

struct LoopingCardsView: View {
    // カードのデータモデル
    struct CardModel: Identifiable {
        let id = UUID()
        let title: String
        let color: Color
    }
    
    // サンプルカード
    let cards: [CardModel] = [
        CardModel(title: "Card 1", color: .red),
        CardModel(title: "Card 2", color: .blue),
        CardModel(title: "Card 3", color: .green),
        CardModel(title: "Card 4", color: .orange),
        CardModel(title: "Card 5", color: .purple)
    ]
    
    // 表示するカードの数（実際のカード数の3倍にして無限スクロールを表現）
    var loopingCards: [CardModel] {
        cards + cards + cards
    }
    
    // スクロールの位置を制御するState
    @State private var scrollOffset: CGFloat = 0
    @State private var dragOffset: CGFloat = 0
    
    var body: some View {
        VStack {
            Text("LoopingCards")
                .font(.title)
                .padding()
            
            GeometryReader { geometry in
                let cardWidth: CGFloat = geometry.size.width * 0.8
                let cardSpacing: CGFloat = 10
                let middleIndex = loopingCards.count / 3
                
                ZStack {
                    // カードを横に並べる
                    HStack(spacing: cardSpacing) {
                        ForEach(loopingCards) { card in
                            CardView(card: card, width: cardWidth)
                        }
                    }
                    .offset(x: scrollOffset + dragOffset)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                dragOffset = value.translation.width
                            }
                            .onEnded { value in
                                scrollOffset += dragOffset
                                dragOffset = 0
                                
                                // コンテンツの幅を計算
                                let contentWidth = CGFloat(cards.count) * (cardWidth + cardSpacing)
                                
                                // スクロールが一周したら元の位置に戻す
                                if scrollOffset > 0 {
                                    scrollOffset -= contentWidth
                                } else if -scrollOffset > contentWidth {
                                    scrollOffset += contentWidth
                                }
                            }
                    )
                }
                .onAppear {
                    // 最初の表示位置を中央のセットにする
                    scrollOffset = -CGFloat(middleIndex) * (cardWidth + cardSpacing)
                }
            }
            .frame(height: 300)
            .padding()
        }
    }
}

// 個別のカードビュー
struct CardView: View {
    let card: LoopingCardsView.CardModel
    let width: CGFloat
    
    var body: some View {
        VStack {
            Text(card.title)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            Spacer()
        }
        .frame(width: width, height: 200)
        .background(card.color)
        .cornerRadius(15)
        .shadow(radius: 5)
    }
}

#Preview{
    LoopingCardsView()
}
