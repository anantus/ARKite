//
//  ContentView.swift
//  CobaPopUp
//
//  Created by Amalia . on 04/12/22.
//

import SwiftUI


struct ChooseKiteAR: View {
    @Environment(\.presentationMode) var showChooseKite
    @ObservedObject var vm = CollectionViewModel()
    @State private var snappedItem = 0.0
    @State private var draggingItem = 0.0
    @State var pickedKite: String = ""
    @EnvironmentObject var coordinator: Coordinator
    
    var body: some View {
        NavigationView {
            VStack (spacing: 50) {
                if UIDevice.current.name == "iPhone 8" || UIDevice.current.name == "iPhone Xs" || UIDevice.current.name == "iPhone 13 mini" || UIDevice.current.name == "iPhone 12 mini" || UIDevice.current.name == "iPhone 11 Pro" || UIDevice.current.name == "iPhone X" || UIDevice.current.name == "iPhone SE" {
                    Button {
                        self.showChooseKite.wrappedValue.dismiss()
                    } label: {
                        BackButton()
                    }
                    .padding(.trailing, 300)
                    .padding(.top, 60)
                } else {
                    Button {
                        self.showChooseKite.wrappedValue.dismiss()
                    } label: {
                        BackButton()
                    }
                    .padding(.trailing, 300)
                }
                PilihLayanganButton(width: 310, height: 96)
                ZStack {
                    ForEach(Array(0...vm.kiteCollection.count-1), id: \.self) { item in
                        let kite = vm.kiteCollection[item]
                        if kite.isBought == true{
                            ZStack {
                                ZStack{
                                    FrameBack1()
                                        .fill(Color.init(hex: "BB8800"))
                                        .frame(width: 194, height: 226)
                                        .cornerRadius(5)
                                        .padding(.trailing, (164 * 0.09))
                                        .padding(.top, (196 * 0.15))
                                    FrameFront1()
                                        .fill(.linearGradient(colors: [Color.init(hex: "FBC300"), Color.init(hex: "FEB914")], startPoint: .top, endPoint: .bottom))
                                        .frame(width: 194, height: 226)
                                        .cornerRadius(5)
                                    VStack {
                                        ZStack {
                                            FrameInner1()
                                                .fill(Color.init(hex: "FFF7C6"))
                                                .frame(width: 171, height: 150)
                                                .cornerRadius(5)
                                            Image(kite.picture)
                                                .resizable()
                                                .frame(width: UIScreen.main.bounds.width * (3/10),height: UIScreen.main.bounds.height * (1.6/10))
                                                .rotationEffect(.degrees(30))
                                                .padding(.top, 8)
                                                .padding(.trailing, 5)
                                        }
                                        if kite.picture == pickedKite {
                                            DipilihButton(firstColor: "FC3E45", secondColor: "BA2424", bgColor: "9C1C1C", width: 127, height: 33)
                                            
                                        } else {
                                            GunakanButton(firstColor: "0099BB", secondColor: "00608B", bgColor: "00496B", width: 127, height: 33)
                                        }
                                        
                                        
                                        
                                    }
                                    .onTapGesture {
                                        pickedKite = kite.picture
                                        
                                    }
                                    
                                    
                                }
                            }
                            //                .frame(width: 200, height: 200)
                            
                            .scaleEffect(1.0 - abs(distance(item)) * 0.2 )
                            .opacity(1.0 - abs(distance(item)) * 0.3 )
                            .offset(x: myXOffset(item), y: 0)
                            .zIndex(1.0 - abs(distance(item)) * 0.1)
                        }
                    }
                }
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            draggingItem = snappedItem + value.translation.width / 100
                            
                        }
                        .onEnded { value in
                            withAnimation {
                                draggingItem = snappedItem + value.predictedEndTranslation.width / 100
                                draggingItem = round(draggingItem).remainder(dividingBy: Double(vm.kiteCollection.filter({$0.isBought == true}).count))
                                snappedItem = draggingItem
                            }
                        }
                )
                NavigationLink {
                    LoadKiteView(kiteName: pickedKite).navigationBarBackButtonHidden(true)
                } label: {
                    MainMenuButton(firstColor: "0099BB",
                                   secondColor: "00608B",
                                   bgColor: "00496B",
                                   width: 266,
                                   height: 72,
                                   text: "MULAI")
                }
                .disabled(pickedKite == "")
            }.padding(.bottom, 80)
        }
        .navigationBarBackButtonHidden(true)
    }
    
    func distance(_ item: Int) -> Double {
        return (draggingItem - Double(item)).remainder(dividingBy: Double(vm.kiteCollection.filter({$0.isBought == true}).count))
    }
    
    func myXOffset(_ item: Int) -> Double {
        let angle = Double.pi * 2 / Double(vm.kiteCollection.filter({$0.isBought == true}).count) * distance(item)
        return sin(angle) * 200
    }
    
}

struct ChooseKiteAR_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone 8", "iPhone 14 Pro Max"], id: \.self) { deviceName in
            ChooseKiteAR()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
