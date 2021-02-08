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
        ContentView()
            .preferredColorScheme(.light)
    }
}

struct Home : View {
    @State var canvas  = PKCanvasView()
    @State var note = UIView();
    var body: some View{
        NavigationView{
//            Draw View
            NoteView(canvas: $note)
                .navigationTitle(/*@START_MENU_TOKEN@*/"Cheat Sheet"/*@END_MENU_TOKEN@*/)
                .navigationBarTitleDisplayMode(/*@START_MENU_TOKEN@*/.inline/*@END_MENU_TOKEN@*/)
            DrawingView(canvas: $canvas)
                .navigationTitle("Drawing")
                .navigationBarTitleDisplayMode(/*@START_MENU_TOKEN@*/.inline/*@END_MENU_TOKEN@*/)
        }
        
    }
}

struct NoteView : UIViewRepresentable {
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
    
    
//  get drawing for saving
    @Binding var canvas : UIView
    func makeUIView(context: Context) ->  UIView {
        //canvas.drawingPolicy = .anyInput
        
        return canvas
    }
}

struct DrawingView : UIViewRepresentable {
    
//  get drawing for saving
    @Binding var canvas : PKCanvasView
    func makeUIView(context: Context) ->  PKCanvasView {
        canvas.drawingPolicy = .pencilOnly
        
        return canvas
    }
    func updateUIView(_ uiView: PKCanvasView, context: Context) {
        
    }
}
