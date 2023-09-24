//
//  MemoryGame.swift
//  Memorize
//
//  Created by Arunsakh Sachamuneewongse on 24/9/23.
//

import Foundation

// The Model for the game
struct MemoryGame<CardContent> {
    
    private(set) var cards: Array<Card>
    
    init(numberOfPairOfCards: Int, cardContentFactory: (Int) -> CardContent ){
        cards = []
        // add number of pair of cards x 2
        for pairIndex in 0..<max(2,numberOfPairOfCards) {
            
            let content = cardContentFactory(pairIndex)
            
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    func choose(_ card: Card) {
        
    }
    
    
    struct Card {
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
    }
}
