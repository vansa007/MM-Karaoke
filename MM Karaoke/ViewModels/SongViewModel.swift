//
//  SongViewModel.swift
//  MM Karaoke
//
//  Created by Vansa Pha on 12/28/17.
//  Copyright © 2017 Vansa Pha. All rights reserved.
//

import RxSwift
import ObjectMapper

class SongViewModel {
    var instance = SongInstance()
    
    init() {}
    
    func getToken(id: String) {
        Auth.manager.requestToken(id: id)
    }
    
    func getAllSongs(completion: @escaping (Error?)->Void) {
        Auth.manager.fetchData(api: ShareInstance.APIKEY.LIST_ALL_SONGS, body: [:], header: ShareInstance.headerSecurity) { (response) in
            if response.response?.statusCode == 200 {
                guard let json = response.result.value as? Dictionary<String, AnyObject> else { return }
                let myData: SongInstance = Mapper<SongInstance>()
                    .map(JSONString: String(data: try! JSONSerialization.data(withJSONObject: json, options: []), encoding: .utf8)!)!
                self.instance = myData
                completion(nil)
            }else {
                completion(response.result.error)
            }
        }
    }
}
