//
//  LayanganFrame1.swift
//  ARKite
//
//  Created by Amalia . on 02/12/22.
//

import SwiftUI

struct LayanganFrame1: View {
    @State var firstColor: String
    @State var secondColor: String
    @State var thirdColor: String
    @State var bgColor: String
    @State var width: CGFloat
    @State var height: CGFloat
    @State var picture: String
    var body: some View {
        ZStack{
            FrameBack1()
                .fill(Color.init(hex: bgColor))
                .frame(width: width, height: height)
                .cornerRadius(5)
                .padding(.trailing, (width * 0.09))
                .padding(.top, (height * 0.15))
            FrameFront1()
                .fill(.linearGradient(colors: [Color.init(hex: firstColor), Color.init(hex: secondColor)], startPoint: .top, endPoint: .bottom))
                .frame(width: width, height: height)
                .cornerRadius(5)
            FrameInner1()
                .fill(Color.init(hex: thirdColor))
                .frame(width: 141, height: 128)
                .cornerRadius(5)
                .padding(.bottom, (height * 0.17))
            Image("")
            
        }
    }
}

struct FrameFront1: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        //start point - Top left
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        
        //Move to top right
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY-10))
        
        //Move to bottom right
        path.addLine(to: CGPoint(x: rect.maxX-15, y: rect.maxY))
        
        //Move to bottom left
        path.addLine(to: CGPoint(x: rect.minX+13, y: rect.maxY-13))
        
        //end at top right
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))

        
        return path
    }
}

struct FrameBack1: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        //start point - Top left
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        
        //Move to top right
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY+15))
        
        //Move to bottom right
        path.addLine(to: CGPoint(x: rect.maxX-15, y: rect.maxY-10))
        
        //Move to bottom left
        path.addLine(to: CGPoint(x: rect.minX+13, y: rect.maxY-16))
        
        //end at top right
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))

        
        return path
    }
}

struct FrameInner1: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        //start point - Top left
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        
        //Move to top right
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY-10))
        
        //Move to bottom right
        path.addLine(to: CGPoint(x: rect.maxX-10, y: rect.maxY-4))
        
        //Move to bottom left
        path.addLine(to: CGPoint(x: rect.minX+8, y: rect.maxY))
        
        //end at top right
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))

        
        return path
    }
}

struct LayanganFrame1_Previews: PreviewProvider {
    static var previews: some View {
        LayanganFrame1(firstColor: "FBC300", secondColor: "FEB914", thirdColor: "FFF7C6", bgColor: "BB8800", width: 164, height: 190, picture: "")
    }
}
