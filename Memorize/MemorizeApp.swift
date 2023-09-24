//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Arunsakh Sachamuneewongse on 23/9/23.
//

import SwiftUI

@main
struct MemorizeApp: App {
    
    @StateObject var game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
