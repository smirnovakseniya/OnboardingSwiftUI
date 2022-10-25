//
//  Player.swift
//  OnboardingSwiftUI
//
//  Created by Kseniya Smirnova on 24.10.22.
//

import AVFoundation

class Player {
    
    var player = AVPlayer(url: Bundle.main.url(forResource: video, withExtension: "mp4")!)
    
    func play() {
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: self.player.currentItem, queue: .main) { _ in
            self.player.seek(to: CMTime.zero)
            self.player.play()
        }
        player.play()
    }
    
    func pause() {
        player.pause()
    }
}
