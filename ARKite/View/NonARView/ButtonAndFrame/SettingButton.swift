//
//  SettingButton.swift
//  ARKite
//
//  Created by Ricky Silitonga on 29/11/22.
//

import SwiftUI

struct SettingButton: View {
    var body: some View {
        SettingButtonPath()
            .fill(.black)
            .frame(width: 58, height: 44)
            .opacity(0.4)
            .overlay {
                Image(systemName: "gearshape.fill")
                    .frame(width: 28, height: 26)
                    .foregroundColor(.white)
            }
    }
}

struct SettingButtonPath: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        //start point - Top left
        path.move(to: CGPoint(x: rect.minX, y: rect.minY+4))
        
        //Move to top right
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        
        //Move to bottom right
        path.addLine(to: CGPoint(x: rect.maxX-4, y: rect.maxY))
        
        //Move to bottom left
        path.addLine(to: CGPoint(x: rect.minX+7, y: rect.maxY-2))
        
        //end at top right
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        
        return path
    }
}

struct SettingButton_Previews: PreviewProvider {
    static var previews: some View {
        SettingButton()
    }
}



