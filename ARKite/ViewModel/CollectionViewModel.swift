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
    @Published var kiteCollection = [Kite]()
    
    let keys = Keys()
    
    init(){
        
        coins = keys.defaults.integer(forKey: Keys.coins)
        kiteCollection = keys.defaults.value(forKey: Keys.kiteCollection) as? [Kite] ?? kiteInitial()
    }

    
    //Function untuk set coin
    fileprivate func setUserCoin(coinSet: Int){
        keys.defaults.set(coinSet, forKey: Keys.coins)
        coins = coinSet
    }
    
    //Function untuk menambah koin setelah game
    func addCoin(coinsAfterGame: Int){
        coins += coinsAfterGame
        setUserCoin(coinSet: coins)
    }
    
    //Function untuk mengurang koin setelah beli kite
    func subtractCoin(kitePrice: Int){
        coins -= kitePrice
        setUserCoin(coinSet: coins)
    }
    
    func findKite(kiteName: String) -> Kite{
        return kiteCollection.filter({$0.name == kiteName})[0]
    }
    
    //Function untuk beli kite
    func buyKite(kiteName: String){
        var kite = findKite(kiteName: kiteName)
        kite.isBought = true
        subtractCoin(kitePrice: kite.price)
    }
    
    func kiteInitial() -> [Kite]{
        let kiteCollectionInit: [Kite] = [
            Kite(name: "RedYellowKite", price: 0, picture: "Kite 2", isBought: true),
            Kite(name: "StripeKite", price: 0, picture: "Kite 1", isBought: true),
            Kite(name: "BajajKite", price: 1, picture: "Kite 4"),
            Kite(name: "FloralKite", price: 3, picture: "Kite 3"),
        ]
        return kiteCollectionInit
    }
}
