//
//  CollectionViewModel.swift
//  ARKite
//
//  Created by Maheswara Ananta Argono on 29/11/22.
//

import Foundation
import SwiftUI

class CollectionViewModel: ObservableObject{
    
    // create shared
    static let shared = CollectionViewModel()
    
    @Published var coins = 22
    @Published var kiteCollection = [
        Kite(name: "RedYellowKite", price: 0, picture: "Kite 2", isBought: false),
        Kite(name: "StripeKite", price: 0, picture: "Kite 1", isBought: false),
        Kite(name: "BajajKite", price: 20, picture: "Kite 4", isBought: false),
        Kite(name: "FloralKite", price: 5, picture: "Kite 3", isBought: false),
    ]
    
    @Published var volumeSFX: Float = 1.0
    @Published var volumeMusic: Float = 1.0
    @Published var gestures: Bool = false
    
    
    let keys = Keys()
    
    init(){
        coins = keys.defaults.integer(forKey: Keys.coins)
        volumeSFX = keys.defaults.value(forKey: Keys.volumeSFX) as? Float ?? 1.0
        volumeMusic = keys.defaults.value(forKey: Keys.volumeMusic) as? Float ?? 1.0
        gestures = keys.defaults.bool(forKey: Keys.gestures)
        
        setUserCoin(coinSet: 22)
        
        if let data = keys.defaults.value(forKey: Keys.kiteCollection) as? Data {
            kiteCollection = try! PropertyListDecoder().decode([Kite].self, from: data)
        } else{
            do {
                let encodedDate: Data = try PropertyListEncoder().encode(kiteCollection)
                keys.defaults.set(encodedDate, forKey: Keys.kiteCollection)
            } catch {
                print(error)
            }
        }
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
        let kiteIndex = kiteCollection.firstIndex(of: kite)
        kite.isBought = true
        subtractCoin(kitePrice: kite.price)
        kiteCollection[kiteIndex!] = kite
        
        do {
            let encodedDate: Data = try PropertyListEncoder().encode(kiteCollection)
            keys.defaults.set(encodedDate, forKey: Keys.kiteCollection)
        } catch {
            print(error)
        }
    }
    
    func setUserVolumeSFX(volume: Float){
        keys.defaults.set(volume, forKey: Keys.volumeSFX)
        self.volumeSFX = volume
    }
    
    func setUserVolumeMusic(volume: Float){
        keys.defaults.set(volume, forKey: Keys.volumeMusic)
        self.volumeMusic = volume
    }
    
    func setUserGestures(gestures: Bool){
        keys.defaults.set(gestures, forKey: Keys.gestures)
        self.gestures = gestures
    }
}
