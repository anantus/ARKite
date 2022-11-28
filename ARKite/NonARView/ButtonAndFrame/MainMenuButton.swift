//
//  MainMenuButton.swift
//  ARKite
//
//  Created by Maheswara Ananta Argono on 28/11/22.
//

import SwiftUI

//Dipakai untuk main menu button
struct MainMenuButton: View {
    var body: some View {
        ZStack{
            Buttons()
                .frame(width: 240, height: 70)
//                .foregroundColor(Color.gray)
                .cornerRadius(5)
                .padding(.trailing, 10)
                .padding(.top, 15)
            Buttons()
                .frame(width: 240, height: 70)
                .foregroundColor(Color.green)
                .cornerRadius(5)
        }
    }
}

struct Buttons: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        //start point - Top left
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        
        //Move to top right
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY+15))
        
        //Move to bottom right
        path.addLine(to: CGPoint(x: rect.maxX-15, y: rect.maxY))
        
        //Move to bottom left
        path.addLine(to: CGPoint(x: rect.minX+10, y: rect.maxY))
        
        //end at top right
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        
        return path
    }
}

struct MainMenuButton_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuButton()
    }
}
