//
//  SelectedButton.swift
//  ARKite
//
//  Created by Amalia . on 13/11/22.
//

import SwiftUI

struct SelectedButton: View {
    var body: some View {
        ZStack{
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [Color("Settings"), Color("Settings2")]), startPoint: .top, endPoint: .bottom))
                .frame(width: 103, height: 41)
                .cornerRadius(28)
                .shadow(color: Color("SettingShadow"),radius: 2, y: 5)
            StrokeText(text: "SELECTED", width: 1, color: Color("SettingBorder"))
                .foregroundColor(.white)
                .font(.system(size: 17, weight: .heavy, design: .rounded))
                .shadow(color: Color("SettingShadow") ,radius: 2)
        }
    }
}

struct SelectedButton_Previews: PreviewProvider {
    static var previews: some View {
        SelectedButton()
    }
}
