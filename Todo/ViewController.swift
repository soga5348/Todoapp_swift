//
//  ViewController.swift
//  Todo
//
//  Created by soga syunto on 2023/10/16.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var itemList:Results<TodoItem>!
    let realm = try! Realm()
    var token:NotificationToken!
    @IBOutlet weak var tableview: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        itemList = realm.objects(TodoItem.self).sorted(byKeyPath: "date")
        token = realm.observe { notification, realm in
            //変更があった場合にここが実行される
            self.tableview.reloadData()

        }
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList.count // itemListの要素数を返す
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        let item = itemList[indexPath.row]
        cell?.textLabel?.text = item.title
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd HH:mm"
        cell?.detailTextLabel?.text = formatter.string(from: item.date)
        return cell!
    }

}

