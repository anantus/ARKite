//
//  CollectionViewModel.swift
//  ARKite
//
//  Created by Maheswara Ananta Argono on 29/11/22.
//

import Foundation
import SwiftUI

class CollectionViewModel: ObservableObject{
    @Published var coins = 0
    @Published var kiteCollection = []
    let keys = Keys()
    
    init(){
        coins = keys.defaults.integer(forKey: Keys.coins)
        kiteCollection = keys.defaults.value(forKey: Keys.kiteCollection) as! [String]
    }
    
    
    //Function untuk set coin
    fileprivate func setUserCoin(coinSet: Int){
        keys.defaults.set(coinSet, forKey: Keys.coins)
        coins = coinSet
    }
    
    //Function untuk menambah koin setelah game
    func addCoin(coinsAfterGame: Int){
        setUserCoin(coinSet: coins + coinsAfterGame)
    }
    
    //Function untuk mengurang koin setelah beli kite
    func subtractCoin(kitePrice: Int){
        setUserCoin(coinSet: coins -  kitePrice)
    }
    
    
    
    
    
    
}
