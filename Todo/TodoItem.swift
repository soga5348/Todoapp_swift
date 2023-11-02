//
//  TodoItem.swift
//  Todo
//
//  Created by soga syunto on 2023/11/01.
//

import Foundation
import RealmSwift

class TodoItem: Object {
    @objc dynamic var id = ""
    @objc dynamic var title = ""
    @objc dynamic var date = Date()
}
