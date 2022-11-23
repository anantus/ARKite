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
//    var onStartCoin: () -> Void = { }
}

//New Comment AHAH
struct ContentView : View {
    
    @State var showContentView: Bool = false
    
    let vm = ViewModel()
    @State var isStartPlay = false
    
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
                        Button {
                            // TODO: rotate kite
                            vm.onStartRotate()
                        } label: {
                            ZStack(alignment: .top) {
                                LinearGradient(gradient: Gradient(colors: [Color.init(hex: "106514"), Color.init(hex: "3C8F49")]), startPoint: .top, endPoint: .bottom)
                                    .frame(width: 88, height: 89)
                                    .contentShape(RoundedRectangle(cornerRadius: 27, style: .continuous))
                                    .cornerRadius(27)
                                
                                
                                LinearGradient(gradient: Gradient(colors: [Color.init(hex: "57BD6A"), Color.init(hex: "39A239")]), startPoint: .top, endPoint: .bottom)
                                    .frame(width: 82, height: 82)
                                    .contentShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                                    .cornerRadius(25)
                                    .overlay {
                                        VStack(spacing: 8) {
                                            Image(systemName: "arrow.clockwise")
                                                .font(.title)
                                                .fontWeight(.bold)
                                                .foregroundColor(.white)
                                            
                                            Text("ROTATE")
                                                .font(.system(.subheadline, design: .rounded, weight: .heavy))
                                                .foregroundColor(.white)
                                        }
                                    }
                            }
                        }
                        
                        
                        Spacer()
                        
                        VStack(spacing: 14) {
                            Button {
                                vm.onStartMoveFront()
                                // TODO: Move Front Kite
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
                                                
                                                Text("Pull Front")
                                                    .font(.system(.subheadline, design: .rounded, weight: .heavy))
                                                    .foregroundColor(.white)
                                            }
                                        }
                                }
                            }
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
            }
            else {
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
    
//    @State var coinShowed = false
    
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
        
//        vm.onStartCoin = {
//            mainAnchor.notifications.showCoin.post()
//        }
//
        vm.onStartRotate = {
            mainAnchor.notifications.moveRotateClockwise.post()
        }
        vm.onStartBoost = {
            mainAnchor.notifications.kiteStart.post()
            mainAnchor.notifications.showCoin.post()
//            Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { timer in print("Timer work")
                
                
                    let coin1 = mainAnchor.findEntity(named: "coin1")
                    let coin2 = mainAnchor.findEntity(named: "coin2")
                    let coin3 = mainAnchor.findEntity(named: "coin3")
                    let coin4 = mainAnchor.findEntity(named: "coin4")
            
                    let posisiLayanganX = kite!.position.x
                    let posisiLayanganY = kite!.position.y
                    let posisiLayanganZ = kite!.position.z
                    
                    var posX1 = coin1!.position.x
                    var posY1 = coin1!.position.y
                    var posZ1 = coin1!.position.z
                        
                    var posX2: Float = coin2!.position.x
                    var posY2: Float = coin2!.position.y
                    var posZ2: Float = coin2!.position.z
                    
                    var posX3: Float = coin3!.position.x
                    var posY3: Float = coin3!.position.y
                    var posZ3: Float = coin3!.position.z
                    
                    var posX4: Float = coin4!.position.x
                    var posY4: Float = coin4!.position.y
                    var posZ4: Float = coin4!.position.z
                   
            
            if (coin1?.position == kite!.position) {
                posX1 = Float.random(in: posisiLayanganX-1..<posisiLayanganX+1)
                posY1 = Float.random(in: posisiLayanganY-1..<posisiLayanganY+1)
                posZ1 = Float.random(in: posisiLayanganZ-1..<posisiLayanganZ+1)
                coin1?.position = SIMD3<Float>(posX1,posY1
                                               ,posZ1)
                
            }
            if (coin2?.position == kite!.position) {
                posX2 = Float.random(in: posisiLayanganX-1..<posisiLayanganX+1)
                posY2 = Float.random(in: posisiLayanganY-1..<posisiLayanganY+1)
                posZ2 = Float.random(in: posisiLayanganZ-1..<posisiLayanganZ+1)
                coin2?.position = SIMD3<Float>(posX2,posY2
                                               ,posZ2)
            }
            if (coin3?.position == kite!.position) {
                posX3 = Float.random(in: posisiLayanganX-1..<posisiLayanganX+1)
                posY3 = Float.random(in: posisiLayanganY-1..<posisiLayanganY+1)
                posZ3 = Float.random(in: posisiLayanganZ-1..<posisiLayanganZ+1)
                coin3?.position = SIMD3<Float>(posX3,posY3
                                               ,posZ3)
            }
                
            if (coin4?.position == kite!.position) {
                posX4 = Float.random(in: posisiLayanganX-1..<posisiLayanganX+1)
                posY4 = Float.random(in: posisiLayanganY-1..<posisiLayanganY+1)
                posZ4 = Float.random(in: posisiLayanganZ-1..<posisiLayanganZ+1)
                coin4?.position = SIMD3<Float>(posX4,posY4
                                               ,posZ4)
            }
                    
//                    print("posisi layangan X :", posisiLayanganX)
//                    print("posisi layangan Y :", posisiLayanganY)
//                    print("posisi layangan Z :", posisiLayanganZ)
                    print(posX1)
                    print(posY1)
                    print(posZ1)
                
            
        }
//            mainAnchor.notifications.showCoin.post()
        
        
        
        
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
