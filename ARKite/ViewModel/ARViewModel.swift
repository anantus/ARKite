//
//  ARViewModel.swift
//  ARKite
//
//  Created by Maheswara Ananta Argono on 28/11/22.
//
import SwiftUI
import RealityKit
import ARKit
import Combine

class ARViewModel: ObservableObject {
    @Published fileprivate var kite: Entity
    @Published fileprivate var obstacle: Entity
    @Published fileprivate var isForward = false
    @Published fileprivate var isRotate = false
    @Published var coinGame = 0
    
    @State fileprivate var distanceBetweenKite = SIMD3<Float>(0,0,0)
    
    let mainAnchor = try! Experience.loadARKite()
    let arView = ARView(frame: .zero)
    let threadSpool = try! ModelEntity.load(named: "GULUNGAN")
    fileprivate let initialPosition = SIMD3<Float>(0,0,0)
    
    //Initialize untuk ambil entity
    init(){
        self.kite = mainAnchor.findEntity(named: "kite")!
        self.obstacle = mainAnchor.findEntity(named: "obstacle")!
        self.randomCoinPosition(kite)
        self.threadEntity()
        
    }
    
    
    //Function layangan untuk menjauh dari anchor
    func kiteMoveUp(){
        mainAnchor.notifications.moveUp.post()
        distanceBetweenKite = kite.position
    }
    
    //Function layangan untuk mendekat dari anchor
    func kiteMoveDown(_ entity: Entity?){
        mainAnchor.notifications.moveDown.post()
        mainAnchor.actions.moveDownEnd.onAction = rotateOn
    }
    
    //Function untuk menggerakan kite sekitar pusat anchor
    func kiteMoveFront(){
        
        //Find kite Angle
        if isForward{
            isRotate = false
            isForward = false
            
            //Mencari angle tilt kite
            let kiteAngle = findAngle(
                kiteCoordinates: kite.position,
                initialCoordinates: initialPosition)
            
            //tilt kite
            kiteTilt(kiteAngle: kiteAngle)
            mainAnchor.notifications.moveFront.post()
            kiteTilt(kiteAngle: kiteAngle)
            
            //rotate loop kite
            mainAnchor.actions.rotationForward.onAction = kiteMoveDown(_:)
        }
    }
    
    //Function untuk penerbangan kite awal
    func kiteFlyStart(){
        mainAnchor.notifications.kiteStart.post()
        distanceBetweenKite = kite.position
        mainAnchor.actions.kiteStartEnd.onAction = rotateOn
    }
    
    //Function untuk mencari angle
    func findAngle(kiteCoordinates: SIMD3<Float>, initialCoordinates: SIMD3<Float>) -> Float{
        let radius = simd_distance(kiteCoordinates, initialCoordinates)
        let cos: Float = 1.004 / (2 * radius)
        let acos = acos(cos) * 180 / Float.pi
        let angle : Float = 90 - acos
        return angle
    }
    
    //Function untuk tilt kite sebanyak angle
    func kiteTilt(kiteAngle: Float){
        for _ in 1...Int(kiteAngle){
            mainAnchor.notifications.frontRotate.post()
        }
    }
    
    //Function untuk merotasi secara rekursif
    func rotateRecursion(_ entity: Entity?) {
        if isRotate{
            mainAnchor.notifications.moveRotateClockwise.post()
            mainAnchor.actions.rotateEnd.onAction = rotateRecursion
        }
    }
    
    //Function untuk menyalakan rotasi rekursif
    fileprivate func rotateOn(_ entity: Entity?){
        isRotate = true
        isForward = true
        rotateRecursion(entity)
    }
    
    
    
    //Function untuk menyalakan obstacle
    fileprivate func obstacleAppear(){
        Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { timer in
            // after 10 seconds, show the osbtacle
            self.obstacle.position = simd_float3(0, 0, 0)
            
            self.mainAnchor.notifications.showObstacle.post()
            
            // set the initial postition first
            
            Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { secTimer in
                self.obstacle.move(to: .init(translation: [self.kite.position.x, self.kite.position.y - 0.3, self.kite.position.z]), relativeTo: self.kite, duration: 3)
                //
                print("================================================")
                print("Kite Position: \(self.kite.position)")
                print("================================================")
                
                print("Timer 2 work")
            }
            print("Timer 1 Work")
            timer.invalidate()
        }
    }
    
    
    
    //Function untuk mengubah posisi koin setelah collide
    fileprivate func randomCoinPosition(_ entity: Entity?) {
        let kite = entity!
        let posisiLayanganX = kite.position.x
        let posisiLayanganY = kite.position.y
        let posisiLayanganZ = kite.position.z
        let allDisplayAction = mainAnchor.actions.allActions.filter({$0.identifier.hasPrefix("CollisionCoin")})
        print(allDisplayAction.count)
        
        for displayAction in allDisplayAction {
            displayAction.onAction = {entity in
                if let entity = entity{
                    let posX1 = Float.random(in: posisiLayanganX-2...posisiLayanganX-1)
                    let posY1 = Float.random(in: posisiLayanganY-2...posisiLayanganY-1)
                    let posZ1 = Float.random(in: posisiLayanganZ-2...posisiLayanganZ-1)
                    entity.position = SIMD3<Float>(posX1,posY1,posZ1)
                    entity.move(to: .init(translation: [posX1, posY1, posZ1]), relativeTo: self.kite, duration: 0)
                    print("\(entity.name) has collide")
                    self.coinGame += 1
                    self.mainAnchor.notifications.showCoin.post()
                }
            }
        }
    }
    
    fileprivate func threadEntity(){
        let cameraAnchor = AnchorEntity(.camera)
        cameraAnchor.addChild(threadSpool)
        arView.scene.addAnchor(cameraAnchor)
        
        // Move the box in front of the camera slightly, otherwise
        // it will be centered on the camera position and we will
        // be inside the box and not be able to see it
        threadSpool.transform.scale *= 0.002
        threadSpool.transform.translation = [0, -0.2, -0.3]
    }
    
    func stretchRotateThread(){
        let radians = -90 * Float.pi / 180.0
        threadSpool.move(to: .init(rotation: simd_quatf(angle: radians, axis: SIMD3<Float>(1,0,0))), relativeTo: self.threadSpool, duration: 1)
    }
    
    func pullRotateThread(){
        let radians = 90 * Float.pi / 180.0
        threadSpool.move(to: .init(rotation: simd_quatf(angle: radians, axis: SIMD3<Float>(1,0,0))), relativeTo: self.threadSpool, duration: 1)
    }
}
