//
//  TaskManager.swift
//  MVVMLearning
//
//  Created by Paulo Henrique Costa Alves on 12/11/25.
//

import Foundation

class TaskManager {
    
    var groups: [Group] = []
    
    static var shared = TaskManager()
    
    private init() {
        groups = MockData
    }
    
    func createItem(groupNumber: Int, title: String, date: Date, notes: String?) -> Item {
        return Item(title: title, dueDate: date, isDone: false, notes: notes)
    }
    
    func createGroup(groupNumber: Int?, title: String) -> Group {
        return Group(title: title, children: [])
    }
}
