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
    
}
