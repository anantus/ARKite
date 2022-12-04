//
//  PilihKiteButton.swift
//  ARKite
//
//  Created by Maheswara Ananta Argono on 03/12/22.
//

import Foundation

import SwiftUI

struct PilihKiteButton: View {
    @State var firstColor: String
    @State var secondColor: String
    @State var thirdColor: String
    @State var bgColor: String
    @State var width: CGFloat
    @State var height: CGFloat
    @State var picture: String
    @State var isUsed = false
    
    var body: some View {
        ZStack{
            PilihKiteBack()
                .fill(.linearGradient(colors: [Color.init(hex: firstColor), Color.init(hex: secondColor)], startPoint: .top, endPoint: .bottom))
                .frame(width: width, height: height)
                .cornerRadius(5)
            VStack (spacing: 0){
                ZStack {
                    PilihKiteFront()
                        .fill(Color.init(hex: thirdColor))
                        .frame(width: width-25, height: height-50)
                        .cornerRadius(5)
                        
                    Image("\(picture)")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width * (2.6/10),height: UIScreen.main.bounds.height * (1.3/10))
                        .rotationEffect(.degrees(30))
                        .padding(.top, 8)
                        .padding(.trailing, 5)
                }
            }
            .onTapGesture {
                withAnimation {
                    isUsed.toggle()
                }
            }
                
        }
    }
}

struct PilihKiteBack: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        //start point - Top left
        path.move(to: CGPoint(x: rect.minX, y: rect.minY+10))
        
        //Move to top right
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        
        //Move to bottom right
        path.addLine(to: CGPoint(x: rect.maxX-15, y: rect.maxY))
        
        //Move to bottom left
        path.addLine(to: CGPoint(x: rect.minX+13, y: rect.maxY-13))
        
        //end at top right
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))

        
        return path
    }
}

struct PilihKiteFront: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        //start point - Top left
        path.move(to: CGPoint(x: rect.minX, y: rect.minY+10))
        
        //Move to top right
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        
        //Move to bottom right
        path.addLine(to: CGPoint(x: rect.maxX-10, y: rect.maxY-4))
        
        //Move to bottom left
        path.addLine(to: CGPoint(x: rect.minX+8, y: rect.maxY-7))
        
        //end at top right
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        
        return path
    }
}

struct PilihKiteButton_Previews: PreviewProvider {
    static var previews: some View {
        PilihKiteButton(firstColor: "FBC300", secondColor: "FEB914", thirdColor: "FFF7C6", bgColor: "BB8800", width: 164, height: 210, picture: "Kite 1")
    }
}
