//
//  SettingView.swift
//  ARKite
//
//  Created by Amalia . on 12/11/22.
//

import SwiftUI

struct SettingNonARView: View {

//    @State var showSettingNonARView = false
    @Binding var showSettingNonARView: Bool
    @State var musicVolume: CGFloat = 1.0
    @State var soundEffectVolume: CGFloat = 1.0
    @State var selectedGesture: GestureSetting = .classic
    
    @ObservedObject var collectVM: CollectionViewModel
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.white.opacity(0))
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                
            SettingFrame(width: 355, height: 450)
            
            VStack {
                Text("PENGATURAN")
                    .font(.system(.title, design: .default, weight: .heavy))
                    .foregroundColor(Color.init(hex: "8B2E00"))
                    .padding(.top, 35)
                
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
                    Button {
                        // TODO: - LANJUTKAN
//                        self.showSettingNonAR.wrappedValue.dismiss()
                        self.showSettingNonARView.toggle()
                        self.collectVM.setUserVolumeMusic(volume: musicVolume)
                        self.collectVM.setUserVolumeSFX(volume: soundEffectVolume)
                        self.collectVM.setUserGestures(gestures: selectedGesture == .classic ? false : true)
                        
                        
                    } label: {
                        MainMenuButton(firstColor: "FC3E45",
                                       secondColor: "BA2424",
                                       bgColor:  "9C1C1C",
                                       width: 248,
                                       height: 65,
                                       text: "KELUAR"
                        )
                        
                    }
                    
                .padding(.bottom, 60)
            }
            .padding(.vertical, 40)
            .padding(.horizontal, 20)
            .frame(width: 355,height: 494, alignment: .center)
            
        }
        .onAppear{
            self.soundEffectVolume = collectVM.volumeSFX
            self.musicVolume = collectVM.volumeMusic
            self.selectedGesture = collectVM.gestures == false ? .classic : .gesture
        }
    }
}
