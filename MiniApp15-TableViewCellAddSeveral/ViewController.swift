//
//  ViewController.swift
//  MiniApp15-TableViewCellAddSeveral
//
//  Created by 前田航汰 on 2022/02/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    struct PersonalData {
        var service: String
        var account: String
        var password: String
        
        init(service: String, account: String, password: String){
            self.service = service
            self.account = account
            self.password = password
        }
    }

    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var helloTextLabel: UILabel!
    var personalDatas = [PersonalData]()

    override func viewWillAppear(_ animated: Bool) {
        if personalDatas.count == 0 {
            helloTextLabel.text = "情報が空です\n情報を追加して下さい"
        } else {
            helloTextLabel.text = ""
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personalDatas.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = personalDatas[indexPath.row].service
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "NextDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {

                let DetailVC = segue.destination as! DetailViewController
                DetailVC.nowIndexpath = indexPath.row
                DetailVC.serviceString = "【サービス名】\n \(personalDatas[indexPath.row].service)"
                DetailVC.accountString = "【アカウント名】\n\(personalDatas[indexPath.row].account)"
                DetailVC.passwordString = "【パスワード】\n\(personalDatas[indexPath.row].password)"
            }
        }
    }

    @IBAction func exit(segue: UIStoryboardSegue) {
        let secondVC = segue.source as! SecondViewController
        let personalData = PersonalData(service: secondVC.service, account: secondVC.account, password: secondVC.password)
        personalDatas.append(personalData)
        tableView.reloadData()
    }

    @IBAction func exitRemove(segue: UIStoryboardSegue){
        let DetailVC = segue.source as! DetailViewController
        let removeIndexpath = DetailVC.nowIndexpath
        personalDatas.remove(at: removeIndexpath)
        tableView.reloadData()
    }

}

