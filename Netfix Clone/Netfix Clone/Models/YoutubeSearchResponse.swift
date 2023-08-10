//
//  YoutubeSearchResponse.swift
//  Netfix Clone
//
//  Created by Abhimanyu Joshi on 7/21/23.
//

import Foundation


struct YoutubeSearchResponse: Codable {
    let items: [VideoElement]
}

struct VideoElement: Codable {
    let id: IdVideoElement
}

struct IdVideoElement: Codable {
    let kind: String
    let videoId: String
}
