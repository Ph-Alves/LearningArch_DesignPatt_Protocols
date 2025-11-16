//
//  StateMissionFormatter.swift
//  VIPERLearning
//
//  Created by Paulo Henrique Costa Alves on 13/11/25.
//

import Foundation

struct StateMissionFormatter: MissionFormatterTemplate {
    
    mutating func formatted(mission: Mission) -> Mission {
        let formattedMission = changeTitleHook(mission: mission)
        return formattedMission
    }
    
    internal func changeTitleHook(mission: Mission) -> Mission {
        var mission = mission
        mission.titulo = "Essa missão: \(mission.titulo) está: \(mission.estado)"
        return mission
    }
}
