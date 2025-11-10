//
//  ContentView.swift
//  MVCLearning
//
//  Created by Paulo Henrique Costa Alves on 10/11/25.
//


import SwiftUI

struct FruitsView: View {
    @StateObject var fruitController = FruitController()
    
    var body: some View {
        let fruits = fruitController.fruits
        
        VStack {
            List() {
                ForEach(fruits, id: \.self) { fruit in
                    VStack(alignment: .leading) {
                        Text(fruit.name)
                            .font(.headline)
                        Text("Unity Price: \(fruit.price, specifier: "%.2f")")
                            .font(.subheadline)
                        Text("Quantity: \(fruit.quantity)")
                            .font(.subheadline)
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    FruitsView()
}
