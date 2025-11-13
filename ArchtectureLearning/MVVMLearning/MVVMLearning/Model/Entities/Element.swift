//
//  Element.swift
//  MVVMLearning
//
//  Created by Paulo Henrique Costa Alves on 12/11/25.
//

import Foundation

protocol Element {
    var title: String { get }
    
    func execute() -> Void
    
    func returnSelf() -> Self
}
