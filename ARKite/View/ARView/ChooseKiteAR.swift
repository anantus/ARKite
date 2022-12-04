//
//  ContentView.swift
//  CobaPopUp
//
//  Created by Amalia . on 04/12/22.
//

import SwiftUI

struct Item: Identifiable {
    var id: Int
    var picture: String
    
}

class Store {
    var items: [Item]
    
    var pictures = ["Kite 1", "Kite 2", "Kite 3", "Kite 4"]
    
    // dummy data
    init() {
        items = []
        for i in 0...3 {
            let new = Item(id: i, picture: pictures[i])
            items.append(new)
        }
    }
}


struct ChooseKiteAR: View {
    @Environment(\.presentationMode) var showChooseKite
    @State var store = Store()
    @State private var snappedItem = 0.0
    @State private var draggingItem = 0.0
    @State var pickedStore: Int = -1
    
    var body: some View {
        NavigationView {
            VStack (spacing: 50) {
                Button {
                    self.showChooseKite.wrappedValue.dismiss()
                } label: {
                    BackButton()
                }
                .padding(.trailing, 300)
                PilihLayanganButton(width: 310, height: 96)
                ZStack {
                    ForEach(store.items) { item in
                        
                        // article view
                        
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
                                        //                                    NavigationLink {
                                        //
                                        //                                    } label: {
                                        Image(item.picture)
                                            .resizable()
                                            .frame(width: UIScreen.main.bounds.width * (3/10),height: UIScreen.main.bounds.height * (1.6/10))
                                            .rotationEffect(.degrees(30))
                                            .padding(.top, 8)
                                            .padding(.trailing, 5)
                                        //                                    }
                                    }
                                    if item.id == pickedStore {
                                        DipilihButton(firstColor: "FC3E45", secondColor: "BA2424", bgColor: "9C1C1C", width: 127, height: 33)
                                        
                                    } else {
                                        GunakanButton(firstColor: "0099BB", secondColor: "00608B", bgColor: "00496B", width: 127, height: 33)
                                    }
                                    
                                    
                                    
                                }
                                .onTapGesture {
                                    pickedStore = item.id

                                }
                                
                                
                            }
                        }
                        //                .frame(width: 200, height: 200)
                        
                        .scaleEffect(1.0 - abs(distance(item.id)) * 0.2 )
                        .opacity(1.0 - abs(distance(item.id)) * 0.3 )
                        .offset(x: myXOffset(item.id), y: 0)
                        .zIndex(1.0 - abs(distance(item.id)) * 0.1)
                        
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
                                draggingItem = round(draggingItem).remainder(dividingBy: Double(store.items.count))
                                snappedItem = draggingItem
                            }
                        }
                )
                
                NavigationLink {
//                    GameView()
                } label: {
                    MainMenuButton(firstColor: "0099BB",
                                   secondColor: "00608B",
                                   bgColor: "00496B",
                                   width: 266,
                                   height: 72,
                                   text: "MULAI")
                }
            }.padding(.bottom, 80)
        }
        .navigationBarBackButtonHidden(true)
    }
    
    func distance(_ item: Int) -> Double {
        return (draggingItem - Double(item)).remainder(dividingBy: Double(store.items.count))
    }
    
    func myXOffset(_ item: Int) -> Double {
        let angle = Double.pi * 2 / Double(store.items.count) * distance(item)
        return sin(angle) * 200
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseKiteAR()
    }
}

