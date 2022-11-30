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
    //    @Published fileprivate var coin1: Entity
    //    @Published fileprivate var coin2: Entity
    //    @Published fileprivate var coin3: Entity
    //    @Published fileprivate var coin4: Entity
    
    @Published fileprivate var isForward = false
    @Published fileprivate var isRotate = false
    @State fileprivate var distanceBetweenKite = SIMD3<Float>(0,0,0)
    
    let mainAnchor = try! Experience.loadARKite()
    let arView = ARView(frame: .zero)
    fileprivate let initialPosition = SIMD3<Float>(0,0,0)
//    var subscriptions: [Cancellable] = []
    //Initialize untuk ambil entity
    init(){
        self.kite = mainAnchor.findEntity(named: "kite")!
        self.obstacle = mainAnchor.findEntity(named: "obstacle")!
//        let coin2 = mainAnchor.findEntity(named: "coin2")!
        
        //        self.randomCoinPosition(kite)
//        mainAnchor.actions.coinIsCollided.onAction = coinCollide
        //        self.coin1 = mainAnchor.findEntity(named: "coin1")!
        //        self.coin2 = mainAnchor.findEntity(named: "coin2")!
        //        self.coin3 = mainAnchor.findEntity(named: "coin3")!
        //        self.coin4 = mainAnchor.findEntity(named: "coin4")!
        
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
        
        //munculin koin
        mainAnchor.notifications.showCoin.post()
        
        //        collidecoin1
        //        mainAnchor.actions.collisionCoin1.onAction = randomPositionCoin1(_entity:)
        //        collidecoin2
        //        mainAnchor.actions.collisionCoin1.onAction = randomPositionCoin2(_entity:)
        //        collidecoin3
        //        mainAnchor.actions.collisionCoin1.onAction = randomPositionCoin3(_entity:)
        //        collidecoin4
        //        mainAnchor.actions.collisionCoin1.onAction = randomPositionCoin4(_entity:)
        
        
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
    
    func coinCollide(_ entity: Entity?) {
        
        if let coin = entity {
            let newCoin = mainAnchor.findEntity(named: coin.name)!.clone(recursive: true)
            let posisiCoinX = newCoin.position.x
            let posisiCoinY = newCoin.position.y
            
//            coin.removeFromParent()
            let posX1 = posisiCoinX+0.1
            let posY1 = posisiCoinY+0.1
            let posZ1 = newCoin.position.z
           
            mainAnchor.addChild(newCoin)
            
            newCoin.position = SIMD3<Float>(posX1,posY1,posZ1)
            print(posX1)
            print(posY1)
            print(posZ1)
            
        }
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
    //    fileprivate func randomCoinPosition(_ entity: Entity?) {
    //        let kite = entity!
    ////        let coin = entity!
    //        let posisiLayanganX = kite.position.x
    //        let posisiLayanganY = kite.position.y
    ////        let posisiLayanganZ = kite.position.z
    //        let allDisplayAction = mainAnchor.actions.allActions.filter({$0.identifier.hasPrefix("CollisionCoin")})
    //        for displayAction in allDisplayAction {
    //            displayAction.onAction = {entity in
    //
    //                if let entity = entity{
    //                    let posX1 = Float.random(in: posisiLayanganX-0.1...posisiLayanganX+0.1)
    //                    let posY1 = Float.random(in: posisiLayanganY-0.1...posisiLayanganY+0.1)
    //                    let posZ1 = entity.position.z
    //                    entity.position = SIMD3<Float>(posX1,posY1,posZ1)
    //                    print("\(kite.position)")
    //                    print("\(entity.position)")
    //                }
    //            }
    //        }
    ////    func randomPositionCoin1 (_entity: Entity?) {
    //////        let coin1 = mainAnchor.findEntity(named: "coin1")!
    ////        let initialPositionX1 = coin1.position.x
    ////        let initialPositionY1 = coin1.position.y
    ////        let posX1 = Float.random(in: initialPositionX1-0.1...initialPositionX1+0.1)
    ////        let posY1 = Float.random(in: initialPositionY1-0.1...initialPositionY1+0.1)
    ////        let posZ1 = coin1.position.z
    ////        coin1.position = SIMD3<Float>(posX1,posY1,posZ1)
    ////        print("\(coin1.name) has collide")
    ////    }
    ////    func randomPositionCoin2 (_entity: Entity?) {
    //////        let coin2 = mainAnchor.findEntity(named: "coin2")!
    ////        let initialPositionX2 = coin2.position.x
    ////        let initialPositionY2 = coin2.position.y
    ////        let posX2 = Float.random(in: initialPositionX2-0.9...initialPositionX2+0.9)
    ////        let posY2 = Float.random(in: initialPositionY2-0.9...initialPositionY2+0.9)
    ////        let posZ2 = coin2.position.z
    ////        coin2.position = SIMD3<Float>(posX2,posY2,posZ2)
    ////        print("\(coin2.name) has collide")
    ////    }
    ////    func randomPositionCoin3 (_entity: Entity?) {
    //////        let coin3 = mainAnchor.findEntity(named: "coin3")!
    ////        let initialPositionX3 = coin3.position.x
    ////        let initialPositionY3 = coin3.position.y
    ////
    ////        let posX3 = Float.random(in: initialPositionX3-0.9...initialPositionX3+0.9)
    ////        let posY3 = Float.random(in: initialPositionY3-0.9...initialPositionY3+0.9)
    ////        let posZ3 = coin3.position.z
    ////        coin3.position = SIMD3<Float>(posX3,posY3,posZ3)
    ////        print("\(coin3.name) has collide")
    ////    }
    ////    func randomPositionCoin4 (_entity: Entity?) {
    //////        let coin4 = mainAnchor.findEntity(named: "coin4")!
    ////        let initialPositionX4 = coin4.position.x
    ////        let initialPositionY4 = coin4.position.y
    ////
    ////        let posX4 = Float.random(in: initialPositionX4-0.9...initialPositionX4+0.9)
    ////        let posY4 = Float.random(in: initialPositionY4-0.9...initialPositionY4+0.9)
    ////        let posZ4 = coin4.position.z
    ////        coin4.position = SIMD3<Float>(posX4,posY4,posZ4)
    ////        print("\(coin4.name) has collide")
    ////    }
    //
    //
    //
    //
    //
    //
    //
    ////        var initialPositionZ1 = coin1.position.z
    //
    //
    ////        var initialPositionZ2 = coin2.position.z
    //
    //
    ////        var initialPositionZ3 = coin3.position.z
    //
    //
    ////        var initialPositionZ4 = coin4.position.z
    //
    //
    //
    //
    //
    //    }
}
