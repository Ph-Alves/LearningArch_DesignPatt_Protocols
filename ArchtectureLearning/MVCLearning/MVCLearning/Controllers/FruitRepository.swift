//
//  FruitRepository.swift
//  MVCLearning
//
//  Created by Paulo Henrique Costa Alves on 10/11/25.
//

import Foundation

protocol FruitRepository {
    mutating func populate()
    mutating func remove(at index: Int)
    mutating func add(_ fruit: Fruit)
    func getFruits() -> [Fruit]
}

struct FruitDeposit: FruitRepository {
    private var Factory = FruitFactory()
    
    internal var fruits: [Fruit] = []
    
    mutating func populate() {
        fruits = Factory.createObjects()
    }
    
    mutating func remove(at index: Int) {
        fruits.remove(at: index)
    }
    
    mutating func add(_ fruit: Fruit) {
        fruits.append(fruit)
    }
    
    func getFruits() -> [Fruit] {
        return fruits
    }
}
