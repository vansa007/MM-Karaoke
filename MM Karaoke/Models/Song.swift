//
//  Song.swift
//  MM Karaoke
//
//  Created by Vansa Pha on 12/28/17.
//  Copyright © 2017 Vansa Pha. All rights reserved.
//

import ObjectMapper

class Song: Mappable {
    
    //visual properties song
    var songId: String = ""
    var songTitle: String = ""
    var songArtist: String = ""
    var songLikeCount: String = ""
    
    //constructor
    init() {}
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        songId          <- map["song_id"]
        songTitle       <- map["song_title"]
        songArtist      <- map["song_artist"]
        songLikeCount   <- map["song_like"]
    }
}
