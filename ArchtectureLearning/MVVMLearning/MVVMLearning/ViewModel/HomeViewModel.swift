//
//  HomeViewModel.swift
//  MVVMLearning
//
//  Created by Paulo Henrique Costa Alves on 10/11/25.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    private var taskManager: TaskManager = TaskManager.shared
    @Published var groups: [Group]
    @Published var items: [Item]
    
    init() {
        let rootGroups = TaskManager.shared.groups
        let flattenedGroups: [Group] = rootGroups.flatMap { group in
            [group] + group.allGroups()
        }
        
        self.groups = flattenedGroups
        self.items = rootGroups.flatMap { $0.allItems() }
    }
    
    func createItem(groupNumber: Int, title: String, date: Date, notes: String?) {
        let newItem = taskManager.createItem(groupNumber: groupNumber, title: title, date: date, notes: notes)
        items.append(newItem)
    }
    
    func createGroup(groupNumber: Int?, title: String) {
        let newGroup = taskManager.createGroup(groupNumber: groupNumber, title: title)
        guard let groupNumber else {
            groups.append(newGroup)
            return
        }
        
        if groupNumber < groups.count {
            groups[groupNumber].children.append(newGroup)
        } else {
            print("Cannot put this group in the list")
        }
    }
    
    func getItemsFor(group: Group) -> [Item] {
        group.allItems()
    }
    
    func executeItem(item: Item) {
        item.execute()
        groups = groups
    }
}
