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

//New Comment
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
        let mainAnchor = try! Experience.loadARKite()
        let kite = mainAnchor.findEntity(named: "kite")
        
//        ?.playAnimation(<#T##animation: AnimationResource##AnimationResource#>, transitionDuration: <#T##TimeInterval#>, startsPaused: <#T##Bool#>)
        
        vm.onStartMoveUp = {
            mainAnchor.notifications.moveUp.post()
        }
        vm.onStartMoveDown = {
            mainAnchor.notifications.moveDown.post()
        }
        vm.onStartMoveFront = {
            //Find kite Angle
            let kiteAngle = findAngle(kiteCoordinates: kite!.position)
//            let transformKite = kite!.transform.rotation + simd_quatf(angle: kiteAngle, axis: SIMD3<Float>(1,0,0))
//            kite!.playAnimation(AnimationResource, transitionDuration: <#T##TimeInterval#>, startsPaused: <#T##Bool#>)
//            let tempRotation = FromToByAnimation(jointNames: <#T##[String]#>)
//            mainAnchor.notifications.moveFront.post()
//            kite!.move(to: transformKite, relativeTo: kite!, duration: 1)
            kite!.move(to: Transform.init(rotation: simd_quatf(angle: kiteAngle, axis: SIMD3<Float>(1,0,0))), relativeTo: kite!, duration: 10)
//                       , translation: SIMD3<Float>(0,10,5)
        }
        vm.onStartRotate = {
            mainAnchor.notifications.moveRotateClockwise.post()
        }
        vm.onStartBoost = {
            mainAnchor.notifications.kiteStart.post()
        }
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(mainAnchor)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
    func findDistance(kiteCoordinates: SIMD3<Float>) -> Float {
        let squareX = kiteCoordinates.x * kiteCoordinates.x
        let squareY = kiteCoordinates.y * kiteCoordinates.y
        let squareZ = kiteCoordinates.z * kiteCoordinates.z
        
        return sqrt(squareX + squareY + squareZ)
    }
    
    func findAngle(kiteCoordinates: SIMD3<Float>) -> Float{
        let kiteTan : Float = 100 / findDistance(kiteCoordinates: kiteCoordinates)
        let kiteAngle : Float = atan(kiteTan) * 180 / Float.pi
        return kiteAngle
    }
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
