//
//  CoinIndicatorFrame.swift
//  ARKite
//
//  Created by Amalia . on 02/12/22.
//

import SwiftUI

struct CoinIndicatorFrame: View {
    let coinCount: Int
    var body: some View {
        ZStack {
            CoinIndicatorPath()
            .fill(.black)
            .frame(width: 93, height: 44, alignment: .center)
            .opacity(0.4)
            .overlay {
                HStack {
                    Spacer()
                        .frame(width: 10)
                    Text("\(coinCount)")
                        .foregroundColor(.white)
                        .font(.system(.title3, design: .default, weight: .heavy))
                }
            }
            Image("KoinBaru")
                .resizable()
                .frame(width: 60, height: 60)
                .offset(x: -50)
    }
    }
}

struct CoinIndicatorPath: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        //start point - Top left
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        
        //Move to top right
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY+9))
        
        //Move to bottom right
        path.addLine(to: CGPoint(x: rect.maxX-7, y: rect.maxY-4))
        
        //Move to bottom left
        path.addLine(to: CGPoint(x: rect.minX+4, y: rect.maxY))
        
        //end at top right
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        
        return path
    }
}
struct CoinIndicatorFrame_Previews: PreviewProvider {
    static var previews: some View {
        CoinIndicatorFrame(coinCount: 1000)
    }
}
