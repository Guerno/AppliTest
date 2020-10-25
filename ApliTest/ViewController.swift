//
//  ViewController.swift
//  ApliTest
//
//  Created by GUERNEVÉ Sébastien on 23/10/2020.
//  Copyright © 2020 GUERNEVÉ Sébastien. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    let _MAIL = mail()
    let _ERASED_MAIL = eraseMail()
    var _valueMailSelected:String?
    
    @IBOutlet weak var ui_newAddressTextField: UITextField!
    @IBOutlet weak var listMailTableView: UITableView!
    @IBOutlet weak var buttonSave: UIButton!
    
    @IBAction func copyToClipboard() {
        if let text = _valueMailSelected, text.count > 0 {
            UIPasteboard.general.string = text
        }
    }
    
    @IBAction func uniwindToMainScreen (segue:UIStoryboardSegue) {}
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _MAIL.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = listMailTableView.dequeueReusableCell(withIdentifier: "cell_address_mail", for: indexPath)
        if let text = cell.textLabel {
            text.numberOfLines = 0
            text.text = _MAIL.getListMail(at: indexPath.row)
        }
        ui_newAddressTextField.resignFirstResponder()
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        _ERASED_MAIL.addEraseMail(erasedMail:_MAIL.getListMail(at: indexPath.row))
        _MAIL.suppMail(at: indexPath.row)
        listMailTableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        _valueMailSelected = _MAIL.getListMail(at: indexPath.row)
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        textField.text = ""
        ui_newAddressTextField.resignFirstResponder()
        return false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        buttonSave.sendActions(for: .touchUpInside)
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        listMailTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listMailTableView.dataSource = self
        ui_newAddressTextField.delegate = self
        listMailTableView.delegate = self
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue_confirm_add" {
            if let text = ui_newAddressTextField.text, isValidEmail(text) == true {
                if let nextScreen = segue.destination as? ConfirmAddViewController {
                    nextScreen._ADDRESS_MAIL_TO_CONFIRM = text
                    nextScreen._mail = _MAIL
                }
            } else {
                let alertText = "L'adresse mail : \(ui_newAddressTextField.text!) n'est pas dans le bon format"
                let alertBox = UIAlertController(title: "Format de mail non valide", message: alertText, preferredStyle: .actionSheet)
                alertBox.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alertBox, animated: true, completion: nil)
            }
        }
    }
    
    /// Vérification du format Adresse Mail
    /// - Parameter email: la chaine de caractère à tester
    /// - Returns: True si c'est une adresse mail
    func isValidEmail(_ email: String) -> Bool {
        let mailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let mailPred = NSPredicate(format:"SELF MATCHES %@", mailRegEx)
        return mailPred.evaluate(with: email)
    }
}
