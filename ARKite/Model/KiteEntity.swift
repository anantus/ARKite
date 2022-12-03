//
//  KiteEntity.swift
//  ARKite
//
//  Created by Maheswara Ananta Argono on 29/11/22.
//

import Foundation
import RealityKit

struct Kite: Identifiable, Hashable{
    var id = UUID()
    let name: String
    let price: Int
    var isBought: Bool = false
}
