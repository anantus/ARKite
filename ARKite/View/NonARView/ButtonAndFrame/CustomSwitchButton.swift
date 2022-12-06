//
//  CustomSwitchButton.swift
//  ARKite
//
//  Created by Ricky Silitonga on 03/12/22.
//

import SwiftUI

enum GestureSetting {
    case classic
    case gesture
}

struct CustomSwitchButton: View {
    @Binding var gesture: GestureSetting
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .center)) {
            RoundedRectangle(cornerRadius: 9)
                .fill(Color.init(hex: "8B2E00"))
                .frame(width: 184, height: 32)
            
            HStack(spacing: 0) {
                RoundedRectangle(cornerRadius: 7)
                    .fill(gesture == .classic ? Color.init(hex: "FFF4D0") : Color.init(hex: "8B2E00"))
                    .frame(width: 90, height: 28)
                    .overlay(alignment: .center) {
                        Text("KLASIK")
                            .foregroundColor(gesture == .classic ? Color.init(hex: "8B2E00") : Color.init(hex: "FFF4D0"))
                            .font(.system(.footnote, design: .default, weight: .bold))
                    }
                    .onTapGesture {
                        withAnimation {
                            gesture = .classic
                        }
                    }
                
                RoundedRectangle(cornerRadius: 7)
                    .fill(gesture == .gesture ? Color.init(hex: "FFF4D0") : Color.init(hex: "8B2E00"))
                    .frame(width: 90, height: 28)
                    .overlay(alignment: .center) {
                        Text("GESTUR")
                            .foregroundColor(gesture == .gesture ? Color.init(hex: "8B2E00") : Color.init(hex: "FFF4D0"))
                            .font(.system(.footnote, design: .default, weight: .bold))
                    }
                    .onTapGesture {
                        withAnimation {
                            gesture = .gesture
                        }
                    }
            }
        }
    }
}

struct CustomSwitchButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomSwitchButton(gesture: .constant(.classic))
    }
}
