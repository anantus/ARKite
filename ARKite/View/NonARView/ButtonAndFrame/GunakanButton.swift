//
//  GunakanButton.swift
//  ARKite
//
//  Created by Amalia . on 02/12/22.
//

import SwiftUI

struct GunakanButton: View {
        
        var body: some View {
            ZStack{
                FrontButtons()
                    .fill(Color.init(hex: "00496B"))
                    .frame(width: 127, height: 33)
                    .foregroundColor(Color.green)
                    .padding(.trailing, (130 * 0.02))
                    .padding(.top, (36 * 0.2))
                FrontButtons()
                    .fill(.linearGradient(colors: [Color.init(hex: "0099BB"), Color.init(hex: "00608B")], startPoint: .top, endPoint: .bottom))
                    .frame(width: 127, height: 33)
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
            path.addLine(to: CGPoint(x: rect.minX+5, y: rect.maxY))
            
            //end at top right
            path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))

            
            return path
        }
    }

struct GunakanButton_Previews: PreviewProvider {
    static var previews: some View {
        GunakanButton()
    }
}
