//
//  CustomSliderV2.swift
//  ARKite
//
//  Created by Ricky Silitonga on 30/11/22.
//

import SwiftUI
import Sliders

struct CustomSliderV2: View {
    // music or sound effect volume level
    let sliderWidth: CGFloat
    let sliderHeight: CGFloat = 8

    @Binding var progress: Float
    var body: some View {
        ValueSlider(value: $progress)
            .valueSliderStyle(
                HorizontalValueSliderStyle(
                    track:
                        HorizontalTrack(view: Color.init(hex: "8B2E00"))
                        .frame(height: sliderHeight)
                        .background(Color.init(hex: "FFDD73")),
                    thumb:
                        KnoobPath()
                        .fill(Color.init(hex: "FFF4D0"))
                        .frame(width: 28, height: 30)
                )
            )
            .frame(width: sliderWidth, height: sliderHeight)
        
        
    }
    
}





struct KnoobPath: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        //start point - Top left
        path.move(to: CGPoint(x: rect.minX+3, y: rect.minY))
        
        //Move to top right
        path.addLine(to: CGPoint(x: rect.maxX-3, y: rect.minY))
        
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY+9))
        
        //Move to bottom right
        path.addLine(to: CGPoint(x: rect.maxX-2, y: rect.maxY-2))
        
        path.addLine(to: CGPoint(x: rect.minX+2, y: rect.maxY))
        
        //Move to bottom left
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY+3))
        
        //end at top right
        path.addLine(to: CGPoint(x: rect.minX+3, y: rect.minY))
        
        return path
    }
}


struct CustomSliderV2_Previews: PreviewProvider {
    static var previews: some View {
        CustomSliderV2(sliderWidth: 240, progress: .constant(0.4))
    }
}
