//
//  SettingFrame.swift
//  ARKite
//
//  Created by Amalia . on 02/12/22.
//

import SwiftUI

struct SettingFrame: View {
    var body: some View {
        ZStack {
            SettingFramePath()
                .fill(Color.init(hex: "8B2E00"))
                .frame(width: 355,height: 494, alignment: .center)
                .padding(.trailing, 16)
                .padding(.top, 16)
                
            
            SettingFramePath()
                .fill(.linearGradient(colors: [Color.init(hex: "FBC300"), Color.init(hex: "FEB914")], startPoint: .top, endPoint: .bottom))
                .frame(width: 355,height: 494, alignment: .center)
                .overlay {
                    VStack {
                        HStack {
                            Circle()
                                .fill(Color.init(hex: "8B2E00"))
                                .frame(width: 18, height: 20)
                            Spacer()
                            Circle()
                                .fill(Color.init(hex: "8B2E00"))
                                .frame(width: 18, height: 20)
                                .padding(.top, 10)
                            
                        } .padding()
                        
                        Spacer()
                        
                        HStack {
                            Circle()
                                .fill(Color.init(hex: "8B2E00"))
                                .frame(width: 18, height: 20)
                                .padding(.leading, 10)
                            Spacer()
                            Circle()
                                .fill(Color.init(hex: "8B2E00"))
                                .frame(width: 18, height: 20)
                                .padding(.bottom, 10)
                                .padding(.trailing, 10)
                            
                        } .padding()
                    } .frame(width: 355, height: 494)
                }
        }
    }
}

struct SettingFramePath: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        //start point - Top left
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        
        //Move to top right
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY+10))
        
        //Move to bottom right
        path.addLine(to: CGPoint(x: rect.maxX-18, y: rect.maxY-13))
        
        //Move to bottom left
        path.addLine(to: CGPoint(x: rect.minX+14, y: rect.maxY))
        
        //end at top right
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        
        return path
    }
}

struct SettingFrame_Previews: PreviewProvider {
    static var previews: some View {
        SettingFrame()
    }
}
