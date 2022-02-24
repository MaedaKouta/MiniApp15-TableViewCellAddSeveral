//
//  DetailViewController.swift
//  MiniApp15-TableViewCellAddSeveral
//
//  Created by 前田航汰 on 2022/02/24.
//

import UIKit

class DetailViewController: UIViewController {

    var nowIndexpath = 0
    var serviceString = ""
    var accountString = ""
    var passwordString = ""
    @IBOutlet weak var serviceTextLabel: UILabel!
    @IBOutlet weak var accountTextLabel: UILabel!
    @IBOutlet weak var passwordTextLabel: UILabel!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        serviceTextLabel.text = serviceString
        accountTextLabel.text = accountString
        passwordTextLabel.text = passwordString
    }

}
