//
//  erraseMail.swift
//  AppliTest
//
//  Created by GUERNEVÉ Sébastien on 23/10/2020.
//  Copyright © 2020 GUERNEVÉ Sébastien. All rights reserved.
//

import Foundation

class eraseMail {
    private let _USER_DEFAULT_STANDARD = "mailErase"
    private var _listMail:[String]
    
    init () {
        if let listMail = UserDefaults.standard.array(forKey: _USER_DEFAULT_STANDARD) as? [String] {
            _listMail = listMail
        } else {
            _listMail = []
        }
    }
    
    func count () -> Int {
        return _listMail.count
    }
    
    func getListEraseMail (at index:Int) -> String {
        return _listMail[index]
    }
    
    func addEraseMail (erasedMail mail:String) {
        _listMail.append(mail)
        saveErasedMail()
    }
    
    private func saveErasedMail () {
        UserDefaults.standard.set(_listMail, forKey: _USER_DEFAULT_STANDARD)
    }
}
