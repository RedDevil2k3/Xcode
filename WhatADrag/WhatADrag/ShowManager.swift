//
//  ShowManager.swift
//  WhatADrag
//
//  Created by Abhimanyu Joshi on 8/5/23.
//

import Foundation

class ShowManager: ObservableObject {
    
    @Published private(set) var shows: [Show] = []
    
    func addToWatch(show: Show) {
        shows.append(show)
    }
    
    func removeFromWatch(show: Show) {
        shows = shows.filter{ $0.id != show.id}
    }
}

class EpisodeManager: ShowManager {
    
    @Published private(set) var episodes: [Episode] = []
    
    func addToWatch(episode: Episode) {
        episodes.append(episode)
    }
    
    func removeFromWatch(episode: Episode) {
        episodes = episodes.filter{ $0.id != episode.id}
    }
}
