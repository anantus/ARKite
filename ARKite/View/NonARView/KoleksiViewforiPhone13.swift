//
//  KoleksiViewforiPhone13.swift
//  ARKite
//
//  Created by Amalia . on 05/12/22.
//

import SwiftUI

struct KoleksiViewforiPhone13: View {
    @Environment(\.presentationMode) var showKoleksi
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    @State var vm : CollectionViewModel
    @State var isPicked = -1
    @State var isChosen = false
    
    var body: some View {
        ZStack{
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
                            print(UIDevice.current.name)
                            self.showKoleksi.wrappedValue.dismiss()
                        } label: {

                            BackButton()
                        }
                        CoinIndicatorFrame(coinCount: vm.coins)
                    }
                    .position(
                        x: UIScreen.main.bounds.width * (0.5),
                        y: UIScreen.main.bounds.height * (-0.39))


                }

            }
            
            VStack{
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(Array(1...vm.kiteCollection.count), id: \.self) { item in
                        if item%2 == 1{
                            let bought = (vm.kiteCollection[item-1].isBought)
                            LayanganFrame1(firstColor: bought||isChosen ? "FBC300" : "FFFADF",
                                           secondColor: bought||isChosen ? "FEB914" : "E1DAB2",
                                           thirdColor: bought||isChosen ? "FFF7C6" : "FFF9D5",
                                           bgColor: bought||isChosen ? "BB8800" : "857D4C",
                                           width: 164,
                                           height: 210,
                                           picture: vm.kiteCollection[item-1].picture, bought: bought||isChosen, prices: vm.kiteCollection[item-1].price)
                            .onTapGesture {
//                                vm.buyKite(kiteName: vm.kiteCollection[item-1].name)
                                isPicked = item
                                isChosen = (isPicked == item)
                            }
                            
                        } else{
                            let bought = vm.kiteCollection[item-1].isBought
                            LayanganFrame2(firstColor: bought||isChosen ? "FBC300" : "FFFADF",
                                           secondColor: bought||isChosen ? "FEB914" : "E1DAB2",
                                           thirdColor: bought||isChosen ? "FFF7C6" : "FFF9D5",
                                           bgColor: bought||isChosen ? "BB8800" : "857D4C",
                                           width: 164,
                                           height: 206,
                                           picture: vm.kiteCollection[item-1].picture, bought: bought, prices: vm.kiteCollection[item-1].price)
                            .onTapGesture {
//                                vm.buyKite(kiteName: vm.kiteCollection[item-1].name)
                                isPicked = item
                                isChosen = (isPicked == item)
                            }
                            
                        }
                        
                        
                    }
                }
                .padding(.top, UIScreen.main.bounds.height * 0.22)
                .padding(.horizontal)
                .frame(maxHeight: 300)
            }
        }
    }
}

struct KoleksiViewforiPhone13_Previews: PreviewProvider {
    static var previews: some View {
        KoleksiViewforiPhone13(vm: CollectionViewModel())
    }
}
