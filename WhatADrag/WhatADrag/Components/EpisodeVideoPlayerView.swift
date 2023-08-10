//
//  EpisodeVideoPlayerView.swift
//  WhatADrag
//
//  Created by Abhimanyu Joshi on 8/7/23.
//

import SwiftUI

struct EpisodeVideoPlayerView: View {
    
    @EnvironmentObject var showManager: ShowManager
    var episode: Episode
    
    
    var body: some View {
        
        let url = URL(string: episode.url)!
        NavigationView() {
            ZStack(alignment: .topLeading) {
                ZStack (alignment: .bottomTrailing) {
                
                    PlayerViewController(videoURL: url)
                }
            }
            .ignoresSafeArea()
        }
        .navigationTitle(Text("Video PLayer"))
        .ignoresSafeArea()
    }
}

struct EpisodeVideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeVideoPlayerView(episode: EpisodeList[0])
            .environmentObject(ShowManager())
    }
}
