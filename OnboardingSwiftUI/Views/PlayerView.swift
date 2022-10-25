//
//  PlayerView.swift
//  OnboardingSwiftUI
//
//  Created by Kseniya Smirnova on 22.10.22.
//

import SwiftUI
import AVKit

struct PlayerViewController: UIViewControllerRepresentable {
    private var player: AVPlayer

    init(_ player: AVPlayer) {
        self.player = player
    }

    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        controller.modalPresentationStyle = .fullScreen
        controller.player = player
        return controller
    }

    func updateUIViewController(_ playerController: AVPlayerViewController, context: Context) {}
}
