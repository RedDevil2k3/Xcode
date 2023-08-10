//
//  EpisodeView.swift
//  WhatADrag
//
//  Created by Abhimanyu Joshi on 8/5/23.
//

import SwiftUI

struct EpisodeView: View {
    
    @EnvironmentObject var showManager: ShowManager
//    var show: Show

    var episode: Episode
    
    var body: some View {
        HStack(spacing: 20) {
            Image(episode.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150)
                .cornerRadius(10)
            Text(episode.name)
                .bold()
                .font(.title3)
                .foregroundColor(Color("debase"))
            
            Spacer()
            
//            NavigationLink(destination: EpisodeVideoPlayerView(episode: episode)
//                .environmentObject(episodeManager)) {
//                    EpisodePlayButton(episode: episode)
//                }

            Image(systemName: "play.circle.fill")
                .resizable()
                .frame(width: 25, height: 25)
                .foregroundColor(Color("debase"))
               .onTapGesture {

           }
        }
        .padding(.horizontal)
        .background(Color("base"))
        .cornerRadius(12)
        .frame(width: .infinity, alignment: .leading)
    }
}

struct EpisodeView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeView(episode: EpisodeList[0])
            //.environmentObject(ShowManager())
            .environmentObject(ShowManager())
    }
}
