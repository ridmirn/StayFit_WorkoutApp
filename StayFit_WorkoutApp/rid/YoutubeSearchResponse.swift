//
//  YoutubeSearchResponse.swift
//  StayFit_WorkoutApp
//
//  Created by Ridmi Natasha on 2023-05-21.
//

import Foundation


struct YoutubeSearchResponse: Codable {
    let items: [VideoElement]
}

struct VideoElement: Codable{
    let id: IdVideoElement
}

struct IdVideoElement: Codable{
    let kind: String
    let videoId: String
}
