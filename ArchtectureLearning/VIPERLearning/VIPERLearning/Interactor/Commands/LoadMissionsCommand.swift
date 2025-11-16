//
//  LoadMissionsCommand.swift
//  VIPERLearning
//
//  Created by Paulo Henrique Costa Alves on 13/11/25.
//

import Foundation

struct LoadMissionsCommand: MissionCommand {
    
    mutating func execute(missions: [Mission], id: UUID?) -> [Mission]{
        let newMissions = [
            Mission(titulo: "Missão 1", estado: false),
            Mission(titulo: "Missão 2", estado: false)
        ]
        
        var copyMissions = missions
        copyMissions.append(contentsOf: newMissions)
        return copyMissions
    }
}
