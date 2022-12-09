//
//  SecondaryButton.swift
//  ARKite
//
//  Created by Ricky Silitonga on 01/12/22.
//

import SwiftUI

struct SecondaryButton: View {
    let firstColor: String
    let secondColor: String
    let bgColor: String
    let width: CGFloat
    let height: CGFloat
    let text: String
    
    
    var body: some View {
        ZStack {
            SecondaryButtonPath(width: width, height: height)
                .fill(Color.init(hex: bgColor))
                .frame(width: width, height: height)
                .overlay {
                    Text("\(text)")
                        .foregroundColor(.white)
                        .font(.system(.title2, design: .default, weight: .heavy))
                }
                .padding(.top, 0.081 * height)
                .padding(.trailing, 0.016 * width)
            
            
            SecondaryButtonPath(width: width, height: height)
                .fill(.linearGradient(colors: [Color.init(hex: firstColor), Color.init(hex: secondColor)], startPoint: .top, endPoint: .bottom))
                .frame(width: width, height: height)
                .overlay {
                    Text("\(text)")
                        .foregroundColor(.white)
                        .font(.system(.title2, design: .default, weight: .heavy))
                }
        }
        
        
    }
}


struct SecondaryButtonPath: Shape {
    let width: CGFloat
    let height: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        //start point - Top left
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        
        //Move to top right
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        
        //Move to bottom right
        path.addLine(to: CGPoint(x: rect.maxX - (0.02 * width) , y: rect.maxY - (0.04 * height)))
        
        //Move to bottom left
        path.addLine(to: CGPoint(x: rect.minX + (0.03 * width), y: rect.maxY - (0.16 * height)))
        
        //end at top right
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        
        return path
    }
}

struct SecondaryButton_Previews: PreviewProvider {
    static var previews: some View {
        SecondaryButton(firstColor: "FC3E45",
                        secondColor: "BA2424",
                        bgColor: "9C1C1C",
                        width: 246,
                        height: 61,
                        text: "TEEEEST"
        )
    }
}
