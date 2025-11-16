//
//  MissionBuilder.swift
//  VIPERLearning
//
//  Created by Paulo Henrique Costa Alves on 13/11/25.
//

import Foundation
import SwiftUI

struct MissionBuilder: MissionBuilderProtocol {
    private var product: MissionsView?
    private var interactor: MissionsInteractor?
    private var presenter: MissionsPresenter?
    private var router: MissionsRouter?
    private var formatter: MissionFormatterTemplate?
    private var command: MissionCommand?
    
    mutating func reset() {
        product = nil
    }
    
    mutating func createPresenter() {
        guard let interactor = interactor else { return }
        self.presenter = MissionsPresenter(interactor: interactor)
    }
    
    mutating func createInteractor() {
        guard let command, let formatter else { return }
        self.interactor = MissionsInteractor(command: command, formatter: formatter)
    }
    
    mutating func createRouter() {
        self.router = MissionsRouter()
    }
    
mutating func createFormatterTemplate() {
        self.formatter = MissionFormatter()
    }
    
    mutating func createCommand() {
        self.command = LoadMissionsCommand()
    }
    
    mutating func createView() {
        guard let presenter else { return }
        self.product = MissionsView(presenter: presenter)
    }
    
    mutating func returnProduct() -> MissionsView {
        guard let product else { fatalError("Product not built yet.") }
        reset()
        return product
    }
}
