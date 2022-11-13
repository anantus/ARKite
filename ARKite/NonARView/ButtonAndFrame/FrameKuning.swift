//
//  FrameKuning.swift
//  ARKite
//
//  Created by Amalia . on 13/11/22.
//

import SwiftUI

struct FrameKuning: View {
    var body: some View {
        Rectangle()
            .fill(LinearGradient(gradient: Gradient(colors: [Color("Play"), Color("Play2")]), startPoint: .top, endPoint: .bottom))
            .frame(width: 146, height: 146)
            .cornerRadius(17)
            .shadow(radius: 5)
            .overlay(
                RoundedRectangle(cornerRadius: 17)
                    .stroke(Color("GradienKuning"), lineWidth: 10))
            
    }
}

struct FrameKuning_Previews: PreviewProvider {
    static var previews: some View {
        FrameKuning()
    }
}
