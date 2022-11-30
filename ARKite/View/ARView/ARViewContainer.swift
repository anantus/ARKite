//
//  ARViewContainer.swift
//  ARKite
//
//  Created by Maheswara Ananta Argono on 28/11/22.
//

import SwiftUI
import RealityKit
import ARKit
import Combine

struct ARViewContainer: UIViewRepresentable {
    @State var anchor: Experience.ARKite
    @State var arView: ARView
    @State var collisionSubs: [Cancellable] = []
    
    func makeUIView(context: Context) -> ARView {
        var kiteEntity = anchor.kite!
        kiteEntity.generateCollisionShapes(recursive: true)
//        kiteEntity.components[CollisionComponent] = CollisionComponent(
//            shapes: [.generateBox(size: [1, 1, 1])],
//            mode: .trigger,
//          filter: .sensor
//        )
        
        arView.scene.anchors.append(anchor)
        
//
//        // subscribe collision event
//        if let scene = kiteEntity.scene {
//            collisionSubs.append(scene.subscribe(to: CollisionEvents.Began.self, on: kiteEntity) { event in
//                print("NABRAKKKK!!!")
//            })
//        }
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
}
