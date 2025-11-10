//
//  FruitController.swift
//  MVCLearning
//
//  Created by Paulo Henrique Costa Alves on 10/11/25.
//

import Foundation
import Combine

class FruitController: ObservableObject {
    
    var repository: FruitRepository = FruitDeposit()
    var strategy: FruitStrategy = FruitNameStrategy()
    
    @Published var fruits: [Fruit] = []
    
    init() {
        fruits = getFruits()
    }
    
    func getFruits() -> [Fruit] {
        repository.populate()
        let repositoryFruits = repository.getFruits()
        let ordenedFruits = strategy.sort(fruits: repositoryFruits)
        fruits = ordenedFruits
        return ordenedFruits
    }
    
    func addFruit(_ fruit: Fruit) {
        repository.add(fruit)
        let ordenedFruits = strategy.sort(fruits: fruits)
        fruits = ordenedFruits
    }
}
