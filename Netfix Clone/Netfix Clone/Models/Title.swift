//
//  Movie.swift
//  Netfix Clone
//
//  Created by Abhimanyu Joshi on 7/19/23.
//

import Foundation

struct TrendingTitleResponse: Codable {  //we need to confirm this with a codalbe protocol or else it will return an error while calling. it is for encoder and decoder protocol.
    let results: [Title] //this is an array
}

struct Title: Codable {
    let id: Int
    let media_type: String? //making it an optional parameter with ?
    let original_name: String?
    let original_title: String?
    let poster_path:String?
    let overview: String?
    let vote_count: Int
    let release_date: String?
    let vote_average: Double    
}

/*
 {
adult = 0;
"backdrop_path" = "/yF1eOkaYvwiORauRCPWznV9xVvi.jpg";
"genre_ids" =             (
 28,
 12,
 878
);
id = 298618;
"media_type" = movie;
"original_language" = en;
"original_title" = "The Flash";
overview = "When his attempt to save his family inadvertently alters the future, Barry Allen becomes trapped in a reality in which General Zod has returned and there are no Super Heroes to turn to. In order to save the world that he is in and return to the future that he knows, Barry's only hope is to race for his life. But will making the ultimate sacrifice be enough to reset the universe?";
popularity = "1513.344";
"poster_path" = "/rktDFPbfHfUbArZ6OOOKsXcv0Bm.jpg";
"release_date" = "2023-06-13";
title = "The Flash";
video = 0;
"vote_average" = "6.923";
"vote_count" = 1071;
},
 
 */
