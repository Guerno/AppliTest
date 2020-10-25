//
//  ConfirmAddViewController.swift
//  AppliTest
//
//  Created by GUERNEVÉ Sébastien on 23/10/2020.
//  Copyright © 2020 GUERNEVÉ Sébastien. All rights reserved.
//

import UIKit

class ConfirmAddViewController: UIViewController {
    
    @IBOutlet weak var addressToConfirm: UILabel!
    
    var _ADDRESS_MAIL_TO_CONFIRM:String = ""
    var _mail:mail?
    var _confirmAddMail = false
    
    @IBAction func buttonConfirm() {
        _mail?.addMail(newAddressMail: _ADDRESS_MAIL_TO_CONFIRM)
        _confirmAddMail = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addressToConfirm.text = _ADDRESS_MAIL_TO_CONFIRM
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if _confirmAddMail == true, let nextScreen = segue.destination as? ViewController {
            nextScreen.ui_newAddressTextField.text = ""
        }
    }
}
