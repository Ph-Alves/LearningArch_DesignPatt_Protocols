//
//  MissionCommand.swift
//  VIPERLearning
//
//  Created by Paulo Henrique Costa Alves on 13/11/25.
//

import Foundation

protocol MissionCommand {
    mutating func execute(missions: [Mission], id: UUID?) -> [Mission]
}

