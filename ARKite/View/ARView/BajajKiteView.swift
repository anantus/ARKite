//
//  BajajKiteView.swift
//  ARKite
//
//  Created by Maheswara Ananta Argono on 17/10/22.
//

import SwiftUI
import RealityKit
import ARKit
import Combine
import CoreHaptics

struct BajajKiteView : View {
    @ObservedObject var vm = BajajKiteViewModel()
    
    @State var showContentView: Bool = false
    @State var isStartPlay = false
    @State var rotate = false
    @State var useButton = true
    @State var position = CGSize.zero
    @State var color = Color.white.opacity(0.0001)
    @State var pullPush = "None"
    
    @State var showPauseModal = false
    @State private var engine: CHHapticEngine?
    @State var instructionVideoName = "Instruction1NEW"
    
    
    var body: some View {
        ZStack {
            ARViewContainer(arView: vm.arView, anchor: vm.mainAnchor)
            
            // Buttons UI
            if vm.kiteIsAppear {
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
                        
//                        if vm.gameOver{
//                            // TODO: - GAME OVER
//                            GameOver(coinCount: 100)
//                                .onAppear{
//                                    UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
//                                }
//                        }
                        
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
                            if vm.showInstruction {
//                                if instructionVideoName == "Instruction1NEW" {
//
//                                    Timer.scheduledTimer(withTimeInterval: 0.8, repeats: false) { _ in
//                                        instructionVideoName = "Instruction2NEW"
//                                    }
//
//                                } else {
//                                    vm.showInstruction.toggle()
//                                    instructionVideoName = ""
//                                }
                                vm.showInstruction.toggle()
                                instructionVideoName = ""
                            } else {
                                //TODO: kiteBoost
                                vm.kiteFlyStart()
                                
                                withAnimation {
                                    isStartPlay.toggle()
                                    let haptic = UINotificationFeedbackGenerator()
                                    haptic.notificationOccurred(.success)
                                    prepareHaptics()
                                    complexSuccess()
                                    
                                }
                            }
                        } label: {
                            MainMenuButton(firstColor: "0099BB",
                                           secondColor: "00608B",
                                           bgColor: "00496B",
                                           width: 264,
                                           height: 78,
                                           text: (vm.showInstruction && instructionVideoName != "") ? "LEWATI" : "TERBANG"
                            )
                        }
                        
                        
                    } .padding(.bottom, 50)
                }
            }
        }
        .modifier(
            Popup(isPresented: showPauseModal, alignment: .center, content: {
                PauseARView(showPause: $showPauseModal, ARView: $vm.arView)
            })
        )
        .modifier(
            Popup(isPresented: vm.showInstruction, alignment: .center, content: {
                VideoView(videoName: $instructionVideoName)
            })
        )
        .modifier(
            Popup(isPresented: vm.gameOver, alignment: .center, content: {
                GameOver(
                    coinCount: vm.coinGame,
                    lanjutkanAction: {
                        // TODO: - LOAD ULANG GAME
                    },
                    akhiriAction: {
                        // TODO: - BALIK KE MAIN MENU
                        DispatchQueue.main.async {
//                            ARView.scene.anchors.removeAll()
                            vm.arView.scene.anchors.removeAll()
                        }
                    }
                ).onAppear {
                    UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
                }
                    
            })
        )
    }
    
    func prepareHaptics() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }

        do {
            engine = try CHHapticEngine()
            try engine?.start()
        } catch {
            print("There was an error creating the engine: \(error.localizedDescription)")
        }
    }
    
    func complexSuccess() {
        // make sure that the device supports haptics
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        var events = [CHHapticEvent]()

        // create one intense, sharp tap
        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 500)
        let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 500)
        let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 0)
        events.append(event)

        // convert those events into a pattern and play it immediately
        do {
            let pattern = try CHHapticPattern(events: events, parameters: [])
            let player = try engine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {
            print("Failed to play pattern: \(error.localizedDescription).")
        }
    }
}

