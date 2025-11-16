//
//  MissionFormatterTemplate.swift
//  VIPERLearning
//
//  Created by Paulo Henrique Costa Alves on 13/11/25.
//

import Foundation

protocol MissionFormatterTemplate {
    mutating func formatted(mission: Mission) -> Mission
    func changeTitleHook(mission: Mission) -> Mission
}
