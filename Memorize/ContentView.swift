//
//  ContentView.swift
//  Memorize
//
//  Created by Arunsakh Sachamuneewongse on 23/9/23.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["👻","🎃","👹","🕷","🕸","🦇","💀"]
    @State var cardCount: Int = 4
    
    
    var body: some View {
    
        VStack {
            ScrollView {
                cards
            }
            Spacer()
            cardCountAdjusters
        }
        .padding()
    }
  
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button (action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
                
        })
        .disabled(cardCount + offset > emojis.count || cardCount + offset < 1)
    }
    
    var cardRemover: some View {
        
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.fill.badge.minus")
        
    }
    
    var cardAdder: some View {
        
        cardCountAdjuster(by: +1, symbol: "rectangle.stack.fill.badge.plus")
        
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]){
            
            ForEach(0..<cardCount, id: \.self ) { index in
                CardView(symbol: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    
    var cardCountAdjusters: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
}


struct CardView: View {
    
    @State var isFaceUp = true
    let symbol: String
    
    
    var body: some View {
       
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            //let base = Circle()
            
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(symbol).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            
            base.fill().opacity(isFaceUp ? 0: 1 )
        }
        .onTapGesture {
            isFaceUp.toggle()
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




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
