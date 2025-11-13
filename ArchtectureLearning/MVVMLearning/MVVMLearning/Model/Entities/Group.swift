//
//  Group.swift
//  MVVMLearning
//
//  Created by Paulo Henrique Costa Alves on 12/11/25.
//

import Foundation

class Group: Identifiable, Element {
    var id = UUID()
    var title: String
    var children: [any Element]
    
    init(title: String, children: [any Element]) {
        self.title = title
        self.children = children
    }
    
    func addChild(_ child: any Element) {
        children.append(child)
    }
    
    func execute() {
        for child in children.indices {
            children[child].execute()
        }
    }
    
    func allGroups() -> [Group] {
        var result: [Group] = []
        for child in children {
            switch child {
            case let group as Group:
                result.append(group)
            default:
                break
            }
        }
        return result
    }
    
    func allItems() -> [Item] {
        var result: [Item] = []
        for child in children {
            switch child {
            case let item as Item:
                result.append(item)
            default:
                break
            }
        }
        return result
    }
    
    func returnSelf() -> Self {
        return self
    }
}
