//
//  mail.swift
//  ApliTest
//
//  Created by GUERNEVÉ Sébastien on 23/10/2020.
//  Copyright © 2020 GUERNEVÉ Sébastien. All rights reserved.
//

import Foundation

class mail {
    private let _USER_DEFAULT_STANDARD = "mailSave"
    private var _listMail:[String]
    
    init() {
        if let list = UserDefaults.standard.array(forKey: _USER_DEFAULT_STANDARD) as? [String] {
            _listMail = list
        } else {
            _listMail = []
        }
    }
    
    func getListMail (at:Int) -> String {
        return _listMail[at]
    }
    
    func count () -> Int {
        return _listMail.count
    }
    
    func addMail (newAddressMail mail:String) {
        _listMail.append(mail)
        saveListe()
    }
    
    func suppMail (at index:Int) {
        _listMail.remove(at: index)
        saveListe()
    }
    
    private func saveListe (){
        UserDefaults.standard.set(_listMail, forKey: _USER_DEFAULT_STANDARD)
    }
}
