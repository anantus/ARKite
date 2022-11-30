//
//  SettingVARView.swift
//  ARKite
//
//  Created by Ricky Silitonga on 30/11/22.
//

import SwiftUI

struct SettingVARView: View {
    var body: some View {
        ZStack {
            SettingFrame()
            
            VStack {
                Text("PENGATURAN")
                    .font(.system(.title, design: .default, weight: .heavy))
                    .foregroundColor(Color.init(hex: "8B2E00"))
                
                Spacer()
                // slider
                Group {
                    HStack {
                        Text("MUSIK")
                            .font(.system(.body, design: .default, weight: .bold))
                            .foregroundColor(Color.init(hex: "8B2E00"))
                        
                        // SLIDER
                        
                        
                    }
                }
                Spacer()
                
                // button lanjut dan akhiri
                Group {
                    
                }
            }
            .padding(.vertical, 40)
            .padding(.horizontal, 20)
            .frame(width: 355,height: 494, alignment: .center)
            
        }
    }
}

struct SettingVARView_Previews: PreviewProvider {
    static var previews: some View {
        SettingVARView()
    }
}
