//
//  LoadKiteView.swift
//  ARKite
//
//  Created by Maheswara Ananta Argono on 04/12/22.
//

import SwiftUI

struct LoadKiteView: View {
    @State var kiteName: String
    var body: some View {
        
        getDestination(loadKite: kiteName)
        
    }
    
    func getDestination(loadKite: String) -> AnyView {
        if loadKite == "Kite 1"{
            return AnyView(StripeKiteView())
        }else if loadKite == "Kite 2" {
            return AnyView(RedYellowKiteView())
        } else if loadKite == "Kite 3" {
            return AnyView(FloralKiteView())
        }
        
        return AnyView(BajajKiteView())
    }
}

struct LoadKiteView_Previews: PreviewProvider {
    static var previews: some View {
        LoadKiteView(kiteName: "StripeKite")
    }
}
