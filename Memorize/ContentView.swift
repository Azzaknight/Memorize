//
//  ContentView.swift
//  Memorize
//
//  Created by Arunsakh Sachamuneewongse on 23/9/23.
//

import SwiftUI

struct ContentView: View {
    @State var emojis = ["👻","🎃","👹","🕷","🕷","👹","💀","👻","🎃","💀"].shuffled()
    let halloweenEmojis = ["👻","🎃","👹","🕷","🕷","👹","💀","👻","🎃","💀"]
    let smileyEmojis = ["😀","😀","😍","😍","🥸","🥸","🤩","🤩","😎","😎"]
    let animalEmojis = ["🦊","🦊","🐶","🐶","🐱","🐱","🦄","🦖","🦄","🦖"]
    @State var cardCount: Int = 4
    
    var body: some View {
    
        VStack {
            Text("Memorize!").font(.largeTitle)
            ScrollView {
                cards
            }
            cardThemeSelectors
        }
        .padding()
    }
  
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]){
            
            ForEach(0..<emojis.count, id: \.self ) { index in
                CardView(symbol: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    
    
    
    var smileyThemeSelector: some View {
        Button(action: {emojis = smileyEmojis.shuffled()}, label:
                {
            VStack {
                Image(systemName: "smiley.fill").font(.largeTitle)
                Text("Smiley").font(.body)
            }
        })
    }
    
    var halloweenThemeSelector: some View {
        Button(action: {emojis = halloweenEmojis.shuffled()}, label:
                {
            VStack {
                Image(systemName: "flame.fill").font(.largeTitle)
                Text("Halloween").font(.body)
            }
        })
    }
    
    var animalThemeSelector: some View {
        Button(action: {emojis = animalEmojis.shuffled()}, label:
                {
            VStack {
                Image(systemName: "pawprint.fill").font(.largeTitle)
                Text("Animal").font(.body)
            }
        })
    }
    
    var cardThemeSelectors: some View {
        HStack {
            Spacer()
            smileyThemeSelector
            Spacer()
            halloweenThemeSelector
            Spacer()
            animalThemeSelector
            Spacer()
        }
        .imageScale(.large)
        .font(.title)
    }
}


struct CardView: View {
    
    @State var isFaceUp = false
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
