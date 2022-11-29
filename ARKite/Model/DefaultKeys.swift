//
//  DefaultKeys.swift
//  ARKite
//
//  Created by Maheswara Ananta Argono on 29/11/22.
//

import Foundation

struct Keys {
    let defaults = UserDefaults.standard
    
    static let coins = "coins"
    static let kiteCollection = "kiteCollection"
    
    func saveUserDefault() {
        defaults.set(0, forKey: Keys.coins)
        defaults.set([], forKey: Keys.kiteCollection)
    }
    
}

