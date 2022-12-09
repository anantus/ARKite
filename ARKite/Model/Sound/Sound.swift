//
//  AVAudioPlayer.swift
//  ARKite
//
//  Created by Maheswara Ananta Argono on 04/12/22.
//

import Foundation
import AVFAudio
import SwiftUI

struct Sound{
    @Binding var avAudioPlayer1: AVAudioPlayer!
    @Binding var avAudioPlayer2: AVAudioPlayer!
    @Binding var musicAudio: AVAudioPlayer!
    
    var CollectVM =  CollectionViewModel()
    var audioVolume = 0
    var musicVolume = 0
    
    
    func getAvAudioPlayer(soundName: String, soundType: String) -> AVAudioPlayer{
        let sound = Bundle.main.path(forResource: soundName, ofType: soundType)
        let audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        audioPlayer.volume = CollectVM.volumeSFX
        
        return audioPlayer
    }
    
    func playCoinSound(){
        avAudioPlayer1 = getAvAudioPlayer(soundName: "Coin", soundType: "wav")
        
        let randomInt = Int.random(in: 0..<3)
        
        if randomInt == 0{
            avAudioPlayer2 = getAvAudioPlayer(soundName: "Gg", soundType: "m4a")
        } else if randomInt == 1{
            avAudioPlayer2 = getAvAudioPlayer(soundName: "Asik", soundType: "m4a")
        }else{
            avAudioPlayer2 = getAvAudioPlayer(soundName: "Yoi", soundType: "m4a")
        }
        avAudioPlayer1.play()
        avAudioPlayer2.play()
        
    }
    
    func playObstacleSound(){
        avAudioPlayer1 = getAvAudioPlayer(soundName: "Obstacle", soundType: "mp3")
        
        let randomInt = Int.random(in: 0..<2)
        
        if randomInt == 0{
            avAudioPlayer2 = getAvAudioPlayer(soundName: "Yah", soundType: "m4a")
        }else{
            avAudioPlayer2 = getAvAudioPlayer(soundName: "Aduh", soundType: "m4a")
        }
        
        //play sound
        avAudioPlayer1.play()
        avAudioPlayer2.play()
    }
    
    func playMusic(){
        let sound = Bundle.main.path(forResource: "KiteSong", ofType: "wav")
        musicAudio = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        musicAudio.numberOfLoops =  -1 // set your count here
        musicAudio.volume = CollectVM.volumeMusic
        musicAudio.play()
    }
    
    func stopMusic(){
        musicAudio.stop()
    }
    
    func changeVol(sfxVol: Float, musicVol: Float){
        CollectVM.volumeSFX = sfxVol
        CollectVM.volumeMusic = musicVol
        musicAudio.volume = musicVol
    }
}
