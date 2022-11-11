//
//  ContentView.swift
//  ARKite
//
//  Created by Maheswara Ananta Argono on 17/10/22.
//

import SwiftUI
import RealityKit

class ViewModel: ObservableObject {
    
    //create closure on object
    var onStartMoveUp: () -> Void = { }
    var onStartMoveDown: () -> Void = { }
    var onStartMoveFront: () -> Void = { }
    var onStartRotate: () -> Void = { }
    var onStartBoost: () -> Void = { }
}

struct ContentView : View {
    
    let vm = ViewModel()
    
    var body: some View {
        VStack {
            ARViewContainer(vm: vm).edgesIgnoringSafeArea(.all)
            HStack{
                Spacer()
                VStack{
                    Button("MOVE UP"){
                        vm.onStartMoveUp()
                    }
                    .padding()
                    
                    Button("MOVE DOWN"){
                        vm.onStartMoveDown()
                    }
                    Button("FRONT"){
                        vm.onStartMoveFront()
                    }
                    .padding()
                    Button("ROTATE"){
                        vm.onStartRotate()
                    }
                    .padding()
                    Button("START"){
                        vm.onStartBoost()
                    }
                    .padding()
                }
            }
            .padding()
        }
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    let vm: ViewModel
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        // Load the "Box" scene from the "Experience" Reality File
        let mainAnchor = try! Experience.loadFloatingKite()
        
        vm.onStartMoveUp = {
            mainAnchor.notifications.moveUp.post()
        }
        vm.onStartMoveDown = {
            mainAnchor.notifications.moveDown.post()
        }
        vm.onStartMoveFront = {
            mainAnchor.notifications.moveFront.post()
        }
        vm.onStartRotate = {
            mainAnchor.notifications.kiteRotateClockwise.post()
        }
        vm.onStartBoost = {
            mainAnchor.notifications.kiteStart.post()
        }
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(mainAnchor)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
