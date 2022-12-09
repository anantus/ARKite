//
//  KoleksiViewforiPhone8.swift
//  ARKite
//
//  Created by Amalia . on 05/12/22.
//

import SwiftUI

struct KoleksiViewforiPhone8: View {
    
    @Environment(\.presentationMode) var showKoleksi
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    @EnvironmentObject var vm : CollectionViewModel
    @State private var showingPopup = false
    
//    let kiteCount: [Int]
    
    
//    init(){
//        kiteCount = Array(1...vm.kiteCollection.count)
//    }
//
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
                        .position(x: UIScreen.main.bounds.width * 0.49,y: UIScreen.main.bounds.height * -0.65)
                    
                    HStack (spacing: 200) {
                        Button {
                            self.showKoleksi.wrappedValue.dismiss()
                        } label: {
                            
                            BackButton()
                        }
                        CoinIndicatorFrame(coinCount: vm.coins)
                    }
                    .position(
                        x: UIScreen.main.bounds.width * (0.5),
                        y: UIScreen.main.bounds.height * (-0.43))
                    
                    
                }
                
            }
            
            VStack{
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(0..<vm.kiteCollection.count, id: \.self) {index in
                        if index % 2 == 1 {
                            LayanganFrame1(width: 164,
                                           height: 210,
                                           picture: vm.kiteCollection[index].picture,
                                           bought: $vm.kiteCollection[index].isBought,
                                           prices: vm.kiteCollection[index].price
                            )
                            .onTapGesture {
                                if !vm.kiteCollection[index].isBought {
                                    if vm.coins >= vm.kiteCollection[index].price {
                                        vm.buyKite(kiteName: vm.kiteCollection[index].name)
                                    } else {
                                        showingPopup.toggle()
                                    }
                                    
                                }
                            }
                        } else {
                            LayanganFrame2(width: 164,
                                           height: 210,
                                           picture: vm.kiteCollection[index].picture,
                                           bought: $vm.kiteCollection[index].isBought,
                                           prices: vm.kiteCollection[index].price
                            )
                            .onTapGesture {
                                if !vm.kiteCollection[index].isBought {
                                    if vm.coins >= vm.kiteCollection[index].price {
                                        vm.buyKite(kiteName: vm.kiteCollection[index].name)
                                    } else {
                                        showingPopup.toggle()
                                    }
                                }
                            }
                        }
                    }
                }
                .padding(.top, UIScreen.main.bounds.height * 0.22)
                .padding(.horizontal)
                .frame(maxHeight: 300)
            }
        }
        .alert("YangCoin kamu kurang!", isPresented: $showingPopup) {
            Button("Oke") {
                // Handle the acknowledgement.
                showingPopup.toggle()
            }
        }
    }
}

//struct KoleksiViewforiPhone8_Previews: PreviewProvider {
//    static var previews: some View {
//        KoleksiViewforiPhone8(vm: CollectionViewModel())
//    }
//}
