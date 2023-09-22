//
//  ContentView.swift
//  Memorize
//
//  Created by Arunsakh Sachamuneewongse on 23/9/23.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["👻","🎃","👹","🕷","🕸","🦇","💀"]
    
    var body: some View {
    
        HStack{
            
            ForEach(emojis.indices, id: \.self ) { index in
                CardView(symbol: emojis[index])
            }
        }
        
        .foregroundColor(.orange)
        .padding()
    }
}


struct CardView: View {
    
    @State var isFaceUp = true
    let symbol: String
    
    
    var body: some View {
       
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            //let base = Circle()
            
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(symbol).font(.largeTitle)
            } else {
                base.fill()
            }
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
