//
//  SettingView.swift
//  ARKite
//
//  Created by Amalia . on 12/11/22.
//

import SwiftUI

struct SettingNonARView: View {
    @Environment(\.presentationMode) var showSettingNonAR

//    @State var showSettingNonARView = false
    @Binding var showSettingNonARView: Bool
    @State var musicVolume: CGFloat = 1.0
    @State var soundEffectVolume: CGFloat = 1.0
    @State var selectedGesture: GestureSetting = .classic
    var collectVM: CollectionViewModel
    
    init(showSettingNonARView: Binding<Bool>, collectVM: CollectionViewModel){
        self._showSettingNonARView = showSettingNonARView
        self.collectVM = collectVM
        self.soundEffectVolume = collectVM.volumeSFX
        self.musicVolume = collectVM.volumeMusic
    }
    
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
    }
}

//struct SettingView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingNonARView()
//    }
//}

//ZStack{
//    Rectangle()
//        .fill(LinearGradient(gradient: Gradient(colors: [Color("Bekgron"), Color("Bekgron2")]), startPoint: .top, endPoint: .bottom))
//        .frame(width: 346, height: 415)
//        .cornerRadius(29)
//        .overlay(
//            RoundedRectangle(cornerRadius: 29).stroke(Color("Bekgron"), lineWidth: 8))
//        .shadow(color: Color("ChooseShadow") ,radius: 3, y: 3)
//    VStack{
//        ZStack{
//            Rectangle()
//                .fill(LinearGradient(gradient: Gradient(colors: [Color("Bekgron"), Color("Bekgron2")]), startPoint: .top, endPoint: .bottom))
//                .frame(width: 146, height: 56)
//                .cornerRadius(16)
//                .overlay(
//                    RoundedRectangle(cornerRadius: 16).stroke(Color("Bekgron"), lineWidth: 5))
//                .shadow(color: Color("ChooseShadow") ,radius: 3, y: 3)
//            StrokeText(text: "Settings", width: 1, color: Color("ChooseBorder"))
//                .foregroundColor(Color("Choose"))
//                .font(.system(size: 22, weight: .heavy, design: .rounded))
//                .shadow(color: Color("ChooseShadow") ,radius: 2)
//        }
//        .offset(y: -50)
//        HStack{
//            VStack(alignment: .leading, spacing: 50){
//                Text("Music")
//                    .font(.system(size: 22, weight: .heavy, design: .rounded))
//                    .foregroundColor(.white)
//                Text("Effect")
//                    .font(.system(size: 22, weight: .heavy, design: .rounded))
//                    .foregroundColor(.white)
//
//                Text("Controls")
//                    .font(.system(size: 22, weight: .heavy, design: .rounded))
//                    .foregroundColor(.white)
//            }
//            .padding()
//            VStack(spacing: 50){
//                Text(":")
//                    .font(.system(size: 22, weight: .heavy, design: .rounded))
//                    .foregroundColor(.white)
//                Text(":")
//                    .font(.system(size: 22, weight: .heavy, design: .rounded))
//                    .foregroundColor(.white)
//                Text(":")
//                    .font(.system(size: 22, weight: .heavy, design: .rounded))
//                    .foregroundColor(.white)
//            }
//            VStack(spacing: 50){
//                Rectangle()
//                    .fill(Color("ChooseShadow"))
//                    .frame(width: 170, height: 29)
//                    .cornerRadius(8)
//                Rectangle()
//                    .fill(Color("ChooseShadow"))
//                    .frame(width: 170, height: 29)
//                    .cornerRadius(8)
//                Rectangle()
//                    .fill(Color("ChooseShadow"))
//                    .frame(width: 170, height: 29)
//                    .cornerRadius(8)
//            }
//
//        }
//        Spacer()
//            .frame(height: 30)
//        ZStack{
//            Rectangle()
//                .fill(LinearGradient(gradient: Gradient(colors: [Color("Settings"), Color("Settings2")]), startPoint: .top, endPoint: .bottom))
//                .frame(width: 223, height: 65)
//                .cornerRadius(28)
//                .shadow(color: Color("SettingShadow"),radius: 2, y: 5)
//            StrokeText(text: "Close", width: 1, color: Color("SettingBorder"))
//                .foregroundColor(.white)
//                .font(.system(size: 28, weight: .heavy, design: .rounded))
//                .shadow(color: Color("SettingShadow") ,radius: 2)
//        }
//    }
//}
