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
    }
    struct APIKEY {
        static let BASE_URL = "http://localhost/mmks/api/"
        static let TOKEN_URL = "http://192.168.2.4/mmks/auth/token/"
        static let LIST_ALL_SONGS = "listallsongs"
    }
}
