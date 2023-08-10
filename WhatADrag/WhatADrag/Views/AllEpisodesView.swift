//
//  AllEpisodesView.swift
//  WhatADrag
//
//  Created by Abhimanyu Joshi on 8/5/23.
//

import SwiftUI

struct AllEpisodesView: View {
    
    @EnvironmentObject var showManager: ShowManager
    
    var column = [GridItem(.adaptive(minimum: 300), spacing: 20)]
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: column, spacing: 20) {
                    ForEach(EpisodeList, id: \.id) { episode in
                        NavigationLink {
                            EpisodeVideoPlayerView(episode: episode)
                        } label: {
                            EpisodeView(episode: episode)
                                .environmentObject(showManager)
                        }
                    }
                }
                .padding()
                .background(Color("base"))
            }
            .ignoresSafeArea()
        }
    }
}

struct AllEpisodesView_Previews: PreviewProvider {
    static var previews: some View {
        AllEpisodesView()
            .environmentObject(ShowManager())
    }
}
