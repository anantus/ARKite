//
//  ChooseKiteView.swift
//  ARKite
//
//  Created by Maheswara Ananta Argono on 04/12/22.
//

import SwiftUI

struct ChooseKiteView: View {
    
    @State var chooseKite: String = "No Kite"
    
    var body: some View {
        VStack{
            VStack{
                Button{
                    chooseKite = "BajajKite"
                }label: {
                    Text("Bajaj Kite")
                }
                Button{
                    chooseKite = "StripeKite"
                }label: {
                    Text("Stripe Kite")
                }
                Button{
                    chooseKite = "FloralKite"
                }label: {
                    Text("Floral Kite")
                }
                Button{
                    chooseKite = "RedYellowKite"
                }label: {
                    Text("Red Yellow Kite")
                }
            }
            
            NavigationLink(destination: LoadKiteView(kiteName: chooseKite)) {
                HStack {
                    Text("Pilih \(chooseKite)")
                        .foregroundColor(Color.black)
                }
            }
            .padding()
        }
        .background(Color.white)
    }
}

struct ChooseKiteView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseKiteView()
    }
}
