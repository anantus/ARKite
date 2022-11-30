//
//  ContentView.swift
//  ARKite
//
//  Created by Maheswara Ananta Argono on 17/10/22.
//

import SwiftUI
import RealityKit
import ARKit
import Combine

struct GameView : View {
    
    @State var showContentView: Bool = false
    @State var isStartPlay = false
    @State var rotate = false
    @State var useButton = false
    @State var position = CGSize.zero
    @State var color = Color.white.opacity(0.0001)
    @State var pullPush = "None"
    
    @ObservedObject var vm = ARViewModel()
    
    
    var body: some View {
        ZStack {
            ARViewContainer(anchor: vm.mainAnchor, arView: vm.arView)
            
            // Buttons UI
            if isStartPlay {
                if useButton {
                    VStack {
                        HStack {
                            LinearGradient(gradient: Gradient(colors: [Color.init(hex: "FF6E51"), Color.init(hex: "FF294C")]), startPoint: .top, endPoint: .bottom)
                                .frame(width: 86, height: 28)
                                .contentShape(RoundedRectangle(cornerRadius: 3, style: .continuous))
                                .cornerRadius(3)
                                .overlay {
                                    Text("End Game")
                                        .font(.system(.callout, design: .rounded, weight: .semibold))
                                        .foregroundColor(.white)
                                }
                            
                            Spacer()
                            
                            ZStack {
                                HStack {
                                    RoundedRectangle(cornerRadius: 3)
                                        .frame(width: 86, height: 28)
                                        .foregroundColor(.init(hex: "2C2C2C"))
                                        .overlay {
                                            Text("\(vm.coinGame)")
                                                .font(.system(.callout, design: .rounded, weight: .semibold))
                                                .foregroundColor(.white)
                                        }
                                } .frame(width: 103, height: 28, alignment: .trailing)
                                
                                HStack {
                                    Image("coinIndicatorIcon")
                                        .frame(width: 34)
                                }.frame(width: 103, height: 28, alignment: .leading)
                                
                            } .frame(width: 103, height: 28, alignment: .center)
                            
                            
                        }
                        
                        Spacer()
                        
                        HStack(alignment: .bottom) {
                            Spacer()
                            Spacer()
                            VStack(spacing: 14) {
                                Button {
                                    vm.kiteMoveUp()
                                    vm.stretchRotateThread()
                                    // TODO: stretch kite
                                } label: {
                                    ZStack(alignment: .top) {
                                        LinearGradient(gradient: Gradient(colors: [Color.init(hex: "9F6B00"), Color.init(hex: "C98A01")]), startPoint: .top, endPoint: .bottom)
                                            .frame(width: 88, height: 89)
                                            .contentShape(RoundedRectangle(cornerRadius: 27, style: .continuous))
                                            .cornerRadius(27)
                                        
                                        
                                        LinearGradient(gradient: Gradient(colors: [Color.init(hex: "F4DB05"), Color.init(hex: "F4970E")]), startPoint: .top, endPoint: .bottom)
                                            .frame(width: 82, height: 82)
                                            .contentShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                                            .cornerRadius(25)
                                            .overlay {
                                                VStack(spacing: 8) {
                                                    Image(systemName: "chevron.up")
                                                        .font(.title)
                                                        .fontWeight(.bold)
                                                        .foregroundColor(.white)
                                                    
                                                    Text("STRETCH")
                                                        .font(.system(.subheadline, design: .rounded, weight: .heavy))
                                                        .foregroundColor(.white)
                                                }
                                            }
                                    }
                                }
                                
                                
                                Button {
                                    vm.kiteMoveFront()
                                    vm.pullRotateThread()
                                    // TODO: pull kite
                                } label: {
                                    ZStack(alignment: .top) {
                                        LinearGradient(gradient: Gradient(colors: [Color.init(hex: "D20936"), Color.init(hex: "EA3242")]), startPoint: .top, endPoint: .bottom)
                                            .frame(width: 88, height: 89)
                                            .contentShape(RoundedRectangle(cornerRadius: 27, style: .continuous))
                                            .cornerRadius(27)
                                        
                                        
                                        LinearGradient(gradient: Gradient(colors: [Color.init(hex: "FF6E51"), Color.init(hex: "FF294C")]), startPoint: .top, endPoint: .bottom)
                                            .frame(width: 82, height: 82)
                                            .contentShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                                            .cornerRadius(25)
                                            .overlay {
                                                VStack(spacing: 8) {
                                                    Text("PULL")
                                                        .font(.system(.subheadline, design: .rounded, weight: .heavy))
                                                        .foregroundColor(.white)
                                                    
                                                    Image(systemName: "chevron.down")
                                                        .font(.title)
                                                        .fontWeight(.bold)
                                                        .foregroundColor(.white)
                                                }
                                            }
                                    }
                                }
                            }
                        }
                    } .padding()
                }else {
                    VStack{
                        Text("")
                        HStack{
                            Spacer()
                        }
                        Spacer()
                    }
                    .background(color)
                    .gesture(
                        DragGesture()
                            .onChanged({ value in
                                if position.height > 0 {
                                    pullPush = "Pull"
//                                    color = Color.green.opacity(0.2)
                                    print("Pull is triggered")
                                }else if position.height < 0 {
                                    pullPush = "Stretch"
//                                    color = Color.red.opacity(0.2)
                                    print("Stretch is triggered")
                                }
                                position = value.translation
                            })
                            .onEnded(({ value in
                                if pullPush == "Pull"{
                                    vm.pullRotateThread()
                                    vm.kiteMoveFront()
                                }else if pullPush == "Stretch"{
                                    vm.stretchRotateThread()
                                    vm.kiteMoveUp()
                                }
                                pullPush = "None"
//                                color = Color.blue.opacity(0.2)
                                position = .zero
                            })
                        )
                    )
                }
            } else {
                VStack {
                    Spacer()
                    
                    Button {
                        //TODO: kiteBoost
                        vm.kiteFlyStart()
                        
                        withAnimation {
                            isStartPlay.toggle()
                            
                        }
                    } label: {
                        ZStack(alignment: .top) {
                            LinearGradient(gradient: Gradient(colors: [Color.init(hex: "9F6B00"), Color.init(hex: "C98A01")]), startPoint: .top, endPoint: .bottom)
                                .frame(width: 223, height: 65)
                                .contentShape(RoundedRectangle(cornerRadius: 31, style: .continuous))
                                .cornerRadius(31)
                            
                            
                            LinearGradient(gradient: Gradient(colors: [Color.init(hex: "F4DB05"), Color.init(hex: "F4970E")]), startPoint: .top, endPoint: .bottom)
                                .frame(width: 217, height: 58)
                                .contentShape(RoundedRectangle(cornerRadius: 28, style: .continuous))
                                .cornerRadius(28)
                                .overlay {
                                    VStack(spacing: 8) {
                                        Text("FLY")
                                            .font(.system(.title, design: .rounded, weight: .heavy))
                                            .foregroundColor(.white)
                                        
                                    }
                                }
                        }
                    }
                    
                    
                } .padding()
            }
            
            
        }
        
    }
}




#if DEBUG
struct GameView_Previews : PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
#endif

