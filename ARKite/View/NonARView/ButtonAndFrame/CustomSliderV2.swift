//
//  CustomSliderV2.swift
//  ARKite
//
//  Created by Ricky Silitonga on 30/11/22.
//

import SwiftUI

struct CustomSliderV2: View {
    // music or sound effect volume level
    let sliderWidth: CGFloat!
    let knobFrame: CGFloat = 50
    @Binding var progress: CGFloat
   
    @State var knoobPosition: CGFloat = 0.0
    
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.init(hex: "FFDD73"))
                .frame(width: 6, height: sliderWidth)
            
            LightSlider(progress: progress)
                .fill(Color.init(hex: "8B2E00"))
                .frame(width: 6, height: sliderWidth)
            
            ZStack {
                
                KnoobPath()
                    .fill(Color.init(hex: "FFF4D0"))
                    .offset(x: 0, y: knoobPosition)
                    .frame(width: 18, height: 20)
                
                Rectangle()
                    .fill(.white.opacity(0.01))
                    .offset(x: 0, y: knoobPosition)
                    .frame(width: knobFrame, height: knobFrame)
                    .gesture(
                        DragGesture(minimumDistance: 0)
                            .onChanged({ value in
                                calculateProgress(yLocation: value.location.y)
                            }
                                      )
                    )
                    .onAppear {
                        calculateInitialThumPosition()
                    }
            }
        }
        .frame(width: sliderWidth, height: knobFrame, alignment: .center)
        .rotation3DEffect(.degrees(90), axis: (x: 0, y: 0, z: 1))
    }
    
    private func calculateInitialThumPosition() {
        let progressFromMiddle = 0.5 - progress
        knoobPosition = progressFromMiddle * sliderWidth
    }
    
    private func calculateProgress(yLocation: CGFloat) {
        
        print("yLocation: \(yLocation)")
        var tempProgress = 0.5 - (yLocation) / sliderWidth
        
        if tempProgress > 1 {
            tempProgress = 1
        } else if tempProgress < 0 {
            tempProgress = 0
        }
        progress = tempProgress
        let progressFromMiddle = 0.5 - progress
        knoobPosition = progressFromMiddle * sliderWidth
        
        print("Progress: \(tempProgress)")
        print("TempProgress: \(tempProgress)")
        
    }
    
}


struct LightSlider: Shape {
    var progress: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let width = rect.width
        let height = rect.height
        let progressHeight = height * (1 - progress)
        
        path.move(to: CGPoint(x: 0, y: progressHeight))
//        path.addQuadCurve(to: CGPoint(x: 30, y: progressHeight), control: CGPoint(x: 0, y: progressHeight))
        
        
        path.addLine(to: CGPoint(x: width, y: progressHeight))
        path.addLine(to: CGPoint(x: width, y: height))
        path.addLine(to: CGPoint(x: 0, y: height))
        path.addLine(to: CGPoint(x: 0, y: progressHeight))
        
        return path
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
        CustomSliderV2(sliderWidth: 200, progress: .constant(0.3))
    }
}
