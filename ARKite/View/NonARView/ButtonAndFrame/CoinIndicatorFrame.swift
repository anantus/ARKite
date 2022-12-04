//
//  CoinIndicatorFrame.swift
//  ARKite
//
//  Created by Ricky Silitonga on 29/11/22.
//

import SwiftUI

struct CoinIndicatorFrame: View {
    let coinCount: Int
    
    var body: some View {
        CoinIndicatorPath()
            .fill(.black)
            .frame(width: 93, height: 44, alignment: .center)
            .opacity(0.4)
            .overlay {
                HStack {
                    Spacer()
                        .frame(width: 25)
                    Text("\(coinCount)")
                        .foregroundColor(.white)
                    .font(.system(.title3, design: .default, weight: .heavy))
                }
            }
    }
}

struct CoinIndicatorPath: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        //start point - Top left
        path.move(to: CGPoint(x: rect.minX, y: rect.minY + 2))
        
        // add an arc
        path.addQuadCurve(to: CGPoint(x: rect.minX + 2, y: rect.minY), control: CGPoint(x: rect.minX, y: rect.minY))
        
        //Move to top right
        path.addLine(to: CGPoint(x: rect.maxX - 2, y: rect.minY+7))
        
        // add an arc
        path.addQuadCurve(to: CGPoint(x: rect.maxX, y: rect.minY+9), control: CGPoint(x: rect.maxX, y: rect.minY + 7))
        
        //Move to bottom right
        path.addLine(to: CGPoint(x: rect.maxX - 7 , y: rect.maxY-7))
        
        // add an arc
        path.addQuadCurve(to: CGPoint(x: rect.maxX-8.5, y: rect.maxY-5.5), control: CGPoint(x: rect.maxX - 7.5, y: rect.maxY -  6))
        
        //Move to bottom left
        path.addLine(to: CGPoint(x: rect.minX+4, y: rect.maxY))
        
        //end at top right
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY+2))
        
        return path
    }
}


struct CoinIndicatorFrame_Previews: PreviewProvider {
    static var previews: some View {
        CoinIndicatorFrame(coinCount: 100)
    }
}
