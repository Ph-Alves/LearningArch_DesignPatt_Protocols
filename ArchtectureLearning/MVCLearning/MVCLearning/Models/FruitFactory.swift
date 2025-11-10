//
//  FruitFactory.swift
//  MVCLearning
//
//  Created by Paulo Henrique Costa Alves on 10/11/25.
//

import Foundation

protocol factory {
    mutating func createObjects() -> [Fruit]
}

struct FruitFactory: factory {
    mutating func createObjects() -> [Fruit] {
        let newFruits: [Fruit] = [
            Fruit(id: 0, name: "Banana", price: 5.50, quantity: 3),
            Fruit(id: 1, name: "Apple", price: 7.00, quantity: 1),
            Fruit(id: 2, name: "Tomato", price: 10.0, quantity: 2),
        ]
        
        return newFruits
    }
}
