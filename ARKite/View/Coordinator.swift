//
//  Coordinator.swift
//  ARKite
//
//  Created by Maheswara Ananta Argono on 07/12/22.
//

import Foundation
import SwiftUI

class Coordinator: ObservableObject {
    @Published var path = NavigationPath()
    
    func popToHomePage() {
        path.removeLast(path.count)
        print(path.count)
    }
    
    func previousPage() {
        path.removeLast()
    }
    
    func displayKoleksiView(){
        path.append(Destination.koleksiView)
    }
    
    func displayChooseKite(){
        path.append(Destination.chooseKiteAR)
    }
    
    func displayLoadKite(loadKite: String){
//        path.append(Destination.loadKiteView(loadKite))

        if loadKite == "Kite 1"{
            path.append(Destination.stripeKiteView)
        }else if loadKite == "Kite 2" {
            path.append(Destination.redYellowKiteView)
        } else if loadKite == "Kite 3" {
            path.append(Destination.floralKiteView)
        }else{
            path.append(Destination.bajajKiteView)
        }
    }
    
    func displayRedKite(){
        path.append(Destination.redYellowKiteView)
    }

    func playAgain() {
        path.removeLast(path.count)
        path.append(Destination.chooseKiteAR)
        print(path.count)
    }
}
