//
//  ViewFactory.swift
//  ARKite
//
//  Created by Maheswara Ananta Argono on 07/12/22.
//

import Foundation
import SwiftUI

class ViewFactory {
    
    @ViewBuilder
    static func destinationToView(_ destination: Destination) -> some View{
        switch destination {
        case .chooseKiteAR:
            ChooseKiteAR()
            
//        case .loadKiteView(let kiteName):
//            LoadKiteView(kiteName: kiteName)
        
        case .koleksiView:
            KoleksiView()
            
//        case .redYellowKiteView:
//            RedYellowKiteView().navigationBarBackButtonHidden(true)
//            
//        case .stripeKiteView:
//            StripeKiteView().navigationBarBackButtonHidden(true)
//            
//        case .bajajKiteView:
//            BajajKiteView().navigationBarBackButtonHidden(true)
//            
//        case .floralKiteView:
//            FloralKiteView().navigationBarBackButtonHidden(true)
            
        }
        
    }
}
