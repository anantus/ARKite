//
//  DipilihButton.swift
//  ARKite
//
//  Created by Amalia . on 02/12/22.
//

import SwiftUI

struct DipilihButton: View {
    @State var firstColor: String
    @State var secondColor: String
    @State var bgColor: String
    @State var width: CGFloat
    @State var height: CGFloat
    
    var body: some View {
        ZStack{
            FrontButtons()
                .fill(Color.init(hex: bgColor))
                .frame(width: width, height: height)
                .foregroundColor(Color.green)
                .padding(.trailing, (width * 0.02))
                .padding(.top, (height * 0.2))
            FrontButtons()
                .fill(.linearGradient(colors: [Color.init(hex: firstColor), Color.init(hex: secondColor)], startPoint: .top, endPoint: .bottom))
                .frame(width: width, height: height)
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
        DipilihButton(firstColor: "FC3E45", secondColor: "BA2424", bgColor: "9C1C1C", width: 130, height: 36)
    }
}
