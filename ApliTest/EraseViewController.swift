//
//  EraseViewController.swift
//  ApliTest
//
//  Created by GUERNEVÉ Sébastien on 23/10/2020.
//  Copyright © 2020 GUERNEVÉ Sébastien. All rights reserved.
//

import UIKit

class EraseViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var erasedMailTableView: UITableView!
    
    let _ERASED_MAIL = eraseMail()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        _ERASED_MAIL.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_errase_mail", for: indexPath)
        if let textLabel = cell.textLabel {
            textLabel.text = _ERASED_MAIL.getListEraseMail(at: indexPath.row)
        }
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        erasedMailTableView.dataSource = self
    }
}
