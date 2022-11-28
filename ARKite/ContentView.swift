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

class ViewModel: ObservableObject {
    
    //create closure on object
    var onStartMoveUp: () -> Void = { }
    var onStartMoveDown: () -> Void = { }
    var onStartMoveFront: () -> Void = { }
    var onStartBoost: () -> Void = { }
}

//New Comment AHAH
struct ContentView : View {
    
    @State var showContentView: Bool = false
    
    let vm = ViewModel()
    @State var isStartPlay = false
    @State var rotate = false
    
    var body: some View {
        ZStack {
            ARViewContainer(vm: vm)
            
            // Buttons UI
            if isStartPlay {
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
                                        Text("25")
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
                                vm.onStartMoveUp()
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
                                vm.onStartMoveDown()
                                vm.onStartMoveDown()
                                vm.onStartMoveDown()
                                vm.onStartMoveFront()
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
            } else {
                VStack {
                    Spacer()
                    
                    Button {
                        vm.onStartBoost()
                        
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

struct ARViewContainer: UIViewRepresentable {
    
    let vm: ViewModel
    let mainAnchor = try! Experience.loadARKite()
    @State var isForward = false
    @State var isRotate = false
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        let kite = mainAnchor.findEntity(named: "kite")!
        // Load the "Box" scene from the "Experience" Reality File
        
        let initialPosition = SIMD3<Float>(0,0,0)
        var distanceBetweenKite = SIMD3<Float>(0,0,0)
        
        vm.onStartMoveUp = {
            mainAnchor.notifications.moveUp.post()
            distanceBetweenKite = kite.position
        }
        
        vm.onStartMoveDown = {
            mainAnchor.notifications.moveDown.post()
            distanceBetweenKite = kite.position
        }
        
        vm.onStartMoveFront = {
            //Find kite Angle
            if isForward{
                var travelDistance = simd_distance(distanceBetweenKite, kite.position)
                isRotate = false
                isForward = false
                //buat inisialisasi awal
                travelDistance = (travelDistance == 0) ? 1.004 : travelDistance
                let kiteAngle = findAngle(kiteCoordinates: kite.position, initialCoordinates: initialPosition, travelDistance: travelDistance)
                for _ in 1...Int(kiteAngle){
                    mainAnchor.notifications.frontRotate.post()
                }
                mainAnchor.notifications.moveFront.post()
                for _ in 1...Int(kiteAngle){
                    mainAnchor.notifications.frontRotate.post()
                }
                distanceBetweenKite = kite.position
                
                //rotate
                mainAnchor.actions.rotationForward.onAction = rotateOn
            }
        }
        
        vm.onStartBoost = {
            mainAnchor.notifications.kiteStart.post()
            mainAnchor.notifications.showCoin.post()
            distanceBetweenKite = kite.position
            mainAnchor.actions.kiteStartEnd.onAction = rotateOn
            
            //Recursion
            //setelah rotateEnd dipanggil, bakal ngelakuin rotateRecursion
            
            //notifytabrakan
            randomPosition(kite)
        }
        
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(mainAnchor)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
    func findAngle(kiteCoordinates: SIMD3<Float>, initialCoordinates: SIMD3<Float>, travelDistance: Float) -> Float{
        
        let radius = simd_distance(kiteCoordinates, initialCoordinates)
        
        let cos = travelDistance / (2 * radius)
        
        let acos = acos(cos) * 180 / Float.pi
        
        var angle : Float = 90 - acos
        
        print("the angle:\(angle)")
        
        angle = (angle > 1) ? angle : 1
        
        return angle
    }
    
    func rotateRecursion(_ entity: Entity?) {
        if isRotate{
            mainAnchor.notifications.moveRotateClockwise.post()
            mainAnchor.actions.rotateEnd.onAction = rotateRecursion
        }
    }
    
    func rotateOn(_ entity: Entity?){
        isRotate = true
        isForward = true
        rotateRecursion(entity)
        print("Rotate is called!")
    }
    
    func randomPosition(_ entity: Entity?) {
        let kite = entity!
//        let coin1 = mainAnchor.findEntity(named: "coin1")!
//        let coin2 = mainAnchor.findEntity(named: "coin2")!
//        let coin3 = mainAnchor.findEntity(named: "coin3")!
//        let coin4 = mainAnchor.findEntity(named: "coin4")!
        
        let posisiLayanganX = kite.position.x
        let posisiLayanganY = kite.position.y
        let posisiLayanganZ = kite.position.z
//
//        let posX1 = Float.random(in: posisiLayanganX-1...posisiLayanganX+1)
//        let posY1 = Float.random(in: posisiLayanganY-1...posisiLayanganY+1)
//        let posZ1 = Float.random(in: posisiLayanganZ-1...posisiLayanganZ+1)
//        coin1.position = SIMD3<Float>(posX1,posY1,posZ1)
//
//        let posX2 = Float.random(in: posisiLayanganX-1...posisiLayanganX+1)
//        let posY2 = Float.random(in: posisiLayanganY-1...posisiLayanganY+1)
//        let posZ2 = Float.random(in: posisiLayanganZ-1...posisiLayanganZ+1)
//        coin2.position = SIMD3<Float>(posX2,posY2,posZ2)
//
//        let posX3 = Float.random(in: posisiLayanganX-1...posisiLayanganX+1)
//        let posY3 = Float.random(in: posisiLayanganY-1...posisiLayanganY+1)
//        let posZ3 = Float.random(in: posisiLayanganZ-1...posisiLayanganZ+1)
//        coin3.position = SIMD3<Float>(posX3,posY3,posZ3)
//
//        let posX4 = Float.random(in: posisiLayanganX-1...posisiLayanganX+1)
//        let posY4 = Float.random(in: posisiLayanganY-1...posisiLayanganY+1)
//        let posZ4 = Float.random(in: posisiLayanganZ-1...posisiLayanganZ+1)
//        coin4.position = SIMD3<Float>(posX4,posY4,posZ4)
        
        let allDisplayAction = mainAnchor.actions.allActions.filter({$0.identifier.hasPrefix("CollisionCoin")})
        
        print(allDisplayAction.count)
        
        mainAnchor.actions.collisionCoin1.onAction = {entity in
            print("Coin 1 has collide!")
        }
                
//                for displayAction in allDisplayAction {
//                    displayAction.onAction = {entity in
//
//                        if let entity = entity{
//                            let posX1 = Float.random(in: posisiLayanganX-1...posisiLayanganX+1)
//                            let posY1 = Float.random(in: posisiLayanganY-1...posisiLayanganY+1)
//                            let posZ1 = Float.random(in: posisiLayanganZ-1...posisiLayanganZ+1)
//                            entity.position = SIMD3<Float>(posX1,posY1,posZ1)
//                            print("\(entity.name) has collide")
//                        }
//                    }
//                }
    }
    
    // This needs to be an instance variable, otherwise it'll
    // get deallocated immediately and the animation won't start.
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif



//HStack{
//    Spacer()
//    VStack{
//        Button("MOVE UP"){
//            vm.onStartMoveUp()
//        }
//        .padding()
//
//        Button("MOVE DOWN"){
//            vm.onStartMoveDown()
//        }
//        Button("FRONT"){
//            vm.onStartMoveFront()
//        }
//        .padding()
//        Button("ROTATE"){
//            vm.onStartRotate()
//        }
//        .padding()
//        Button("START"){
//            vm.onStartBoost()
//        }
//        .padding()
//    }
// }
