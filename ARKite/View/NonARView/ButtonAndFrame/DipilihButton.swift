//
//  DipilihButton.swift
//  ARKite
//
//  Created by Amalia . on 02/12/22.
//

import SwiftUI

struct DipilihButton: View {
    
    var body: some View {
        ZStack{
            FrontButtons()
                .fill(Color.init(hex: "9C1C1C"))
                .frame(width: 127, height: 33)
                .padding(.trailing, (130 * 0.02))
                .padding(.top, (36 * 0.2))
            FrontButtons()
                .fill(.linearGradient(colors: [Color.init(hex: "FC3E45"), Color.init(hex: "BA2424")], startPoint: .top, endPoint: .bottom))
                .frame(width: 127, height: 33)
                .overlay {
                    Text("DIPILIH")
                        .foregroundColor(.white)
                        .font(.system(size: 17, weight: .heavy, design: .rounded))
                }
            
        }
    }
}


struct DipilihButton_Previews: PreviewProvider {
    static var previews: some View {
        DipilihButton()
    }
}
