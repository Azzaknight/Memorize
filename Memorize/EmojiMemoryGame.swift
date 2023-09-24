//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Arunsakh Sachamuneewongse on 24/9/23.
//

import SwiftUI


// The ViewModel can be seen as the Butler for the View
// It arranges the model data for the view nicely

// The ViewModel for the game
class EmojiMemoryGame {
    
    private static let emojis = ["👻","🎃","👹","🕷","🧙‍♀️","🧛🏻‍♀️","💀","🧟","🕸️","🍭"]
    
    private var model = MemoryGame(numberOfPairOfCards: 4) { pairIndex in
        if emojis.indices.contains(pairIndex){
            return emojis[pairIndex]
        } else {
            return "⁉️"
        }
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // Intent function - the users intent to select a card! 
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
