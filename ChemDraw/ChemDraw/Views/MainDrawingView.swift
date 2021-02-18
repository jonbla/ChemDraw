//
//  MainDrawingView.swift
//  ChemDraw
//
//  Created by Danny Sedlov on 2021-02-18.
//

import SwiftUI
import PencilKit

struct MainDrawingView_Previews: PreviewProvider {
    static var previews: some View {
        MainDrawingView()
    }
}

struct MainDrawingView: View {
    @State var canvas  = PKCanvasView()
    var body: some View {
        DrawingView(canvas: $canvas)
            .navigationTitle("Drawing")
            .navigationBarTitleDisplayMode(.inline)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.bottom/*@END_MENU_TOKEN@*/)
            .scaledToFill()
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
