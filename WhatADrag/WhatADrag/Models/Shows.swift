//
//  Shows.swift
//  WhatADrag
//
//  Created by Abhimanyu Joshi on 8/5/23.
//

import Foundation

protocol Details: Identifiable {
    
    var name: String { get set }
    var image: String { get set }
    var description: String { get set }
    var url: String { get set }
    var count: Int { get set }
}

struct Show: Details {
    
    var id = UUID()
    var name: String
    var image: String
    var description: String
    var url: String
    var count: Int
}

struct Episode: Details {
    
    var id = UUID()
    var name: String
    var image: String
    var description: String
    var url: String
    var count: Int
}

var ShowList = [

    Show(
        name: "Naruto",
        image: "cover0",
        description: "Naruto is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, a young ninja who seeks recognition from his peers and dreams of becoming the Hokage, the leader of his village.",
        url: "https://firebasestorage.googleapis.com/v0/b/videofeediosapp.appspot.com/o/Promised_Neverland%2Fep1.mp4?alt=media&token=5b046403-8db7-4e7e-8577-fb26f8be4781",
        count: 1),


    Show(
        name: "Attack on Titans",
        image: "cover1",
        description: "Attack on Titans",
        url: "https://youtu.be/LKP-vZvjbh8",
        count: 2),

    Show(
        name: "Demon Slayer",
        image: "cover2",
        description: "Demon Slayer",
        url: "https://youtu.be/YkJvHe3KK2c",
        count: 3),

    Show(
        name: "Blood of Zeus",
        image: "cover3",
        description: "Blood of Zeus",
        url: "https://youtu.be/_7-JFAcAEK4",
        count: 4),

    Show(
        name: "One Punch Man",
        image: "cover4",
        description: "One Punch Man",
        url: "https://youtu.be/R4vjJrGeh1c",
        count: 5),

    Show(
        name: "Boruto",
        image: "cover5",
        description: "Boruto",
        url: "https://youtu.be/_nBQoEzsYps",
        count: 6),

    Show(
        name: "Promised Neverland",
        image: "cover6",
        description: "Promised Neverland",
        url: "https://firebasestorage.googleapis.com/v0/b/videofeediosapp.appspot.com/o/Promised_Neverland%2Fep1.mp4?alt=media&token=5b046403-8db7-4e7e-8577-fb26f8be4781",
        count: 7),
]




var EpisodeList = [

    Episode(
        name: "Episode 1",
        image: "ep1",
        description: "Episode description",
        url: "https://firebasestorage.googleapis.com/v0/b/videofeediosapp.appspot.com/o/Promised_Neverland%2Fep1.mp4?alt=media&token=5b046403-8db7-4e7e-8577-fb26f8be4781",
        count: 1),


    Episode(
        name: "Episode 2",
        image: "ep2",
        description: "Episode description",
        url: "https://youtu.be/LKP-vZvjbh8",
        count: 2),

    Episode(
        name: "Episode 3",
        image: "ep3",
        description: "Episode description",
        url: "https://youtu.be/YkJvHe3KK2c",
        count: 3),

    Episode(
        name: "Episode 4",
        image: "ep4",
        description: "Episode description",
        url: "https://youtu.be/_7-JFAcAEK4",
        count: 4),

    Episode(
        name: "Episode 5",
        image: "ep5",
        description: "Episode description",
        url: "https://youtu.be/R4vjJrGeh1c",
        count: 5),

    Episode(
        name: "Episode 6",
        image: "ep6",
        description: "Episode description",
        url: "https://youtu.be/_nBQoEzsYps",
        count: 6),

    Episode(
        name: "Episode 7",
        image: "ep7",
        description: "Episode description",
        url: "https://youtu.be/yB2t5y7ujlg",
        count: 7),
]
