//
//  ARViewContainer.swift
//  ARKite
//
//  Created by Maheswara Ananta Argono on 28/11/22.
//

import SwiftUI
import RealityKit
import ARKit

struct ChooseKiteViewContainer: UIViewRepresentable {
    @State var arView: ARView
    @State var anchor: Experience.ChooseAR
    
    func makeUIView(context: Context) -> ARView {
//        self.arView.scene.anchors.removeAll()
        self.arView.scene.anchors.append(anchor)
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
}

struct RedYellowKiteViewContainer: UIViewRepresentable {
    @State var arView: ARView
    @State var anchor: Experience.RedYellowKite
    
    func makeUIView(context: Context) -> ARView {
        self.arView.scene.anchors.removeAll()
        self.arView.scene.anchors.append(anchor)
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
}

struct StripeKiteViewContainer: UIViewRepresentable {
    @State var arView: ARView
    @State var anchor: Experience.StripeKite
    
    func makeUIView(context: Context) -> ARView {
        self.arView.scene.anchors.removeAll()
        self.arView.scene.anchors.append(anchor)
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
}

struct BajajKiteViewContainer: UIViewRepresentable {
    @State var arView: ARView
    @State var anchor: Experience.BajajKite
    
    func makeUIView(context: Context) -> ARView {
        self.arView.scene.anchors.removeAll()
        self.arView.scene.anchors.append(anchor)
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
}

struct FloralKiteViewContainer: UIViewRepresentable {
    @State var arView: ARView
    @State var anchor: Experience.FloralKite
    
    func makeUIView(context: Context) -> ARView {
        self.arView.scene.anchors.removeAll()
        self.arView.scene.anchors.append(anchor)
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
}
