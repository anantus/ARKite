//
//  TarikUlurButton.swift
//  ARKite
//
//  Created by Ricky Silitonga on 29/11/22.
//

import SwiftUI

struct TarikUlurButton: View {
    let firstColor: String
    let secondColor: String
    let text: String
    let isRotate: Bool
    
    var body: some View {
        TarikUlurPath()
            .fill(.linearGradient(colors: [Color.init(hex: firstColor), Color.init(hex: secondColor)], startPoint: .top, endPoint: .bottom))
            .frame(width: 94, height: 77)
            .rotation3DEffect(.degrees(180), axis: (x: 0, y: 0, z: ( isRotate ? 1 : 0 )))
            .overlay(alignment: .center) {
                Text(text)
                    .foregroundColor(.white)
                    .font(.system(.title2, design: .rounded, weight: .heavy))
            }
            .opacity(0.8)
    }
}

struct TarikUlurPath: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        //start point - Top left
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        
        //Move to top right
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY+6))
        
        //Move to bottom right
        path.addLine(to: CGPoint(x: rect.maxX-10, y: rect.maxY-4))
        
        //Move to bottom left
        path.addLine(to: CGPoint(x: rect.minX+10, y: rect.maxY))
        
        //end at top right
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        
        return path
    }
}



struct TarikUlurButton_Previews: PreviewProvider {
    static var previews: some View {
        TarikUlurButton(firstColor: "FC3E45", secondColor: "BA2424", text: "Tarik", isRotate: false)
    }
}
