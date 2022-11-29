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
    fileprivate let initialPosition = SIMD3<Float>(0,0,0)
    
    //Initialize untuk ambil entity
    init(){
        self.kite = mainAnchor.findEntity(named: "kite")!
        self.obstacle = mainAnchor.findEntity(named: "obstacle")!
        mainAnchor.children[0] = mainAnchor.findEntity(named: "obstacle")!
        self.randomCoinPosition(kite)
//        print(mainAnchor)
        print(kite.children[0].children[0])
        
    }
    
    
    
    //Function layangan untuk menjauh dari anchor
    func kiteMoveUp(){
        mainAnchor.notifications.moveUp.post()
        distanceBetweenKite = kite.position
    }
    
    //Function layangan untuk mendekat dari anchor
    func kiteMoveDown(){
        mainAnchor.notifications.moveDown.post()
        distanceBetweenKite = kite.position
    }
    
    //Function untuk menggerakan kite sekitar pusat anchor
    func kiteMoveFront(){
        
        //Find kite Angle
        if isForward{

            //Mencari panjang layang-layang berjalan
            var travelDistance = simd_distance(distanceBetweenKite, kite.position)
            distanceBetweenKite = kite.position
            print("travel distance: \(travelDistance)")
            
            //buat inisialisasi awal distance perjalanan layangan
            travelDistance = (travelDistance == 0) ? 1.004 : travelDistance
            isRotate = false
            isForward = false
            
            //Mencari angle tilt kite
            let kiteAngle = findAngle(
                kiteCoordinates: kite.position,
                initialCoordinates: initialPosition,
                travelDistance: travelDistance)
            
            //tilt kite
            kiteTilt(kiteAngle: kiteAngle)
            mainAnchor.notifications.moveFront.post()
            kiteTilt(kiteAngle: kiteAngle)
            
            //rotate loop kite
            mainAnchor.actions.rotationForward.onAction = rotateOn
        }
    }
    
    //Function untuk penerbangan kite awal
    func kiteFlyStart(){
        mainAnchor.notifications.kiteStart.post()
        distanceBetweenKite = kite.position
        mainAnchor.actions.kiteStartEnd.onAction = rotateOn
    }
    
    //Function untuk mencari angle
    func findAngle(kiteCoordinates: SIMD3<Float>, initialCoordinates: SIMD3<Float>, travelDistance: Float) -> Float{
        let radius = simd_distance(kiteCoordinates, initialCoordinates)
        print("radius \(radius)")
        let cos: Float = 1.004 / (2 * radius)
        let acos = acos(cos) * 180 / Float.pi
        var angle : Float = 90 - acos
        
        print("the angle:\(angle)")
        angle = (angle > 1) ? angle : 1
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
        
        for displayAction in allDisplayAction {
            displayAction.onAction = {entity in
                if let entity = entity{
                    let posX1 = Float.random(in: posisiLayanganX-0.1...posisiLayanganX+0.1)
                    let posY1 = Float.random(in: posisiLayanganY-0.1...posisiLayanganY+0.1)
                    let posZ1 = Float.random(in: posisiLayanganZ-0.1...posisiLayanganZ+0.1)
                    entity.position = SIMD3<Float>(posX1,posY1,posZ1)
                    print("\(entity.name) has collide")
                }
            }
        }
    }
}
