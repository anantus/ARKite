//
//  PilihLayanganButton.swift
//  ARKite
//
//  Created by Amalia . on 03/12/22.
//

import SwiftUI

struct PilihLayanganButton: View {
        let width: CGFloat
        let height: CGFloat
        var body: some View {
            ZStack {
                ChooseFramePath()
                    .fill(Color.init(hex: "8B2E00"))
                    .frame(width: width, height: height, alignment: .center)
                    .padding(.trailing, (13/width) * width)
                    .padding(.top, (20/height) * height)
                    
                
                ChooseFramePath()
                    .fill(.linearGradient(colors: [Color.init(hex: "FBC300"), Color.init(hex: "FEB914")], startPoint: .top, endPoint: .bottom))
                    .frame(width: width,height: height, alignment: .center)
                    .overlay {
                        ZStack {
                            VStack {
                                HStack {
                                    Circle()
                                        .fill(Color.init(hex: "8B2E00"))
                                        .frame(width: 15, height: 14)
                                        .padding(.top, 10)
                                    Spacer()
                                    Circle()
                                        .fill(Color.init(hex: "8B2E00"))
                                        .frame(width: 15, height: 14)
                                        .padding(.top, 35)
                                    
                                }
                                .padding()
                                
                                Spacer()
                                
                                HStack {
                                    Circle()
                                        .fill(Color.init(hex: "8B2E00"))
                                        .frame(width: 12, height: 11)
                                        .padding(.leading, 8)
                                        .padding(.bottom, 17)
                                    Spacer()
                                    Circle()
                                        .fill(Color.init(hex: "8B2E00"))
                                        .frame(width: 11, height: 10)
                                        .padding(.bottom, 18)
                                        .padding(.trailing, 12)
                                    
                                } .padding()
                            } .frame(width: width, height: height)
                            Text("PILIH LAYANGAN")
                                .foregroundColor(Color.init(hex: "8B2E00"))
                                .font(.system(size: 28, weight: .heavy, design: .rounded))
                                .bold()
                                .padding(.top, 10)
                        }
                    }
            }
        }
    }
    struct ChooseFramePath: Shape {
        func path(in rect: CGRect) -> Path {
            var path = Path()
            //start point - Top left
            path.move(to: CGPoint(x: rect.minX, y: rect.minY))
            
            //Move to top right
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY+18))
            
            //Move to bottom right
            path.addLine(to: CGPoint(x: rect.maxX-18, y: rect.maxY))
            
            //Move to bottom left
            path.addLine(to: CGPoint(x: rect.minX+14, y: rect.maxY))
            
            //end at top right
            path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
            
            return path
        }
    }

struct PilihLayanganButton_Previews: PreviewProvider {
    static var previews: some View {
        PilihLayanganButton(width: 310, height: 96)
    }
}
