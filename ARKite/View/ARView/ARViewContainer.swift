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
        self.arView.scene.anchors.removeAll()
        self.arView.scene.anchors.append(anchor)
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
}
