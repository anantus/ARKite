//
//  GunakanButton.swift
//  ARKite
//
//  Created by Amalia . on 02/12/22.
//

import SwiftUI

struct GunakanButton: View {
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
                        Text("GUNAKAN")
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .heavy, design: .rounded))
                    }
                
            }
        }
    }


    struct FrontButtons: Shape {
        func path(in rect: CGRect) -> Path {
            var path = Path()
            //start point - Top left
            path.move(to: CGPoint(x: rect.minX, y: rect.minY))
            
            //Move to top right
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY+6))
            
            //Move to bottom right
            path.addLine(to: CGPoint(x: rect.maxX-5, y: rect.maxY))
            
            //Move to bottom left
            path.addLine(to: CGPoint(x: rect.minX+7, y: rect.maxY))
            
            //end at top right
            path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))

            
            return path
        }
    }

struct GunakanButton_Previews: PreviewProvider {
    static var previews: some View {
        GunakanButton(firstColor: "0099BB", secondColor: "00608B", bgColor: "00496B", width: 127, height: 33)
    }
}
