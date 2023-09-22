//
//  ContentView.swift
//  Memorize
//
//  Created by Arunsakh Sachamuneewongse on 23/9/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
    
        HStack{
            CardView(symbol: "👻")
            CardView(symbol: "🎃")
            CardView(symbol: "👹")
            CardView(symbol: "🕷")
            
        }
        
        .foregroundColor(.orange)
        .padding()
    }
}


struct CardView: View {
    
    @State var isFaceUp = true
    var symbol: String
    
    
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
