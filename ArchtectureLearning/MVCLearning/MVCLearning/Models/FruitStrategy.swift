//
//  FruitStrategy.swift
//  MVCLearning
//
//  Created by Paulo Henrique Costa Alves on 10/11/25.
//

import Foundation

protocol FruitStrategy {
    func sort(fruits: [Fruit]) -> [Fruit]
}

struct FruitNameStrategy: FruitStrategy {
    func sort(fruits: [Fruit]) -> [Fruit] {
        return fruits.sorted(by: { $0.name < $1.name })
    }
}

struct FruitPriceStrategy: FruitStrategy {
    func sort(fruits: [Fruit]) -> [Fruit] {
        return fruits.sorted(by: { $0.price < $1.price })
    }
}
