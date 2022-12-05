//
//  KoleksiView.swift
//  ARKite
//
//  Created by Amalia . on 02/12/22.
//

import SwiftUI

struct KoleksiView: View {
    @Environment(\.presentationMode) var showKoleksi
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
                        .position(x: UIScreen.main.bounds.width * 0.49,y: UIScreen.main.bounds.height * -0.55)
                    HStack (spacing: 200) {
                        Button {
                            self.showKoleksi.wrappedValue.dismiss()
                        } label: {
                            BackButton()
                        }
                        CoinIndicatorFrame(coinCount: vm.coins)
                    }.position(x: UIScreen.main.bounds.width * (0.5),y: UIScreen.main.bounds.height * (-0.39))
                    
                    
                }
                
            }
            
            VStack{
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(vm.kiteCollection) { item in
                            LayanganFrame1(firstColor: item.isBought ? "FBC300" : "FFFADF",
                                           secondColor: item.isBought ? "FEB914" : "E1DAB2",
                                           thirdColor: item.isBought ? "FFF7C6" : "FFF9D5",
                                           bgColor: item.isBought ? "BB8800" : "857D4C",
                                           width: 164,
                                           height: 200,
                                           picture: item.picture)
                        
                                
                               // LayanganFrame2(firstColor: item.isBought ? "FBC300" : "FFFADF",
//                                               secondColor: item.isBought ? "FEB914" : "E1DAB2",
//                                               thirdColor: item.isBought ? "FFF7C6" : "FFF9D5",
//                                               bgColor: item.isBought ? "BB8800" : "857D4C",
//                                               width: 164,
//                                               height: 190,
//                                               picture: item.picture)
                            
                            
                            
                            
                        
                        //                        if item%2 == 1{
                        //                            LayanganFrame1(firstColor: kiteCount[0]. ? "FBC300" : "FFFADF",
                        //                                           secondColor: "FEB914",
                        //                                           thirdColor: "FFF7C6",
                        //                                           bgColor: "BB8800",
                        //                                           width: 164,
                        //                                           height: 200,
                        //                                           picture: "Kite 1")
                        //                        } else{
                        //                            LayanganFrame2(firstColor: "FBC300", secondColor: "FEB914", thirdColor: "FFF7C6", bgColor: "BB8800", width: 164, height: 190, picture: "Kite 2")
                        //                        }
                        //
                        
                    }
                }
                .padding(.top, UIScreen.main.bounds.height * 0.1)
                .padding(.horizontal)
                .frame(maxHeight: 300)
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
        KoleksiView()
    }
}
