//
//  MainMenuButton.swift
//  ARKite
//
//  Created by Maheswara Ananta Argono on 28/11/22.
//

import SwiftUI

//Dipakai untuk main menu button
// bisa dipakai untuk button lanut dan akhiri di setting,
// tombol mulai dan menu

struct MainMenuButton: View {
    let firstColor: String
    let secondColor: String
    let bgColor: String
    let width: CGFloat
    let height: CGFloat
    let text: String

    var body: some View {
        ZStack{
            Buttons()
                .fill(Color.init(hex: bgColor))
                .frame(width: width, height: height)
                .foregroundColor(Color.green)
                .padding(.trailing, (width * 0.02))
                .padding(.top, (height * 0.1))
            
            Buttons()
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

struct Buttons: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        //start point - Top left
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        
        //Move to top right
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY+14))
        
        //Move to bottom right
        path.addLine(to: CGPoint(x: rect.maxX-10, y: rect.maxY))
        
        //Move to bottom left
        path.addLine(to: CGPoint(x: rect.minX+6, y: rect.maxY))
        
        //end at top right
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        
        return path
    }
}

struct MainMenuButton_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuButton(firstColor: "0099BB",
                       secondColor: "00608B",
                       bgColor: "00496B",
                       width: 262,
                       height: 78,
                       text: "TEEEEST"
        )
    }
}
