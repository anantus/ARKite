//
//  CustomSlider.swift
//  ARKite
//
//  Created by Ricky Silitonga on 30/11/22.
//

import SwiftUI

struct CustomSlider: View {
    @State var offset: CGFloat = 0
    @State var sliderValue: CGFloat = 0
    
    @State private var speed = 50.0
    @State private var isEditing = false
    
    var body: some View {
        VStack {
            Text("Screen Width: \(UIScreen.main.bounds.width)")
            
            Slider(
                value: $speed,
                in: 0...100,
                onEditingChanged: { editing in
                    isEditing = editing
                }
            )
            
            Text("\(sliderValue)")
            
            
            ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
                Rectangle()
                    .fill(.yellow)
                    .frame(height: 30)
                Rectangle()
                    .fill(.red)
                    .frame(width: offset, height: 30)
                
                Rectangle()
                    .fill(Color.blue)
                    .frame(width: 40, height: 40)
                    .offset(x: offset)
                    .gesture(DragGesture().onChanged({ value in
                        
                        // slider thumb = 40/2
                        
                        if value.location.x >= 0 && value.location.x <= UIScreen.main.bounds.width - 50 {
                            offset = value.location.x
                            sliderValue = offset
                        }
                    }))
            }
        }
    }
}

struct CustomSlider_Previews: PreviewProvider {
    static var previews: some View {
        CustomSlider()
    }
}

