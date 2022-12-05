////
////  TestVolume.swift
////  ARKite
////
////  Created by Maheswara Ananta Argono on 04/12/22.
////
//
//import SwiftUI
//import AVKit
//
//struct TestVolume: View {
//    
//    @State var audioPlayer: AVAudioPlayer?
//    @State var audioPlayer2: AVAudioPlayer?
//    @State var sound: Sound!
//    
//    var body: some View {
//        ZStack {
//                    VStack {
//                            Text("Play").font(.system(size: 45)).font(.largeTitle)
//                        HStack {
//                            Spacer()
//                            Button(action: {
////                                self.audioPlayer.play()
////                                self.audioPlayer2.play()
//                                self.sound.playCoinSound()
//                            }) {
//                                Image(systemName: "play.circle.fill").resizable()
//                                    .frame(width: 50, height: 50)
//                                    .aspectRatio(contentMode: .fit)
//                            }
//                            Spacer()
//                            Button(action: {
////                                self.audioPlayer.pause()
//                            }) {
//                                Image(systemName: "pause.circle.fill").resizable()
//                                    .frame(width: 50, height: 50)
//                                    .aspectRatio(contentMode: .fit)
//                            }
//                            Spacer()
//                        }
//                    }
//                }
//                .onAppear {
//                    self.sound = Sound(volumeSFX: 1.0, avAudioPlayer1: $audioPlayer, avAudioPlayer2: $audioPlayer2)
//                }
//    }
//}
//
//struct TestVolume_Previews: PreviewProvider {
//    static var previews: some View {
//        TestVolume()
//    }
//}
