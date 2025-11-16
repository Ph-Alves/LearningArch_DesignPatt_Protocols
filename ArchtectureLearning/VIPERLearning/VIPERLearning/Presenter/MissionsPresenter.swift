//
//  MissionsPresenter.swift
//  VIPERLearning
//
//  Created by Paulo Henrique Costa Alves on 13/11/25.
//

import Foundation
import Combine

class MissionsPresenter: ObservableObject {
    
    @Published var missions: [Mission] = []
    
    private var Interactor: MissionsInteractor
    
    init(interactor: MissionsInteractor) {
        self.Interactor = interactor
        createMissions()
    }
    
    private func createMissions() {
        Interactor.defineCommand(LoadMissionsCommand())
        guard let loadMissions = Interactor.executeCommand(missions: missions, id: nil) else { return }
        Interactor.defineFormatter(StateMissionFormatter())
        guard let formattedMissions = Interactor.executeFormatter(missions: loadMissions) else { return }
        self.missions = formattedMissions
    }
    
    func completeMission(id: Mission.ID){
        Interactor.defineCommand(ToggleMissionCommand())
        guard let completeMission = Interactor.executeCommand(missions: missions, id: id) else { return }
        self.missions = completeMission
    }
    
    func addMission(_ mission: Mission) {
        guard let newMissions = Interactor.addMission(mission, in: missions) else { return }
        guard let formattedMissions = Interactor.executeFormatter(missions: newMissions) else { return }
        self.missions = formattedMissions
    }
    
    func removeMission(id: Int){
        self.missions = Interactor.removeMission(missions: missions, with: id)
    }
    
}
