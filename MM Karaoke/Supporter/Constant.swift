//
//  Constant.swift
//  MM Karaoke
//
//  Created by Vansa Pha on 12/28/17.
//  Copyright © 2017 Vansa Pha. All rights reserved.
//

import Foundation

struct ShareInstance {
    struct App {
        static let JWT_KEY = "MbQeThWmZq4t7w!z%C*F-JaNdRfUjXn"
        static var TOKEN_KEY = ""
        static var USER_ID = ""
    }
    struct APIKEY {
        static let BASE_URL = "http://192.168.2.4/mmks/api/"
        static let TOKEN_URL = "http://192.168.2.4/mmks/auth/token/"
        static let LIST_ALL_SONGS = "listallsongs"
    }
    static let headerSecurity = [
        "Authorization" : App.TOKEN_KEY,
        "Identify" : App.USER_ID.toBase64()+App.JWT_KEY
    ]
}

extension String {
    
    func fromBase64() -> String? {
        guard let data = Data(base64Encoded: self) else {
            return nil
        }
        
        return String(data: data, encoding: .utf8)
    }
    
    func toBase64() -> String {
        return Data(self.utf8).base64EncodedString()
    }
}
