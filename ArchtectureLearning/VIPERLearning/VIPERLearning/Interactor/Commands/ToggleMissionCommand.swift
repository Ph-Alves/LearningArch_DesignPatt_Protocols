//
//  ToggleMissionCommand.swift
//  VIPERLearning
//
//  Created by Paulo Henrique Costa Alves on 13/11/25.
//

import Foundation


struct ToggleMissionCommand: MissionCommand {
    mutating func execute(missions: [Mission], id: UUID?) -> [Mission]{
        guard let id else { return missions }
        var copyMissions = missions
        guard let index = copyMissions.firstIndex(where: { $0.id == id }) else { return missions }
        copyMissions[index].estado.toggle()
        return copyMissions
    }
}
