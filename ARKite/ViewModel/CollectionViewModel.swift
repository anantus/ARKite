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
    @Published var volumeSFX: CGFloat = 1.0
    @Published var volumeMusic: CGFloat = 1.0
    @Published var gestures: Bool = false
    
    let keys = Keys()
    
    init(){
        coins = keys.defaults.integer(forKey: Keys.coins)
        kiteCollection = keys.defaults.value(forKey: Keys.kiteCollection) as? [Kite] ?? kiteInitial()
        volumeSFX = keys.defaults.value(forKey: Keys.volumeSFX) as? CGFloat ?? 1.0
        volumeMusic = keys.defaults.value(forKey: Keys.volumeMusic) as? CGFloat ?? 1.0
        gestures = keys.defaults.bool(forKey: Keys.gestures)
        
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
        Kite(name: "RedYellowKite", price: 0),
        Kite(name: "BajajKite", price: 1),
        Kite(name: "StripeKite", price: 2),
        Kite(name: "FloralKite", price: 3),
        ]
        return kiteCollectionInit
    }
    
    func setUserVolumeSFX(volume: CGFloat){
        keys.defaults.set(volume, forKey: Keys.volumeSFX)
        self.volumeSFX = volume
    }
    
    func setUserVolumeMusic(volume: CGFloat){
        keys.defaults.set(volume, forKey: Keys.volumeMusic)
        self.volumeMusic = volume
    }
    
    func setUserGestures(gestures: Bool){
        keys.defaults.set(gestures, forKey: Keys.gestures)
        self.gestures = gestures
    }
}
