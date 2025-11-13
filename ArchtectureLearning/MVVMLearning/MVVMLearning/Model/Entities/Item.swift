//
//  Item.swift
//  MVVMLearning
//
//  Created by Paulo Henrique Costa Alves on 10/11/25.
//

import Foundation

class Item: Identifiable, Element {
    var id = UUID()
    var title: String
    var dueDate: Date?
    var isDone: Bool
    var notes: String?
    
    init(title: String, dueDate: Date? = nil, isDone: Bool, notes: String? = nil) {
        self.title = title
        self.dueDate = dueDate
        self.isDone = isDone
        self.notes = notes
    }
    
    // O execute é so um template, mas no lugar dele em um caso real, ele funciona diferente
    // O execute será substituido por qualquer método pela qual você precisa fazer algo
    // na folha, mas você usa os objetos complexos somente para percorrer a árvore
    // Nesse caso de exemplo, o nosso todo list, pode marcar a tarefa como completa.
    func execute() {
        print("Sou um item e estou executando uma tarefa única")
        isDone.toggle()
    }
    
    func returnSelf() -> Self {
        return self
    }
}
