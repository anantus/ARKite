//
//  PauseARView.swift
//  ARKite
//
//  Created by Ricky Silitonga on 04/12/22.
//

import SwiftUI
import RealityKit
import ARKit

struct PauseARView: View {
    @Binding var showPause: Bool
    @Binding var ARView: ARView
    
    @Environment(\.presentationMode) var showKoleksi
    
    @State var musicVolume: CGFloat = 0.7
    @State var soundEffectVolume: CGFloat = 0.6
    @State var selectedGesture: GestureSetting = .classic
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.white.opacity(0))
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            
            SettingFrame(width: 355, height: 500)
            
            VStack {
                Text("PENGATURAN")
                    .font(.system(.title, design: .default, weight: .heavy))
                    .foregroundColor(Color.init(hex: "8B2E00"))
                    .padding(.top, 10)
                
                Spacer()
                
                // slider
                HStack {
                    Text("MUSIK")
                        .font(.system(.body, design: .default, weight: .bold))
                        .foregroundColor(Color.init(hex: "8B2E00"))
                    
                    Spacer()
                    // SLIDER
                    HStack {
                        CustomSliderV2(sliderWidth: 184, progress: $musicVolume)
                    } .padding(.trailing, 10)
                    
                    
                }
                
                HStack {
                    Text("EFEK SUARA")
                        .font(.system(.body, design: .default, weight: .bold))
                        .foregroundColor(Color.init(hex: "8B2E00"))
                    
                    Spacer()
                    // SLIDER
                    HStack {
                        CustomSliderV2(sliderWidth: 184, progress: $soundEffectVolume)
                    } .padding(.trailing, 10)
                    
                    
                }
                
                HStack {
                    Text("KONTROL")
                        .font(.system(.body, design: .default, weight: .bold))
                        .foregroundColor(Color.init(hex: "8B2E00"))
                    
                    Spacer()
                    // SLIDER
                    CustomSwitchButton(gesture: $selectedGesture)
                        .padding(.trailing, 10)
                    
                }
                Spacer()
                
                // button lanjut dan akhiri
                VStack(spacing: 20) {
                    Button {
                        //TODO: -BACK TO THE GAME AND DISMISS MODAL
                        showPause.toggle()
                    } label: {
                        PrimaryButton(firstColor: "0099BB",
                                      secondColor: "00608B",
                                      bgColor: "00496B",
                                      width: 246,
                                      height: 61,
                                      text: "LANJUTKAN"
                        )
                    }
                    
                    
                    
                    Button {
                        DispatchQueue.main.async {
                            ARView.scene.anchors.removeAll()
                        }

                    } label: {
                        NavigationLink {
                            
                            DashboardViewV2().navigationBarBackButtonHidden(true)
                        }label: {
                            SecondaryButton(firstColor: "FC3E45",
                                            secondColor: "BA2424",
                                            bgColor: "9C1C1C",
                                            width: 246,
                                            height: 61,
                                            text: "Akhiri Permainan"
                            )
                        }
                    }
                    
                    
                } .padding(.vertical, 10)
            }
            .padding(.vertical, 40)
            .padding(.horizontal, 20)
            .frame(width: 355,height: 494, alignment: .center)
            
        }
        
    }
}

struct PauseARView_Previews: PreviewProvider {
    static var previews: some View {
        PauseARView(showPause: .constant(false), ARView: .constant(ARView()))
    }
}

