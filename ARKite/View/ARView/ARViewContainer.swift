//
//  ARViewContainer.swift
//  ARKite
//
//  Created by Maheswara Ananta Argono on 28/11/22.
//

import SwiftUI
import RealityKit
import ARKit

struct ARViewContainer: UIViewRepresentable {
    @State var arView: ARView
    @State var anchor: (Entity & HasAnchoring)
    
    func makeUIView(context: Context) -> ARView {
        
        arView.addCoaching()
        
        print("ARViewContainer: Layangan belum muncul")
        
        arView.scene.anchors.append(anchor)
        
        print("ARViewContainer: Layangan muncul")
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
}
