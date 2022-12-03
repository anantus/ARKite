//
//  KiteEntity.swift
//  ARKite
//
//  Created by Maheswara Ananta Argono on 29/11/22.
//

import Foundation
import RealityKit

struct Kite: Identifiable{
    var id = UUID()
    let name: String
    let price: Int
    var isBought: Bool = false
    
    
}

struct KiteCollection{
    var id = UUID()
    var firstColor: String
    var secondColor: String
    var thirdColor: String
    var bgColor: String
    var width: CGFloat
    var height: CGFloat
    var picture: String
    
    
}
