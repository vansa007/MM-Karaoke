//
//  SongViewModel.swift
//  MM Karaoke
//
//  Created by Vansa Pha on 12/28/17.
//  Copyright © 2017 Vansa Pha. All rights reserved.
//

import RxSwift

struct SongViewModel {
    let data = Variable<SongInstance>(SongInstance())
    let songRequest = SongRequest()
    
    init() {}
    
    func getToken(id: String) {
        Auth.manager.requestToken(id: id)
    }
}
