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
    var showObstacle: () -> Void = { }
}

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
    @State var collisionSubscription:Cancellable?
    @State var isForward = false
    @State var isRotate = false
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        let kite = mainAnchor.findEntity(named: "kite")!
        kite.generateCollisionShapes(recursive: true)
        
        guard let kite = mainAnchor.findEntity(named: "kite") else { fatalError("Kite is nill")}
        collisionSubscription = arView.scene.publisher(for: CollisionEvents.Began.self, on:nil).sink(receiveValue: onCollisionBegan)

        var isRotate = false
        
        var distanceBetweenKite = SIMD3<Float>(0,0,0)
        
        vm.onStartMoveUp = {
            mainAnchor.notifications.moveUp.post()
        
        let initialPosition = SIMD3<Float>(0,0,0)
        
        
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
            
        }
        
        vm.showObstacle = {
            mainAnchor.notifications.showObstacle.post()
        }
        
        
//        (kite as? Entity & HasPhysics & HasCollision)?.physicsBody = PhysicsBodyComponent(massProperties: .default, material: .default, mode: .dynamic)
//        (kite as? Entity & HasPhysics & HasCollision)?.generateCollisionShapes(recursive: true)
//        (kite as? Entity & HasPhysics & HasCollision)?.collision = CollisionComponent(shapes: [.generateBox(size: [0.3, 0.3, 0.3])], mode: .trigger, filter: .sensor)
//
//        (obstacle as? Entity & HasPhysics & HasCollision)?.physicsBody = PhysicsBodyComponent(massProperties: .default, material: .default, mode: .dynamic)
//        (obstacle as? Entity & HasPhysics & HasCollision)?.generateCollisionShapes(recursive: true)
//        (obstacle as? Entity & HasPhysics & HasCollision)?.collision = CollisionComponent(shapes: [.generateBox(size: [0.3, 0.3, 0.3])], mode: .trigger, filter: .sensor)
//
//
//        collisionSubscriptions.append(arView.scene.subscribe(to: CollisionEvents.Began.self) { event in
//            print("-----++++++++++++++++++-----------")
//            print("Collision Start")
//            print("-----++++++++++++++++++-----------")
//        })
//
//        collisionSubscriptions.append(arView.scene.subscribe(to: CollisionEvents.Ended.self) { event in
//            print("-----++++++++++++++++++-----------")
//            print("Collision Ended")
//            print("-----++++++++++++++++++-----------")
//        })
//
        
        // TODO: - SHOW OBSTACLE
        Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { timer in
            // after 10 seconds, show the osbtacle
            obstacle.position = simd_float3(0, 0, 0)
            
            vm.showObstacle()
            
            // set the initial postition first
            
            Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { secTimer in
                obstacle.move(to: .init(translation: [kite.position.x, kite.position.y - 0.3, kite.position.z]), relativeTo: kite, duration: 3)
//
                print("================================================")
                print("Kite Position: \(kite.position)")
                print("================================================")
                
                print("Timer 2 work")
            }
            print("Timer 1 Work")
            timer.invalidate()
            
        }
        
        // MARK: -FUNCTIONS
        
        func rotate(){
            mainAnchor.notifications.moveRotateClockwise.post()
            distanceBetweenKite = kite.position
            mainAnchor.actions.kiteStartEnd.onAction = rotateOn
            
            //Recursion
            //setelah rotateEnd dipanggil, bakal ngelakuin rotateRecursion
            mainAnchor.actions.rotateEnd.onAction = rotateRecursion
        }
        
        func rotateRecursion(_ entity: Entity?) {
            if isRotate{
                mainAnchor.notifications.moveRotateClockwise.post()
                mainAnchor.actions.rotateEnd.onAction = rotateRecursion
            }
        }
        
        func rotateOn(_ entity: Entity?){
            isRotate = true
        }
        
        func rotateOff(_ entity: Entity?){
            isRotate = false
        }
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(mainAnchor)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    private func onCollisionBegan(_ event: CollisionEvents.Began) {
           print("collision started")
            let firstEntity = event.entityA
            let secondEntity = event.entityB
            // Take appropriate action...
        
    }
    
   
    
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

