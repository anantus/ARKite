//
//  KiteViewModel
//  ARKite
//
//  Created by Maheswara Ananta Argono on 28/11/22.
//

import SwiftUI
import RealityKit
import ARKit
import Combine

class BajajKiteViewModel: ObservableObject {
    let mainAnchor = try! Experience.loadBajajKite()
    
    @Published fileprivate var kite: Entity
    @Published fileprivate var obstacle: Entity
    @Published fileprivate var isForward = false
    @Published fileprivate var isRotate = false
    @Published var gameOver = false
    @Published var sound: Sound!
    @Published var addCoin = true
    @Published var coinGame = 0
    @Published var showInstruction = false
    @Published var kiteIsAppear: Bool = false
    
    fileprivate var initialKitePosition = SIMD3<Float>(0,0,0)
    let threadSpool = try! ModelEntity.load(named: "GULUNGAN")
    fileprivate let initialPosition = SIMD3<Float>(0,0,0)
    var arView: ARView?
    
    @ObservedObject var collectionVM = CollectionViewModel()
    
    //Initialize untuk ambil entity
    init(){
        arView = ARView(frame: .zero)
        self.kite = mainAnchor.findEntity(named: "kite")!
        self.obstacle = mainAnchor.findEntity(named: "obstacle")!
        self.randomCoinPosition(kite)
        self.changeKiteStatus()
    }
    
    func changeKiteStatus() {
        mainAnchor.actions.sceneStart.onAction = { _ in
            self.kiteIsAppear.toggle()
            self.showInstruction.toggle()
        }

    }
    //Function layangan untuk menjauh dari anchor
    func kiteMoveUp(){
        mainAnchor.notifications.moveUp.post()
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
            self.initialKitePosition = kite.position
            print(self.initialKitePosition)
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
            mainAnchor.actions.rotationForward.onAction = kiteMoveDown
        }
    }
    
    //Function untuk penerbangan kite awal
    func kiteFlyStart(){
        if collectionVM.gestures{
            threadEntity()
        }
        mainAnchor.notifications.kiteStart.post()
        mainAnchor.actions.kiteStartEnd.onAction = startGameInitiate
    }
    
    //Function untuk menyalakan rotasi rekursif
    fileprivate func rotateOn(_ entity: Entity?){
        isRotate = true
        isForward = true
        print(kite.position)
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { _ in
            if self.initialKitePosition.x < self.kite.position.x{
                self.rotateRecursionClockwise(entity)
            } else{
                self.rotateRecursionAntiClockwise(entity)
            }
        }
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
    fileprivate func rotateRecursionClockwise(_ entity: Entity?) {
        if isRotate{
            mainAnchor.notifications.moveRotateClockwise.post()
            mainAnchor.actions.rotateEnd.onAction = rotateRecursionClockwise
        }
    }
    
    //FUnction untuk merotasi melawan arah jarum jam secara rekursif
    fileprivate func rotateRecursionAntiClockwise(_ entity: Entity?) {
        if isRotate{
            mainAnchor.notifications.moveRotateAntiClockwise.post()
            mainAnchor.actions.rotateEndAC.onAction = rotateRecursionAntiClockwise
        }
    }
    
    fileprivate func startGameInitiate(_ entity: Entity?){
        mainAnchor.notifications.showCoin.post()
        mainAnchor.notifications.showObstacle.post()
        animateCoin(entity)
        rotateOn(entity)
        mainAnchor.actions.showObstacleDone.onAction = obstacleAppear
    }
    
    fileprivate func obstacleAppear(_ entity: Entity?){
        animateObstacle(entity)
        obstacleMove(entity)
    }
    
    fileprivate func animateObstacle(_ entity: Entity?){
        mainAnchor.notifications.animateObstacle.post()
        mainAnchor.actions.animateObstacleDone.onAction = animateObstacle
    }
    
    fileprivate func animateCoin(_ entity: Entity?){
        mainAnchor.notifications.animateCoin.post()
        mainAnchor.actions.animateCoinDone.onAction = animateCoin
        
    }
    
    //Function untuk menyalakan obstacle
    fileprivate func obstacleMove(_ entity: Entity?){
        // after 10 seconds, show the osbtacle
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { secTimer in
            
            let kitePosition = self.kite.position(relativeTo: nil)
            let obstaclePosition = self.obstacle.position(relativeTo: nil)
            
            if !self.gameOver{
                if kitePosition.x > obstaclePosition.x{
                    self.mainAnchor.notifications.plusXObstacle.post()
                }else{
                    self.mainAnchor.notifications.minXObstacle.post()
                }
                if kitePosition.y > obstaclePosition.y{
                    self.mainAnchor.notifications.plusYObstacle.post()
                }else{
                    self.mainAnchor.notifications.minYObstacle.post()
                }
                if kitePosition.z > obstaclePosition.z{
                    self.mainAnchor.notifications.plusZObstacle.post()
                }else{
                    self.mainAnchor.notifications.minZObstacle.post()
                }
            }else {
                secTimer.invalidate()
            }
            
            self.mainAnchor.actions.gameOver.onAction = {_ in
                if self.gameOver == false{
                    self.collectionVM.addCoin(coinsAfterGame: self.coinGame)
                    self.sound.playObstacleSound()
                    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
                    self.gameEnd()
                    
                }
            }
        }
    }
    
    func gameEnd(){
        self.gameOver = true
        self.sound.stopMusic()
        if let arView = self.arView {
            arView.scene.anchors.removeAll()
            arView.removeFromSuperview()
            
        }
        
        self.arView = nil
    }
    
    
    
    //Function untuk mengubah posisi koin setelah collide
    fileprivate func randomCoinPosition(_ entity: Entity?) {
        let allDisplayAction = mainAnchor.actions.allActions.filter({$0.identifier.hasPrefix("CollisionCoin")})
        
        for displayAction in allDisplayAction {
            displayAction.onAction = {entity in
                if let entity = entity{
                    if self.addCoin{
                        self.addCoin = false
                        let posX1 = Float.random(in: -10 ... 10)
                        let posY1 = Float.random(in: 7.5 ... 10)
                        let posZ1 = Float.random(in: -15 ... -10)
                        entity.position = SIMD3<Float>(posX1,posY1,posZ1)
                        self.coinGame += 1
                        self.sound.playCoinSound()
                        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { secTimer in
                            self.mainAnchor.notifications.showCoin.post()
                            self.addCoin = true
                        }
                    }
                }
            }
        }
    }
    
    fileprivate func threadEntity(){
        let cameraAnchor = AnchorEntity(.camera)
        cameraAnchor.addChild(threadSpool)
        arView!.scene.addAnchor(cameraAnchor)
        threadSpool.transform.scale *= 0.002
        threadSpool.transform.translation = [0, -0.2, -0.3]
    }
    
    func stretchRotateThread(){
        let radians = -90 * Float.pi / 180.0
        threadSpool.move(to: .init(rotation: simd_quatf(angle: radians, axis: SIMD3<Float>(1,0,0))), relativeTo: self.threadSpool, duration: 1)
    }
    
    func pullRotateThread(){
        let radians = 90 * Float.pi / 180.0
        threadSpool.move(to: .init(rotation: simd_quatf(angle: radians, axis: SIMD3<Float>(1,0,0))), relativeTo: self.threadSpool, duration: 0.5)
    }
}
