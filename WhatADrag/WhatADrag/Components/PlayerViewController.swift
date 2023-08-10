//
//  PlayerViewController.swift
//  WhatADrag
//
//  Created by Abhimanyu Joshi on 8/7/23.
//

import SwiftUI
import AVKit

struct PlayerViewController: UIViewControllerRepresentable {
    
    var videoURL: URL?
    
    private var player: AVPlayer {
        return AVPlayer(url: videoURL!)
    }
    
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        controller.modalPresentationStyle = .fullScreen
        controller.player = player
        controller.allowsPictureInPicturePlayback = true
        controller.entersFullScreenWhenPlaybackBegins = true
        //controller.player?.play()
        
        return controller
    }
        
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        
    }
    
}
