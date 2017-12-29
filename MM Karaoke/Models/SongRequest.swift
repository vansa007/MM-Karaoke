//
//  SongRequest.swift
//  MM Karaoke
//
//  Created by Vansa Pha on 12/28/17.
//  Copyright © 2017 Vansa Pha. All rights reserved.
//

import Alamofire
import ObjectMapper

class SongRequest {
    
    static let manager = SongRequest()
    private init (){}
    
    func getAllSongsModel(callBack: @escaping (SongInstance) -> Void) {
        Auth.manager.fetchData(api: getApiKey(base: ShareInstance.APIKEY.BASE_URL, apiName: ShareInstance.APIKEY.LIST_ALL_SONGS), body: [:], header: ShareInstance.headerSecurity) { (data: SongInstance) in
            callBack(data)
        }
    }
    
    func getApiKey(base: String, apiName: String) -> String {
        return base+apiName
    }
    
}
