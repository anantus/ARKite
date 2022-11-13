//
//  UseButton.swift
//  ARKite
//
//  Created by Amalia . on 13/11/22.
//

import SwiftUI

struct UseButton: View {
    var body: some View {
        ZStack{
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [Color("Play"), Color("Play2")]), startPoint: .top, endPoint: .bottom))
                .frame(width: 103, height: 41)
                .cornerRadius(28)
                .shadow(color: Color("PlayShadow"),radius: 2, y: 5)
            StrokeText(text: "USE", width: 1, color: Color("PlayBorder"))
                .foregroundColor(.white)
                .font(.system(size: 17, weight: .heavy, design: .rounded))
                .shadow(color: Color("PlayShadow") ,radius: 2)
        }
    }
}

struct UseButton_Previews: PreviewProvider {
    static var previews: some View {
        UseButton()
    }
}
