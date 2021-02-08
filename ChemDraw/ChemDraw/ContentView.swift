//
//  ContentView.swift
//  ChemDraw
//
//  Created by Danny Sedlov on 2021-02-07.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 59.85) {
            Text("Hello, world!")
                .multilineTextAlignment(.leading)
                .padding()
                .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                .foregroundColor(/*@START_MENU_TOKEN@*/.green/*@END_MENU_TOKEN@*/)
            Text(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/)
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundColor(Color.black)
        }
        .frame(width: 775.096)
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
