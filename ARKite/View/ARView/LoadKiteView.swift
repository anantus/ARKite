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
        if loadKite == "BajajKite" {
            return AnyView(BajajKiteView())
        }
        else if loadKite == "RedYellowKite" {
            return AnyView(RedYellowKiteView())
        } else if loadKite == "FloralKite" {
            return AnyView(FloralKiteView())
        } else if loadKite == "StripeKite"{
            return AnyView(StripeKiteView())
        }
        return AnyView(BajajKiteView())
    }
}

struct LoadKiteView_Previews: PreviewProvider {
    static var previews: some View {
        LoadKiteView(kiteName: "StripeKite")
    }
}
