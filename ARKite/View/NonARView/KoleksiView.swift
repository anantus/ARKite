//
//  KoleksiView.swift
//  ARKite
//
//  Created by Amalia . on 02/12/22.
//

import SwiftUI

struct KoleksiView: View {
    @State var showKoleksi = false
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
                VStack(spacing: 0){
                    ZStack{
                        NavigationKoleksiFrame()
                            .position(x: UIScreen.main.bounds.width * (2.45/5),y: UIScreen.main.bounds.height * (-2.2/5))
                        BackButton()
                            .position(x: UIScreen.main.bounds.width * (0.6/5),y: UIScreen.main.bounds.height * (-1.3/5))
                        CoinIndicatorFrame(coinCount: 0)
                            .position(x: UIScreen.main.bounds.width * (4.2/5),y: UIScreen.main.bounds.height * (-1.3/5))
                        
                        
                    }
                    HStack {
                        LayanganFrame1(firstColor: "FBC300", secondColor: "FEB914", thirdColor: "FFF7C6", bgColor: "BB8800", width: 164, height: 198, picture: "Kite 1")
                        LayanganFrame2(firstColor: "FBC300", secondColor: "FEB914", thirdColor: "FFF7C6", bgColor: "BB8800", width: 164, height: 190, picture: "Kite 2")
                    }
                    HStack {
                        LayanganFrame1(firstColor: "FFFADF", secondColor: "E1DAB2", thirdColor: "FFF9D5", bgColor: "857D4C", width: 164, height: 198, picture: "Kite 3")
                        LayanganFrame2(firstColor: "FFFADF", secondColor: "E1DAB2", thirdColor: "FFF9D5", bgColor: "857D4C", width: 164, height: 198, picture: "Kite 4")
                    }.padding(.bottom, 90)
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
