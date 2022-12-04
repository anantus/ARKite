//
//  RedYellowKiteView.swift
//  ARKite
//
//  Created by Maheswara Ananta Argono on 17/10/22.
//

import SwiftUI
import RealityKit
import ARKit
import Combine

struct RedYellowKiteView : View {
    @ObservedObject var vm = RedYellowKiteViewModel()
    
    @State var showContentView: Bool = false
    @State var isStartPlay = false
    @State var rotate = false
    @State var useButton = true
    @State var position = CGSize.zero
    @State var color = Color.white.opacity(0.0001)
    @State var pullPush = "None"
    
    
    @State var showPauseModal = false
    
    var body: some View {
        ZStack {
            RedYellowKiteViewContainer(arView: vm.arView, anchor: vm.mainAnchor)
            
            // Buttons UI
            if isStartPlay {
                VStack {
                    HStack {
                        Button {
                            showPauseModal.toggle()
                        } label: {
                            SettingButton()
                        }
                        Spacer()
                        
                        ZStack {
                            CoinIndicatorFrame(coinCount: vm.coinGame)
                            
                        }
                        
                        
                    }
                    
                    if vm.gameOver{
                        Text("GAME OVER!")
                            .foregroundColor(Color.red)
                            .onAppear{
                                UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
                            }
                    }
                    
                    Spacer()
                
                if useButton {
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
                                vm.kiteMoveFront()
                                // TODO: pull kite
                            } label: {
                                
                                TarikUlurButton(firstColor: "FC3E45", secondColor: "BA2424", text: "Tarik", isRotate: false)
                            }
                        }
                    }
                    }else{
                        VStack{
                            Text("")
                            HStack{
                                Spacer()
                            }
                            Spacer()
                        }
                        .background(color)
                        .gesture(
                            DragGesture()
                                .onChanged({ value in
                                    if position.height > 0 {
                                        pullPush = "Pull"
                                        //                                    color = Color.green.opacity(0.2)
                                        //                                    print("Pull is triggered")
                                    }else if position.height < 0 {
                                        pullPush = "Stretch"
                                        //                                    color = Color.red.opacity(0.2)
                                        //                                    print("Stretch is triggered")
                                    }
                                    position = value.translation
                                })
                                .onEnded(({ value in
                                    if pullPush == "Pull"{
                                        vm.pullRotateThread()
                                        vm.kiteMoveFront()
                                    }else if pullPush == "Stretch"{
                                        vm.stretchRotateThread()
                                        vm.kiteMoveUp()
                                    }
                                    pullPush = "None"
                                    //                                color = Color.blue.opacity(0.2)
                                    position = .zero
                                })
                                        )
                        )
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
                        MainMenuButton(firstColor: "0099BB",
                                       secondColor: "00608B",
                                       bgColor: "00496B",
                                       width: 264,
                                       height: 78,
                                       text: "TERBANG"
                        )
                    }
                    
                    
                } .padding(.bottom, 50)
            }
            
            
        }
        .modifier(
            Popup(isPresented: showPauseModal, alignment: .center, content: {
                PauseARView(showPause: $showPauseModal, ARView: $vm.arView)
            })
        )
    }
}

