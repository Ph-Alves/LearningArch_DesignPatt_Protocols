//
//  MissionsInteractor.swift
//  VIPERLearning
//
//  Created by Paulo Henrique Costa Alves on 13/11/25.
//

import Foundation
import Combine

class MissionsInteractor {
    private var missionCommand: MissionCommand
    private var missionFormatter: MissionFormatterTemplate
    
    init(command: MissionCommand, formatter: MissionFormatterTemplate) {
        self.missionCommand = command
        self.missionFormatter = formatter
    }
    
    func defineCommand(_ command: MissionCommand) {
        self.missionCommand = command
    }
    
    func executeCommand(missions: [Mission], id: UUID?) -> [Mission]? {
        if missionCommand is ToggleMissionCommand {
            return missionCommand.execute(missions: missions, id: id)
        } else if missionCommand is LoadMissionsCommand {
            return missionCommand.execute(missions: missions, id: nil)
        } else {
            return nil
        }
    }
    
    func defineFormatter(_ formatter: MissionFormatterTemplate) {
        self.missionFormatter = formatter
    }
    
    func executeFormatter(missions: [Mission]) -> [Mission]? {
        return missions.map { missionFormatter.formatted(mission: $0) }
    }
    
    func addMission(_ mission: Mission, in missions: [Mission]) -> [Mission]? {
        var copyMissions = missions
        let copyMission = mission
        let missionFormatted = missionFormatter.formatted(mission: copyMission)
        copyMissions.append(missionFormatted)
        return copyMissions
    }
    
    func removeMission(missions: [Mission], with index: Int) -> [Mission] {
        var copyMissions = missions
        copyMissions.remove(at: index)
        return copyMissions
    }
}
