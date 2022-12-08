//
//  KoleksiView.swift
//  ARKite
//
//  Created by Amalia . on 02/12/22.
//

import SwiftUI

struct KoleksiView: View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    let vm = CollectionViewModel()
    
    let kiteCount: [Int]
    
    
    init(){
        kiteCount = Array(1...vm.kiteCollection.count)
    }
    
    
    var body: some View {
        ZStack {
            if UIDevice.current.name == "iPhone 8" || UIDevice.current.name == "iPhone SE" || UIDevice.current.name == "iPhone 8 Plus"   {
               KoleksiViewforiPhone8()
            }
            else if UIDevice.current.name == "iPhone Xs" || UIDevice.current.name == "iPhone 13 mini" || UIDevice.current.name == "iPhone 12 mini" || UIDevice.current.name == "iPhone 11 Pro" || UIDevice.current.name == "iPhone X" {
                KoleksiViewforiPhoneXS()
            }
            else {
               KoleksiViewforiPhone13()
            }
            
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(gradient: Gradient(colors: [Color("BGMainPage1"), Color("BGMainPage2")]), startPoint: .top, endPoint: .bottom))
        .navigationBarBackButtonHidden(true)
    }
}

struct KoleksiView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone 8", "iPhone 13 Pro Max"], id: \.self) { deviceName in
            KoleksiView()
                            .previewDevice(PreviewDevice(rawValue: deviceName))
                            .previewDisplayName(deviceName)
                  }
      
    }
}
//"iPhone XS", "iPhone 11 Pro Max", "iPhone 12 Pro Max", "iPhone 14 Pro", "iPhone 14 Pro Max"
