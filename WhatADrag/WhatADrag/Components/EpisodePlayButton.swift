//
//  PlayButton.swift
//  WhatADrag
//
//  Created by Abhimanyu Joshi on 8/7/23.
//

import SwiftUI

struct EpisodePlayButton: View {
    
    @EnvironmentObject var showManager: ShowManager
    var episode: Episode

    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image(systemName: "play.circle.fill")
                .resizable()
                .frame(width: 25, height: 25)
                .foregroundColor(Color("debase"))
//                .onTapGesture {
//                    EpisodeVideoPlayerView(episode: episode)
//                }
        }
    }
}

struct PlayButton_Previews: PreviewProvider {
    static var previews: some View {
        EpisodePlayButton(episode: EpisodeList[0])
            .environmentObject(ShowManager())
    }
}
