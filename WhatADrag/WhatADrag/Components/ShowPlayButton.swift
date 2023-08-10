//
//  ShowPlayButton.swift
//  WhatADrag
//
//  Created by Abhimanyu Joshi on 8/7/23.
//

import SwiftUI

struct ShowPlayButton: View {
    
    @EnvironmentObject var showManager: ShowManager
    var show: Show

    
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

struct ShowPlayButton_Previews: PreviewProvider {
    static var previews: some View {
        ShowPlayButton(show: ShowList[0])
            .environmentObject(ShowManager())
    }
}
