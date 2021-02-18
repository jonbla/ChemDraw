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
    @State var canvas  = PKCanvasView()
    @State var note = UIView();
    var body: some View{
        
        NavigationView{
            List {
                Note(title: "Note 1")
                Note(title: "Note 2")
                Note(title: "Note 3")
                Note(title: "Note 4")
            }
                .navigationTitle("Notes")

//            ScrollView {
            DrawingView(canvas: $canvas)
                .navigationTitle("Drawing")
                .navigationBarTitleDisplayMode(.inline)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.bottom/*@END_MENU_TOKEN@*/)
                .scaledToFill()
//            }
//            .scaledToFill()
//            .ignoresSafeArea()
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct DrawingView : UIViewRepresentable {
    
//  get drawing for saving
    @Binding var canvas : PKCanvasView
    func makeUIView(context: Context) ->  PKCanvasView {
        canvas.drawingPolicy = .anyInput
        canvas.tool = PKInkingTool(.pen, color: .red, width: 10)
//        canvas.drawingPolicy = .pencilOnly
        
        //PKToolPicker
        let toolPicker = PKToolPicker()
        toolPicker.addObserver(canvas)
        toolPicker.setVisible(true, forFirstResponder: canvas)
        canvas.becomeFirstResponder()
        
        return canvas
    }
    func updateUIView(_ uiView: PKCanvasView, context: Context) {
        
    }
}

struct Note: View {
    let title: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.title)
                .multilineTextAlignment(.center)
            
            Image(systemName: "pencil")
        }
    }
}
