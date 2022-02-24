//
//  SecondViewController.swift
//  MiniApp15-TableViewCellAddSeveral
//
//  Created by 前田航汰 on 2022/02/22.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak private var serviceTextField: UITextField!
    @IBOutlet weak private var accountTextField: UITextField!
    @IBOutlet weak private var passwordTextField: UITextField!
    
    var service = ""
    var account = ""
    var password = ""

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func didTapdidTapRegisterButton(_ sender: Any) {
        if serviceTextField.text?.isEmpty == false, accountTextField.text?.isEmpty == false, passwordTextField.text?.isEmpty == false {
            service = serviceTextField.text ?? ""
            account = accountTextField.text ?? ""
            password = passwordTextField.text ?? ""
            performSegue(withIdentifier: "exit", sender: sender)
        } else {
            print("一部分が入力されていません")
        }
    }
    
}
