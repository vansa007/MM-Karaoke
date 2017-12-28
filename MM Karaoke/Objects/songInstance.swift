//
//  songInstance.swift
//  MM Karaoke
//
//  Created by Vansa Pha on 12/28/17.
//  Copyright © 2017 Vansa Pha. All rights reserved.
//

import ObjectMapper

class SongInstance: Mappable {
    
    var songItem: [Song] = []
    
    init() {}
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        songItem <- map["data"]
    }
    
    
}
