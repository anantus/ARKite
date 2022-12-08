//
//  VideoView.swift
//  ARKite
//
//  Created by Ricky Silitonga on 02/12/22.
//

import SwiftUI
import AVKit

struct VideoView: View {
    @Binding var videoName: String
    
    var body: some View {
        ZStack {
            InstructionVideoBackroundPath()
                .fill(Color.init(hex: "A1A1A1"))
                .frame(width: 355, height: 239)
                .opacity(0.5)
            
            PlayerView(videoName: videoName)
                .frame(width: 330, height: 210)
        } .frame(width: 355, height: 239)
    }
}


struct PlayerView: UIViewRepresentable {
    let videoName: String
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<PlayerView>) {
        
    }
    
    func makeUIView(context: Context) -> UIView {
        return LoopingPlayerUIView(fileName: videoName, frame: .zero)
    }
}

class LoopingPlayerUIView: UIView {
    private let playerLayer = AVPlayerLayer()
    private var playerLooper: AVPlayerLooper?
    
    var fileName: String
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(fileName: String, frame: CGRect) {
        self.fileName = fileName
        super.init(frame: frame)
        
        // Load the resource
        let fileUrl = Bundle.main.url(forResource: fileName, withExtension: "mp4")!
        let asset = AVAsset(url: fileUrl)
        let item = AVPlayerItem(asset: asset)
        
        // Setup the player
        let player = AVQueuePlayer()
        playerLayer.player = player
        playerLayer.videoGravity = .resizeAspectFill
        layer.addSublayer(playerLayer)
        
        // Create a new player looper with the queue player and template item
        playerLooper = AVPlayerLooper(player: player, templateItem: item)
        
        // Start the movie
        player.play()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
}

struct InstructionVideoBackroundPath: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        //start point - Top left
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        
        //Move to top right
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY+6))
        
        //Move to bottom right
        path.addLine(to: CGPoint(x: rect.maxX-2, y: rect.maxY-7))
        
        //Move to bottom left
        path.addLine(to: CGPoint(x: rect.minX+4, y: rect.maxY))
        
        //end at top right
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        
        return path
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView(videoName: .constant("Instruction1NEW"))
    }
}
