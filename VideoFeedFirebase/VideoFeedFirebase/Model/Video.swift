//
//  Video.swift
//  VideoFeedFirebase
//
//  Created by Abhimanyu Joshi on 7/31/23.
//

import Foundation

struct Video: Identifiable, Decodable {
    let videoUrl: String
    
    var id: String {
        return NSUUID().uuidString
    }
}
