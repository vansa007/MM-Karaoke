//
//  Auth.swift
//  MM Karaoke
//
//  Created by Vansa Pha on 12/28/17.
//  Copyright © 2017 Vansa Pha. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import SwiftyJSON

class Auth {
    
    static let manager = Auth()
    typealias CompletionHandler = (_ status: Bool) -> ()
    private init (){}
    
    func requestToken(id: String)  {
        Alamofire.request(ShareInstance.APIKEY.TOKEN_URL+id).responseJSON { (response) in
            if response.result.error == nil {
                if let result = response.result.value {
                    if let data = result as? Dictionary<String, AnyObject> {
                        if let token = data["token"] as? String {
                            ShareInstance.App.TOKEN_KEY = token
                            print("Token: ", ShareInstance.App.TOKEN_KEY)
                        }
                    }
                }
            }
        }
    }
    
    func fetchData(api: String, body: Dictionary<String, String>, header: Dictionary<String, String>) {
        Alamofire.request(api, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            if response.result.error == nil {
                print("Header: ", header)
                print("Song list: ", response.result.value ?? (Any).self)
            }else {
                debugPrint(response.result.error as Any)
            }
        }
    }
}
