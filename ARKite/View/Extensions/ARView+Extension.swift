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
        
        coachingOverlay.delegate = self
        coachingOverlay.session = self.session
        coachingOverlay.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // MARK: CoachingGoal
        coachingOverlay.goal = .horizontalPlane
        
        addSubview(coachingOverlay)
    }
    
    
    public func coachingOverlayViewDidDeactivate(_ coachingOverlayView: ARCoachingOverlayView) {
        coachingOverlayView.activatesAutomatically = false
        
        print("DEBUG: Coaching done and entity appear")
    }
}
