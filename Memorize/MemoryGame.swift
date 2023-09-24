//
//  MemoryGame.swift
//  Memorize
//
//  Created by Arunsakh Sachamuneewongse on 24/9/23.
//

import Foundation

// The Model for the game
struct MemoryGame<CardContent> where CardContent : Equatable {
    
    private(set) var cards: Array<Card>
    
    init(numberOfPairOfCards: Int, cardContentFactory: (Int) -> CardContent ){
        cards = []
        // add number of pair of cards x 2
        for pairIndex in 0..<max(2,numberOfPairOfCards) {
            
            let content = cardContentFactory(pairIndex)
            
            cards.append(Card(content: content, id: "\(pairIndex+1)a"))
            cards.append(Card(content: content, id: "\(pairIndex+1)b"))
        }
    }
    
    mutating func choose(_ card: Card) {
        print("chose \(card)")
        if let chosenIndex = cards.firstIndex(of: card) {
            cards[chosenIndex].isFaceUp.toggle()
        }
    }
    
    mutating func shuffle() {
        cards.shuffle()
        print(cards)
    }
    
//    private func index(of card: Card) -> Int? {
//        for index in cards.indices {
//            if cards[index].id == card.id {
//                return index //TODO: fix the fixme
//            }
//        }
//
//        return nil
//    }
    
    struct Card : Equatable , Identifiable, CustomDebugStringConvertible {
        
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
        
        var id: String
        var debugDescription: String {
            "\(id):- \(content) \(isFaceUp ? "Face Up" : "Face Down") \(isMatched ? "Matched" : "" ) \n"
        }
    }
}
