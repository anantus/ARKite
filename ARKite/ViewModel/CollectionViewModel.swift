//
//  CollectionViewModel.swift
//  ARKite
//
//  Created by Maheswara Ananta Argono on 29/11/22.
//

import Foundation
import SwiftUI

class CollectionViewModel: ObservableObject{
    static let shared = CollectionViewModel()
    @Published var coins = 0
    
    @Published var kiteCollection = [Kite]()
    
    @Published var koleksiLayangan: [KiteCollection] = [
    KiteCollection(firstColor: "FBC300", secondColor: "FEB914", thirdColor: "FFF7C6", bgColor: "BB8800", width: 164, height: 190, picture: "Kite 1"),
    KiteCollection(firstColor: "FBC300", secondColor: "FEB914", thirdColor: "FFF7C6", bgColor: "BB8800", width: 164, height: 190, picture: "Kite 2")
    ]
    
    let keys = Keys()
    
    init(){
        coins = keys.defaults.integer(forKey: Keys.coins)
        kiteCollection = keys.defaults.value(forKey: Keys.kiteCollection) as! [Kite]
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
}
