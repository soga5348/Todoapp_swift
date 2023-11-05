//
//  AddView.swift
//  Todo
//
//  Created by soga syunto on 2023/11/02.
//

import UIKit
import RealmSwift

class AddView: UIViewController {

    @IBOutlet weak var itemField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tapGesture)
        
        

        // Do any additional setup after loading the view.
        datePicker.timeZone = TimeZone.current
        datePicker.locale = Locale.current
    }
    
    @IBAction func onAdd(_ sender: Any) {
        
        let item = TodoItem()
        item.title = itemField.text!
        item.date = datePicker.date
        item.id = String(Int.random(in: 0...9999))
        try! realm.write {
           realm.add(item)
        }
        dismiss(animated: true, completion: nil)
    }
    
    @objc func handleTap() {
        view.endEditing(true) // 画面上のどこかをタップしたときにキーボードを閉じる
    }
    
    
}
