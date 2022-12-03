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
            
            VStack{
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(kiteCount, id: \.self) { item in
                        if item%2 == 1{
                            LayanganFrame1(firstColor: "FBC300", secondColor: "FEB914", thirdColor: "FFF7C6", bgColor: "BB8800", width: 164, height: 200, picture: "Kite 1")
                        } else{
                            LayanganFrame2(firstColor: "FBC300", secondColor: "FEB914", thirdColor: "FFF7C6", bgColor: "BB8800", width: 164, height: 190, picture: "Kite 2")
                        }
                        
                        
                    }
                }
                .padding(.top, 80)
                .padding(.horizontal)
                .frame(maxHeight: 300)
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
