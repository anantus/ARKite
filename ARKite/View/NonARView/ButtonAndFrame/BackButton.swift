//
//  BackButton.swift
//  ARKite
//
//  Created by Amalia . on 02/12/22.
//

import SwiftUI

struct BackButton: View {
    var body: some View {
        ZStack {
            SettingButtonPath2()
                .fill(Color.init(hex: "9C1C1C"))
                .frame(width: 58, height: 44)
                .padding(.top, 6)
                .padding(.trailing, 5)
            SettingButtonPath()
                .fill(.linearGradient(colors: [Color.init(hex: "FC3E45"), Color.init(hex: "BA2424")], startPoint: .top, endPoint: .bottom))
                .frame(width: 58, height: 44)
                .overlay {
                    Image(systemName: "chevron.left")
                        .bold()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.white)
            }
           
        }
    }
}

struct SettingButtonPath2: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        //start point - Top left
        path.move(to: CGPoint(x: rect.minX, y: rect.minY+4))
        
        //Move to top right
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        
        //Move to bottom right
        path.addLine(to: CGPoint(x: rect.maxX-4, y: rect.maxY-1))
        
        //Move to bottom left
        path.addLine(to: CGPoint(x: rect.minX+7, y: rect.maxY+1))
        
        //end at top right
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        
        return path
    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton()
    }
}
