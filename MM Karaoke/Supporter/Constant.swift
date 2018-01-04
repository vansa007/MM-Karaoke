//
//  Constant.swift
//  MM Karaoke
//
//  Created by Vansa Pha on 12/28/17.
//  Copyright © 2017 Vansa Pha. All rights reserved.
//

import UIKit

struct ShareInstance {
    struct App {
        static let JWT_KEY = "MbQeThWmZq4t7w!z%C*F-JaNdRfUjXn"
        static var TOKEN_KEY = ""
        static var USER_ID = ""
    }
    struct APIKEY {
        static let BASE_URL = "http://192.168.8.104/mmks/api/"
        static let TOKEN_URL = "http://192.168.8.104/mmks/auth/token/"
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

extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        
        get{
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = borderColor?.cgColor
        }
    }
}

extension UIViewController {
    
    func setAlertViewController(myTitle: String, myMessage: String) {
        let alert = UIAlertController(title: myTitle, message: myMessage, preferredStyle: .alert)
        let btn = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(btn)
        self.present(alert, animated: true, completion: nil)
    }
    
}
