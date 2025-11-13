//
//  MockData.swift
//  MVVMLearning
//
//  Created by Paulo Henrique Costa Alves on 12/11/25.
//

import Foundation

var MockData: [Group] = [
    Group(title: "Group 1", children: [
        Item(title: "Tarefa1", isDone: false),
        Group(title: "Group1-1", children: [
            Item(title: "Tarefa2", isDone: false)
        ])
    ]),
    Group(title: "Group 2", children: [
        Item(title: "Tarefa3", isDone: false)
    ])
]
