//
//  ContentView.swift
//  Memorize
//
//  Created by Arunsakh Sachamuneewongse on 23/9/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //@ViewBuilder
        // HStack<TupleView<CardView, CardView, CardView, CardView>>
        HStack{
            CardView(symbol: "👻", isFaceUp: true)
            CardView(symbol: "👻")
            CardView(symbol: "👻")
            CardView(symbol: "👻")
            
        }
        
        .foregroundColor(.orange)
        .padding()
    }
}


struct CardView: View {
    
    var symbol: String
    var isFaceUp = false
    
    var body: some View {
        if isFaceUp {
            ZStack {
                RoundedRectangle(cornerRadius: 12).foregroundColor(.white)
                RoundedRectangle(cornerRadius: 12).strokeBorder(lineWidth: 2)
                Text(symbol).font(.largeTitle)
            }
        } else {
            RoundedRectangle(cornerRadius: 12)
        }
    }
}











struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
