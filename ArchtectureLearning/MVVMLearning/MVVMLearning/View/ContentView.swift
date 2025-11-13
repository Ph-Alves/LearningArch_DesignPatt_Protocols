//
//  ContentView.swift
//  MVVMLearning
//
//  Created by Paulo Henrique Costa Alves on 10/11/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: HomeViewModel = HomeViewModel()
    
    var body: some View {
        VStack {
            List {
                ForEach ($viewModel.groups){ $group in
                    VStack{
                        Text(group.title)
                            .font(.headline)
                    }
                    ForEach (viewModel.getItemsFor(group: group)){ child in
                            HStack {
                                Button {
                                    viewModel.executeItem(item: child)
                                } label: {
                                    Image(systemName: child.isDone ? "checkmark.circle.fill" : "circle")
                                }
                                Text(child.title)
                            }
                        }
                    }
                }
            }
    }
}

#Preview {
    ContentView()
}
