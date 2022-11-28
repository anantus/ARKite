//
//  FrameIjo.swift
//  ARKite
//
//  Created by Amalia . on 13/11/22.
//

import SwiftUI

struct FrameIjo: View {
    var body: some View {
        Rectangle()
            .fill(LinearGradient(gradient: Gradient(colors: [Color("Kite"), Color("Kite2")]), startPoint: .top, endPoint: .bottom))
            .frame(width: 146, height: 146)
            .cornerRadius(17)
            .shadow(radius: 5)
            .overlay(
                RoundedRectangle(cornerRadius: 17)
                    .stroke(Color("GradienIjo"), lineWidth: 10))
    }
}

struct FrameIjo_Previews: PreviewProvider {
    static var previews: some View {
        FrameIjo()
    }
}
