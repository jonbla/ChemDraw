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
                .preferredColorScheme(.dark)
        }
    }
}

//class Canvas: PKCanvasView {
//
//  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//    touches.forEach { touch in
//      print("touch location \(touch.location(in: self))")
//    }
//  }
//
//}

struct Home : View {
    @State var canvas  = PKCanvasView()
    @State var note = UIView();
    var body: some View{
        
        NavigationView{
            //            Draw View
            NoteView(canvas: $note)
                .navigationTitle("Cheat Sheet")
                .navigationBarTitleDisplayMode(.inline)
//            ScrollView {
                DrawingView(canvas: $canvas)
                    .navigationTitle("Drawing")
                    .navigationBarTitleDisplayMode(.inline)
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.bottom/*@END_MENU_TOKEN@*/)
                    .scaledToFill()
                    .navigationBarItems(trailing: Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "square.and.arrow.down")
                    }))
                    .scaledToFill()
//            }
//            .scaledToFill()
//            .ignoresSafeArea()
        }
        .edgesIgnoringSafeArea(.bottom)
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
        canvas.drawingPolicy = .anyInput
//        canvas.drawingPolicy = .pencilOnly
        
        return canvas
    }
    func updateUIView(_ uiView: PKCanvasView, context: Context) {
        
    }
}
