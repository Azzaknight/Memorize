//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Arunsakh Sachamuneewongse on 23/9/23.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
    
        VStack {
            Text("Memorize!").font(.largeTitle)
            ScrollView {
                cards
            }
            
            Button("Shuffle") {
                viewModel.shuffle()
            }
        }
        .padding()
    }
  
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0){
            
            ForEach(viewModel.cards.indices, id: \.self ) { index in
                CardView(card: viewModel.cards[index])
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
            }
        }
        .foregroundColor(.orange)
    }
}


struct CardView: View {
    
    let card: MemoryGame<String>.Card
    
    var body: some View {
       
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            //let base = Circle()
            
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 100))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            
            base.fill().opacity(card.isFaceUp ? 0: 1 )
        }
    }
}






/*
 @ViewBuilder
 HStack<TupleView<CardView, CardView, CardView, CardView>>
 View Builders can do
 - Conditionals
 - List
 - local variables
 - Switch (part of conditionals)
 */




struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
