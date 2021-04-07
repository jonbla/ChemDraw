//
//  ContentView.swift
//  ChemDraw
//
//  Created by Danny Sedlov on 2021-02-07.
//

import SwiftUI
import PencilKit

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice("iPad Pro (11-inch) (2nd generation)")
                .preferredColorScheme(.dark)
        }
    }
}

struct Home : View {
    @State var landUI = UIView();
    
    var body: some View{
        NavigationView{
            
            List {
                Note(title: "Note 1", desc: "Extra Info Here")
                Note(title: "Note 2", desc: "Extra Info Here")
                Note(title: "Note 3", desc: "Extra Info Here")
                Note(title: "Note 4", desc: "Extra Info Here")
            }
            .navigationTitle("Notes")
            
            Landing(canvas: $landUI)
                .navigationTitle("Landing")
                .navigationBarTitleDisplayMode(/*@START_MENU_TOKEN@*/.inline/*@END_MENU_TOKEN@*/)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}



struct Note: View {
    let title: String
    let desc: String
    
    var body: some View {
        NavigationLink(destination: MainDrawingView()){
            VStack {
                HStack {
                    Text(title)
                        .font(.title)
                        .multilineTextAlignment(.center)
                    
                    Image(systemName: "pencil")
                }
                Text(desc)
                    .font(.footnote)
            }
        }
    }
}

struct Landing : UIViewRepresentable {
    @Binding var canvas : UIView
    
    func makeUIView(context: Context) -> UIView {
        return canvas
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
}
