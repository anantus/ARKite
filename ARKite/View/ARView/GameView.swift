//
//  ContentView.swift
//  ARKite
//
//  Created by Maheswara Ananta Argono on 17/10/22.
//

import SwiftUI
import RealityKit
import ARKit
import Combine

struct GameView : View {
    
    @State var showContentView: Bool = false
    @State var isStartPlay = true
    @State var rotate = false
    @ObservedObject var vm = ARViewModel()
    
    
    var body: some View {
        ZStack {
            ARViewContainer(anchor: vm.mainAnchor, arView: vm.arView)
            
            // Buttons UI
            if isStartPlay {
                VStack {
                    HStack {
                        SettingButton()
                        
                        Spacer()
                        
                        ZStack {
                            CoinIndicatorFrame(coinCount: 10)
                            
                            HStack {
                                Image("coinIcon")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                            }.frame(width: 124, height: 50, alignment: .leading)
                            
                        }
                        
                        
                    }
                    
                    Spacer()
                    
                    HStack(alignment: .bottom) {
                        Spacer()
                        Spacer()
                        VStack(spacing: 14) {
                            Button {
                                vm.kiteMoveUp()
                                // TODO: stretch kite
                            } label: {
                                TarikUlurButton(firstColor: "00608B", secondColor: "0099BB", text: "Ulur", isRotate: true)
                            }
                            
                            
                            Button {
                                vm.kiteMoveDown()
                                vm.kiteMoveFront()
                                // TODO: pull kite
                            } label: {
                                
                                TarikUlurButton(firstColor: "FC3E45", secondColor: "BA2424", text: "Tarik", isRotate: false)
                            }
                        }
                    }
                } .padding()
            } else {
                VStack {
                    Spacer()
                    
                    Button {
                        //TODO: kiteBoost
                        vm.kiteFlyStart()
                        
                        withAnimation {
                            isStartPlay.toggle()
                            
                        }
                    } label: {
                        ZStack(alignment: .top) {
                            LinearGradient(gradient: Gradient(colors: [Color.init(hex: "9F6B00"), Color.init(hex: "C98A01")]), startPoint: .top, endPoint: .bottom)
                                .frame(width: 223, height: 65)
                                .contentShape(RoundedRectangle(cornerRadius: 31, style: .continuous))
                                .cornerRadius(31)
                            
                            
                            LinearGradient(gradient: Gradient(colors: [Color.init(hex: "F4DB05"), Color.init(hex: "F4970E")]), startPoint: .top, endPoint: .bottom)
                                .frame(width: 217, height: 58)
                                .contentShape(RoundedRectangle(cornerRadius: 28, style: .continuous))
                                .cornerRadius(28)
                                .overlay {
                                    VStack(spacing: 8) {
                                        Text("FLY")
                                            .font(.system(.title, design: .rounded, weight: .heavy))
                                            .foregroundColor(.white)
                                    }
                                }
                        }
                    }
                    
                    
                } .padding()
            }
            
            
        }
        
    }
}




#if DEBUG
struct GameView_Previews : PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
#endif

