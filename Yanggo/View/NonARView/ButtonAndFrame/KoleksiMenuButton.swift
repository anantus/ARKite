//
//  KoleksiMenuButton.swift
//  ARKite
//
//  Created by Amalia . on 02/12/22.
//

import SwiftUI

struct KoleksiMenuButton: View {
    @State var firstColor: String
    @State var secondColor: String
    @State var bgColor: String
    @State var width: CGFloat
    @State var height: CGFloat
    @State var text: String
    
    var body: some View {
        ZStack{
            ButtonsKoleksi()
                .fill(Color.init(hex: bgColor))
                .frame(width: width, height: height)
                .foregroundColor(Color.green)
                .cornerRadius(5)
                .padding(.trailing, (width * 0.02))
                .padding(.top, (height * 0.1))
            ButtonsKoleksi()
                .fill(.linearGradient(colors: [Color.init(hex: firstColor), Color.init(hex: secondColor)], startPoint: .top, endPoint: .bottom))
                .frame(width: width, height: height)
                .cornerRadius(5)
                .overlay {
                    Text("\(text)")
                        .foregroundColor(.white)
                        .font(.system(.title2, design: .default, weight: .heavy))
                }
            
        }
    }
}

struct ButtonsKoleksi: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        //start point - Top left
        path.move(to: CGPoint(x: rect.minX, y: rect.minY+15))
        
        //Move to top right
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY+9))
        
        //Move to bottom right
        path.addLine(to: CGPoint(x: rect.maxX-15, y: rect.maxY))
        
        //Move to bottom left
        path.addLine(to: CGPoint(x: rect.minX+10, y: rect.maxY-9))
        
        //end at top right
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY+15))

        
        return path
    }
}


struct KoleksiMenuButton_Previews: PreviewProvider {
    static var previews: some View {
        KoleksiMenuButton(firstColor: "15B10F", secondColor: "0F7B20", bgColor: "106514", width: 264, height: 82, text: "KOLEKSI")
    }
}
