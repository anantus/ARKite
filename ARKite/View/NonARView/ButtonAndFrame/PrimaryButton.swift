//
//  PrimaryButton.swift
//  ARKite
//
//  Created by Ricky Silitonga on 01/12/22.
//

import SwiftUI

struct PrimaryButton: View {
    let firstColor: String
    let secondColor: String
    let bgColor: String
    let width: CGFloat
    let height: CGFloat
    let text: String
    
    var body: some View {
        ZStack {
            PrimaryButtonPath(width: width, height: height)
                .fill(Color.init(hex: "00496B"))
                .frame(width: width, height: height)
                .overlay {
                    Text("\(text)")
                        .foregroundColor(.white)
                        .font(.system(.title2, design: .default, weight: .heavy))
                }
                .padding(.top, 0.081 * height)
                .padding(.trailing, 0.016 * width)
            
            
            PrimaryButtonPath(width: width, height: height)
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

struct PrimaryButtonPath: Shape {
    let width: CGFloat
    let height: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        //start point - Top left
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        
        //Move to top right
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY + (0.1 * height)))
        
        //Move to bottom right
        path.addLine(to: CGPoint(x: rect.maxX - (0.04 * width) , y: rect.maxY))
        
        //Move to bottom left
        path.addLine(to: CGPoint(x: rect.minX + (0.02 * width), y: rect.maxY + (0.08 * height)))
        
        //end at top right
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        
        return path
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(firstColor: "0099BB",
                      secondColor: "00608B",
                      bgColor: "00496B",
                      width: 246,
                      height: 61,
                      text: "TEEEEST"
        )
    }
}
