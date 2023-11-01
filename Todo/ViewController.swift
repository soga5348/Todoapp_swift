//
//  ViewController.swift
//  Todo
//
//  Created by soga syunto on 2023/10/16.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 //リストの数を設定する
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") //cellはStep2で指定した文字列
        cell?.textLabel?.text = "左に表示されるテキスト"
        cell?.detailTextLabel?.text = "右に表示されるテキスト"
        return cell!
    }


}

