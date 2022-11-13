//
//  ContentView.swift
//  ARKite
//
//  Created by Maheswara Ananta Argono on 17/10/22.
//

import SwiftUI
import RealityKit
import ARKit

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
        let initialPosition = SIMD3<Float>(0,0,0)
        
        var distanceBetweenKite = SIMD3<Float>(0,0,0)
        
        vm.onStartMoveUp = {
            mainAnchor.notifications.moveUp.post()
            distanceBetweenKite = kite!.position
        }
        vm.onStartMoveDown = {
            mainAnchor.notifications.moveDown.post()
            distanceBetweenKite = kite!.position
        }
        vm.onStartMoveFront = {
            //Find kite Angle
            mainAnchor.notifications.moveFront.post()
            let kiteTravel = kite!.position
            print(simd_distance(kiteTravel, distanceBetweenKite))
            let kiteAngle = findAngle(kiteCoordinates: kite!.position, initialCoordinates: initialPosition, kiteDistance: simd_distance(kiteTravel, distanceBetweenKite))

            for _ in 1...Int(kiteAngle){
                mainAnchor.notifications.frontRotate.post()
            }
            
            print("initial distance", simd_distance(kite!.position, initialPosition))

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
    
    func findDistance(kiteCoordinates: SIMD3<Float>, initialCoordinates: SIMD3<Float>) -> Float {
        let simdDistance = simd_distance(kiteCoordinates, initialCoordinates)
        print("the distance:\(simdDistance)")
        return simdDistance
    }
    
    func findAngle(kiteCoordinates: SIMD3<Float>, initialCoordinates: SIMD3<Float>, kiteDistance: Float) -> Float{
        
        let radius = simd_distance(kiteCoordinates, initialCoordinates)
        print("kite distance :",kiteDistance)
        
        let cos = 1.00405 / (2 * radius)
        
        let acos = acos(cos) * 180 / Float.pi
        
        let angle : Float = 90 - acos
        
        print("the angle:\(angle)")
        
        return angle
    }
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
