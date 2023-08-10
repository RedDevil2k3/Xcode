//
//  VidePlayerView.swift
//  WhatADrag
//
//  Created by Abhimanyu Joshi on 8/7/23.
//

import SwiftUI
import AVKit

struct ShowVideoPlayerView: View {
    
    @EnvironmentObject var showManager: ShowManager
    var show: Show
    
    
    var body: some View {
        
        let url = URL(string: show.url)!
        NavigationView() {
            ZStack(alignment: .topLeading) {
                ZStack (alignment: .bottomTrailing) {
                
                    PlayerViewController(videoURL: url)
                }
            }
            .ignoresSafeArea()
        }
        .ignoresSafeArea()
    }
}

struct VidePlayerView_Previews: PreviewProvider {
    static var previews: some View {
        ShowVideoPlayerView(show: ShowList[6])
            .environmentObject(ShowManager())
    }
}
