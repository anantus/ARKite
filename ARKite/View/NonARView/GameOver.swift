//
//  PauseView.swift
//  ARKite
//
//  Created by Ricky Silitonga on 03/12/22.
//

import SwiftUI

struct GameOver: View {
    let coinCount: Int
    let lanjutkanAction: () -> Void
    let akhiriAction: () -> Void
    @EnvironmentObject var coordinator : Coordinator
    
    var body: some View {
        ZStack {
            SettingFrame(width: 355, height: 450)
            
            VStack {
                VStack {
                    Text("PERMAINAN")
                        .font(.system(.title, design: .default, weight: .heavy))
                        .foregroundColor(Color.init(hex: "8B2E00"))
                    
                    Text("BERAKHIR")
                        .font(.system(.title, design: .default, weight: .heavy))
                        .foregroundColor(Color.init(hex: "8B2E00"))
                }
                
                VStack {
                    Text("Yah, layanganmu rusak.")
                        .font(.system(.body, design: .default, weight: .heavy))
                        .foregroundColor(Color.init(hex: "8B2E00"))
                    Text("Kamu berhasil mengumpulkan ")
                        .font(.system(.body, design: .default, weight: .heavy))
                        .foregroundColor(Color.init(hex: "8B2E00"))
                    Text("YangCoin sebanyak")
                        .font(.system(.body, design: .default, weight: .heavy))
                        .foregroundColor(Color.init(hex: "8B2E00"))
                }.padding(.vertical, 15)
                
                
                ZStack {
                    CoinFramePath()
                        .fill(Color.init(hex: "8B2E00"))
                        
                    
                    HStack(spacing: 18) {
                        Image("coinIcon")
                            .resizable()
                            .frame(width: 34, height: 34)
                        
                        Text("\(coinCount)")
                            .font(.system(.title, design: .default, weight: .semibold))
                            .foregroundColor(Color.white)
                    }
                }
                .frame(width: 170, height: 54)
                .padding(.bottom, 10)
                
                
                // button lanjut dan akhiri
                VStack {
//                    Button(action: {
//                        coordinator.playAgain()}) {
//                        MainMenuButton(firstColor: "0099BB",
//                                       secondColor: "00608B",
//                                       bgColor: "00496B",
//                                       width: 248,
//                                       height: 65,
//                                       text: "LANJUTKAN")
//                    }
                    
                    Button(action: {
                        coordinator.popToHomePage()}) {
                        SecondaryButton(firstColor: "FC3E45",
                                        secondColor: "BA2424",
                                        bgColor: "9C1C1C",
                                        width: 246,
                                        height: 61,
                                        text: "AKHIRI PERMAINAN")
                    }
                }
                .padding(.bottom, 26)
            }
            .padding(.vertical, 40)
            .padding(.horizontal, 20)
            .frame(width: 355,height: 494, alignment: .center)
            
        }
    }
}

struct CoinFramePath: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        //start point - Top left
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        
        //Move to top right
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY + 4))
        
        //Move to bottom right
        path.addLine(to: CGPoint(x: rect.maxX - 9 , y: rect.maxY))
        
        //Move to bottom left
        path.addLine(to: CGPoint(x: rect.minX + 6, y: rect.maxY))
        
        //end at top right
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        
        return path
    }
}

struct GameOver_Previews: PreviewProvider {
    static var previews: some View {
        GameOver(coinCount: 100, lanjutkanAction: {}, akhiriAction: {} )
    }
}
