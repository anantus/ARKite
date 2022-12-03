//
//  KoleksiView.swift
//  ARKite
//
//  Created by Amalia . on 02/12/22.
//

import SwiftUI

struct KoleksiView: View {
    var body: some View {
        ZStack {
            VStack{
                ZStack{
                    Image("CloudNew2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.width * (6.5/5),height: UIScreen.main.bounds.height * (4.25/5))
                        .position(x: UIScreen.main.bounds.width * (1.8/5),y: UIScreen.main.bounds.height * (3.4/5))
                    Image("RumahMainPage")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .position(x: UIScreen.main.bounds.width * (2.5/5),y: UIScreen.main.bounds.height * (4.25/5))
                }
                .blur(radius: 5)
                ZStack{
                    Image("CloudNew1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.width * (6.5/5),height: UIScreen.main.bounds.height * (4.25/5))
                        .position(x: UIScreen.main.bounds.width * (4/5),y: UIScreen.main.bounds.height * (-1.8/5))
                            .blur(radius: 5)
                    NavigationKoleksiFrame()
                        .position(x: UIScreen.main.bounds.width * (2.45/5),y: UIScreen.main.bounds.height * (-2.75/5))
                    BackButton()
                        .position(x: UIScreen.main.bounds.width * (0.6/5),y: UIScreen.main.bounds.height * (-2/5))
                    CoinIndicatorFrame(coinCount: 100)
                        .position(x: UIScreen.main.bounds.width * (4.2/5),y: UIScreen.main.bounds.height * (-2/5))
                    
                        
                }
            }
            
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(gradient: Gradient(colors: [Color("BGMainPage1"), Color("BGMainPage2")]), startPoint: .top, endPoint: .bottom))
    }
}

struct KoleksiView_Previews: PreviewProvider {
    static var previews: some View {
        KoleksiView()
    }
}
