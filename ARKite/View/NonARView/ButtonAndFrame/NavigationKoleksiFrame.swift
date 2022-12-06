//
//  NavigationKoleksiFrame.swift
//  ARKite
//
//  Created by Amalia . on 02/12/22.
//

import SwiftUI

struct NavigationKoleksiFrame: View {
    var body: some View {
        ZStack {
            NavKoleksiFramePath2()
                .fill(Color.init(hex: "8B2E00"))
                .frame(width: 453,height: 494, alignment: .center)
                .padding(.trailing, 15)
                .padding(.top, 20)
                
            
            NavKoleksiFramePath()
                .fill(.linearGradient(colors: [Color.init(hex: "FBC300"), Color.init(hex: "FEB914")], startPoint: .top, endPoint: .bottom))
                .frame(width: 458,height: 494, alignment: .center)
                .overlay {
                    Text("KOLEKSI")
                        .foregroundColor(Color.init(hex: "8B2E00"))
                        .font(.system(size: 28, weight: .heavy, design: .rounded))
                        .bold()
                        .padding(.top, 400)
                        .padding(.leading, 10)
                        HStack {
                            Circle()
                                .fill(Color.init(hex: "8B2E00"))
                                .frame(width: 18, height: 20)
                                .padding(.top, 450)
                                .padding(.leading, 45)
                            Spacer()
                            Circle()
                                .fill(Color.init(hex: "8B2E00"))
                                .frame(width: 18, height: 20)
                                .padding(.top, 450)
                                .padding(.trailing, 28)

                        } .padding()
                     
                }
        }
    }
}

struct NavKoleksiFramePath: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        //start point - Top left
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        
        //Move to top right
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        
        //Move to bottom right
        path.addLine(to: CGPoint(x: rect.maxX-35, y: rect.maxY-4))
        
        //Move to bottom left
        path.addLine(to: CGPoint(x: rect.minX+50, y: rect.maxY))
        
        //end at top right
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        
        return path
    }
}

struct NavKoleksiFramePath2: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        //start point - Top left
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        
        //Move to top right
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        
        //Move to bottom right
        path.addLine(to: CGPoint(x: rect.maxX-35, y: rect.maxY-10))
        
        //Move to bottom left
        path.addLine(to: CGPoint(x: rect.minX+50, y: rect.maxY))
        
        //end at top right
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        
        return path
    }
}
struct NavigationKoleksiFrame_Previews: PreviewProvider {
    static var previews: some View {
        NavigationKoleksiFrame()
    }
}
