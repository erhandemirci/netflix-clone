//
//  Movie.swift
//  nexflix clone
//
//  Created by erhan demirci on 22.04.2022.
//

import Foundation

struct TrendingTitleResponse: Codable {
    let results: [Title]
}

struct Title : Codable{
    let id: Int
    let media_type: String?
    let original_name: String?
    let original_title: String?
    let poster_path: String?
    let overview:String?
    let vote_count:Int
    let release_date:String?
    let vote_average:Double
    
    
}


/*
 adult = 0;
 "backdrop_path" = "/5P8SmMzSNYikXpxil6BYzJ16611.jpg";
 "genre_ids" =             (
     80,
     9648,
     53
 );
 id = 414906;
 "media_type" = movie;
 "original_language" = en;
 "original_title" = "The Batman";
 overview = "In his second year of fighting crime, Batman uncovers corruption in Gotham City that connects to his own family while facing a serial killer known as the Riddler.";
 popularity = "12712.025";
 "poster_path" = "/74xTEgt7R36Fpooo50r9T25onhq.jpg";
 "release_date" = "2022-03-01";
 title = "The Batman";
 video = 0;
 "vote_average" = "7.9";
 "vote_count" = 3405;
 */
 
