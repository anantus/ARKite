//
//  ARView+Extension.swift
//  ARKite
//
//  Created by Ricky Silitonga on 29/11/22.
//

import SwiftUI
import ARKit
import RealityKit

extension ARView: ARCoachingOverlayViewDelegate {
    
    func addCoaching() {
        
        let coachingOverlay = ARCoachingOverlayView()
        
        coachingOverlay.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        coachingOverlay.goal = .horizontalPlane
        coachingOverlay.session = self.session
        self.addSubview(coachingOverlay)
    }
    
    
    public func coachingOverlayViewDidDeactivate(_ coachingOverlayView: ARCoachingOverlayView) {
        // add the virtual object
        if self.scene.anchors.first(where: { $0.name == "ARKite" }) == nil {
            
            print("DEBUG: Kite belum muncul")
            return
        }
        
        print("DEBUG: Kite muncul")
    }
}
